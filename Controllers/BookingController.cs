using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebKhachSan.Models;
using WebKhachSan.Data;
using Microsoft.Extensions.Localization;
using System.Net.Mail;
using System.Net;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI.Services;

namespace WebKhachSan.Controllers
{
    public class BookingController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IStringLocalizer<BookingController> _localizer;
        private readonly IConfiguration _configuration;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly IEmailSender _emailSender; // Added IEmailSender

        public BookingController(ApplicationDbContext context, IEmailSender emailSender, UserManager<ApplicationUser> userManager, IStringLocalizer<BookingController> localizer, IConfiguration configuration)
        {
            _context = context;
            _localizer = localizer;
            _configuration = configuration;
            _userManager = userManager;
            _emailSender = emailSender; // Initialize IEmailSender
        }

        [HttpPost]
        public async Task<IActionResult> Create(int roomId, DateTime checkInDate, DateTime checkOutDate, int numberOfGuests, string email)
        {
            if (!ModelState.IsValid)
            {
                return RedirectToAction("Details", "Room", new { id = roomId });
            }

            var room = await _context.Rooms.FindAsync(roomId);
            if (room == null)
            {
                return NotFound();
            }

            // Kiểm tra ngày đặt phòng
            if (checkInDate.Date < DateTime.Now.Date || checkOutDate.Date <= checkInDate.Date)
            {
                ModelState.AddModelError("", _localizer["InvalidDates"]);
                return RedirectToAction("Details", "Room", new { id = roomId });
            }

            // Kiểm tra xem phòng có sẵn không
            var isRoomAvailable = await IsRoomAvailable(roomId, checkInDate, checkOutDate);
            if (!isRoomAvailable)
            {
                ModelState.AddModelError("", _localizer["RoomNotAvailable"]);
                return RedirectToAction("Details", "Room", new { id = roomId });
            }

            var booking = new Booking
            {
                RoomId = roomId,
                CheckInDate = checkInDate,
                CheckOutDate = checkOutDate,
                NumberOfGuests = numberOfGuests,
                Email = email,
                TotalPrice = room.PricePerNight * (checkOutDate - checkInDate).Days,
                Status = BookingStatus.Pending,
                IsEmailVerified = false,
                EmailVerificationToken = Guid.NewGuid().ToString()
            };

            if (User.Identity.IsAuthenticated)
            {
                var user = await _userManager.GetUserAsync(User);
                booking.Email = user.Email;
            }

            _context.Bookings.Add(booking);
            await _context.SaveChangesAsync();

            // Gửi email xác nhận đặt phòng
            await SendBookingConfirmationEmail(booking);

            return RedirectToAction("Confirmation", new { id = booking.Id });
        }

        private async Task<bool> IsRoomAvailable(int roomId, DateTime checkInDate, DateTime checkOutDate)
        {
            var overlappingBookings = await _context.Bookings
                .Where(b => b.RoomId == roomId &&
                            b.Status != BookingStatus.Cancelled &&
                            ((checkInDate >= b.CheckInDate && checkInDate < b.CheckOutDate) ||
                             (checkOutDate > b.CheckInDate && checkOutDate <= b.CheckOutDate) ||
                             (checkInDate <= b.CheckInDate && checkOutDate >= b.CheckOutDate)))
                .AnyAsync();

            return !overlappingBookings;
        }

        private async Task SendBookingConfirmationEmail(Booking booking)
        {
            var room = await _context.Rooms.FindAsync(booking.RoomId);

            var fromAddress = new MailAddress(_configuration["EmailSettings:FromAddress"], _configuration["EmailSettings:FromName"]);
            var toAddress = new MailAddress(booking.Email);
            var subject = _localizer["BookingConfirmationSubject"];
            var body = GetBookingConfirmationEmailBody(booking, room);

            using (var smtp = new SmtpClient(_configuration["EmailSettings:SmtpHost"], int.Parse(_configuration["EmailSettings:SmtpPort"])))
            {
                smtp.Credentials = new NetworkCredential(_configuration["EmailSettings:SmtpUsername"], _configuration["EmailSettings:SmtpPassword"]);
                smtp.EnableSsl = true;

                using (var message = new MailMessage(fromAddress, toAddress)
                {
                    Subject = subject,
                    Body = body,
                    IsBodyHtml = true
                })
                {
                    await smtp.SendMailAsync(message);
                }
            }
        }

        private string GetBookingConfirmationEmailBody(Booking booking, Room room)
        {
            return $@"
                <h2>{_localizer["BookingConfirmationTitle"]}</h2>
                <p>{_localizer["ThankYouBooking"]}</p>
                <h3>{_localizer["BookingDetails"]}:</h3>
                <ul>
                    <li>{_localizer["BookingId"]}: <strong>{booking.Id}</strong></li>
                    <li>{_localizer["Room"]}: {room.Name}</li>
                    <li>{_localizer["CheckInDate"]}: {booking.CheckInDate.ToShortDateString()}</li>
                    <li>{_localizer["CheckOutDate"]}: {booking.CheckOutDate.ToShortDateString()}</li>
                    <li>{_localizer["NumberOfGuests"]}: {booking.NumberOfGuests}</li>
                    <li>{_localizer["TotalPrice"]}: {booking.TotalPrice.ToString("C0")}</li>
                    <li>{_localizer["Status"]}: {_localizer[booking.Status.ToString()]}</li>
                </ul>
                <p>{_localizer["ConfirmationEmailMessage"]}</p>
                <p>{_localizer["ContactUsMessage"]}</p>
            ";
        }

        public async Task<IActionResult> Confirmation(int id)
        {
            var booking = await _context.Bookings
                .Include(b => b.Room)
                .FirstOrDefaultAsync(b => b.Id == id);

            if (booking == null)
            {
                return NotFound();
            }

            return View(booking);
        }
    }
}
