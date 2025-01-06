using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using WebKhachSan.Data;
using WebKhachSan.Models;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Net;
using Microsoft.Extensions.Localization;
using Microsoft.Extensions.Configuration;

namespace WebKhachSan.Controllers
{
    [Authorize(Roles = "Admin")]
    public class AdminController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IConfiguration _configuration; 
        private readonly IStringLocalizer<AdminController> _localizer;

        public AdminController(ApplicationDbContext context, IConfiguration configuration, IStringLocalizer<AdminController> localizer)
        {
            _context = context;
            _configuration = configuration;
            _localizer = localizer;
        }

        public async Task<IActionResult> Index()
        {
            var rooms = await _context.Rooms.ToListAsync();
            var bookings = await _context.Bookings.Include(b => b.Room).ToListAsync();
            var viewModel = new AdminViewModel
            {
                Rooms = rooms,
                Bookings = bookings
            };
            return View(viewModel);
        }

        public async Task<IActionResult> Rooms()
        {
            var rooms = await _context.Rooms.ToListAsync();
            return View(rooms);
        }

        public async Task<IActionResult> EditRoom(int id)
        {
            var room = await _context.Rooms.FindAsync(id);
            if (room == null)
            {
                return NotFound();
            }
            return View(room);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EditRoom(int id, Room room)
        {
            if (id != room.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(room);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!RoomExists(room.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Rooms));
            }
            return View(room);
        }

        private bool RoomExists(int id)
        {
            return _context.Rooms.Any(e => e.Id == id);
        }

        public async Task<IActionResult> Bookings()
        {
            var bookings = await _context.Bookings.Include(b => b.Room).ToListAsync();
            return View(bookings);
        }

        [HttpPost]
        public async Task<IActionResult> ConfirmBooking(int id)
        {
            var booking = await _context.Bookings.FindAsync(id);
            if (booking == null)
            {
                return NotFound();
            }

            booking.Status = BookingStatus.Confirmed;
            await _context.SaveChangesAsync();

            await SendBookingConfirmationEmail(booking);

            return RedirectToAction(nameof(Bookings));
        }

        [HttpPost]
        public async Task<IActionResult> RejectBooking(int id)
        {
            var booking = await _context.Bookings.FindAsync(id);
            if (booking == null)
            {
                return NotFound();
            }

            booking.Status = BookingStatus.Cancelled;
            await _context.SaveChangesAsync();

            // Gửi email thông báo từ chối đặt phòng
            await SendBookingRejectionEmail(booking);

            return RedirectToAction(nameof(Bookings));
        }

        public async Task<IActionResult> Room()
        {
            var rooms = await _context.Rooms.ToListAsync();
            return View(rooms);
        }

        [HttpPost]
        public async Task<IActionResult> ToggleRoomStatus(int id)
        {
            var room = await _context.Rooms.FindAsync(id);
            if (room == null)
            {
                return NotFound();
            }

            room.IsAvailable = !room.IsAvailable;
            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Rooms));
        }

        public async Task<IActionResult> EditBooking(int id)
        {
            var booking = await _context.Bookings.Include(b => b.Room).FirstOrDefaultAsync(b => b.Id == id);
            if (booking == null)
            {
                return NotFound();
            }
            return View(booking);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EditBooking(int id, [Bind("Id,Status")] Booking bookingUpdate)
        {
            if (id != bookingUpdate.Id)
            {
                return NotFound();
            }

            var booking = await _context.Bookings.FindAsync(id);
            if (booking == null)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    booking.Status = bookingUpdate.Status;
                    await _context.SaveChangesAsync();

                    // Send email notification based on the new status
                    if (booking.Status == BookingStatus.Confirmed)
                    {
                        await SendBookingConfirmationEmail(booking);
                    }
                    else if (booking.Status == BookingStatus.Cancelled)
                    {
                        await SendBookingRejectionEmail(booking);
                    }
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!BookingExists(booking.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Bookings));
            }
            return View(booking);
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

        private async Task SendBookingRejectionEmail(Booking booking)
        {
            var room = await _context.Rooms.FindAsync(booking.RoomId);

            var fromAddress = new MailAddress(_configuration["EmailSettings:FromAddress"], _configuration["EmailSettings:FromName"]);
            var toAddress = new MailAddress(booking.Email);
            var subject = _localizer["BookingRejectionSubject"];
            var body = GetBookingRejectionEmailBody(booking, room);

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

        private string GetBookingRejectionEmailBody(Booking booking, Room room)
        {
            return $@"
                <h2>{_localizer["BookingRejectionTitle"]}</h2>
                <p>{_localizer["SorryBookingRejected"]}</p>
                <h3>{_localizer["BookingDetails"]}:</h3>
                <ul>
                    <li>{_localizer["BookingId"]}: <strong>{booking.Id}</strong></li>
                    <li>{_localizer["Room"]}: {room.Name}</li>
                    <li>{_localizer["CheckInDate"]}: {booking.CheckInDate.ToShortDateString()}</li>
                    <li>{_localizer["CheckOutDate"]}: {booking.CheckOutDate.ToShortDateString()}</li>
                    <li>{_localizer["NumberOfGuests"]}: {booking.NumberOfGuests}</li>
                    <li>{_localizer["Status"]}: {_localizer[booking.Status.ToString()]}</li>
                </ul>
                <p>{_localizer["RejectionEmailMessage"]}</p>
                <p>{_localizer["ContactUsMessage"]}</p>
            ";
        }

        private bool BookingExists(int id)
        {
            return _context.Bookings.Any(e => e.Id == id);
        }

        public async Task<IActionResult> Revenue()
        {
            var confirmedBookings = await _context.Bookings
                .Where(b => b.Status == BookingStatus.Confirmed)
                .Include(b => b.Room)
                .ToListAsync();

            var totalRevenue = confirmedBookings.Sum(b => b.TotalPrice);

            var revenueByMonth = confirmedBookings
                .GroupBy(b => new { b.CheckInDate.Year, b.CheckInDate.Month })
                .Select(g => new MonthlyRevenue
                {
                    Year = g.Key.Year,
                    Month = g.Key.Month,
                    Revenue = g.Sum(b => b.TotalPrice)
                })
                .OrderBy(r => r.Year)
                .ThenBy(r => r.Month)
                .ToList();

            var viewModel = new RevenueViewModel
            {
                TotalRevenue = totalRevenue,
                RevenueByMonth = revenueByMonth,
                ConfirmedBookings = confirmedBookings
            };

            return View(viewModel);
        }
    }
}
