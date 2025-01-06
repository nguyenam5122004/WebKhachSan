using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebKhachSan.Models;
using WebKhachSan.Data;
using Microsoft.Extensions.Localization;
using Microsoft.AspNetCore.Identity;

namespace WebKhachSan.Controllers
{
    public class RoomController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IStringLocalizer<RoomController> _localizer;
        private readonly UserManager<ApplicationUser> _userManager;

        // Constructor
        public RoomController(ApplicationDbContext context, IStringLocalizer<RoomController> localizer, UserManager<ApplicationUser> userManager)
        {
            _context = context;
            _localizer = localizer;
            _userManager = userManager;
        }

        // Index Action
        public async Task<IActionResult> Index()
        {
            var rooms = await _context.Rooms
                .Include(r => r.RoomAmenities)
                .ThenInclude(ra => ra.Amenity)
                .Include(r => r.Bookings)
                .Select(r => new RoomViewModel
                {
                    Id = r.Id,
                    Name = r.Name,
                    RoomType = r.RoomType,
                    PricePerNight = r.PricePerNight,
                    Description = _localizer[r.Description],
                    Capacity = r.Capacity,
                    ImageUrl = r.ImageUrl,
                    Size = r.Size,
                    View = _localizer[r.View],
                    BedType = _localizer[r.BedType],
                    Quantity = r.Quantity,
                    AvailableRooms = r.Quantity - r.Bookings.Count(b => b.Status != BookingStatus.Cancelled && b.CheckOutDate > DateTime.Now),
                    Amenities = r.RoomAmenities.Select(ra => ra.Amenity).ToList()
                })
                .ToListAsync();

            return View(rooms);
        }

        // Room Details Action
        public async Task<IActionResult> Details(int id)
        {
            var room = await _context.Rooms
                .Include(r => r.RoomAmenities)
                .ThenInclude(ra => ra.Amenity)
                .Include(r => r.Bookings)
                .Select(r => new RoomViewModel
                {
                    Id = r.Id,
                    Name = r.Name,
                    RoomType = r.RoomType,
                    PricePerNight = r.PricePerNight,
                    Description = _localizer[r.Description],
                    Capacity = r.Capacity,
                    ImageUrl = r.ImageUrl,
                    Size = r.Size,
                    View = _localizer[r.View],
                    BedType = _localizer[r.BedType],
                    Quantity = r.Quantity,
                    AvailableRooms = r.Quantity - r.Bookings.Count(b => b.Status != BookingStatus.Cancelled && b.CheckOutDate > DateTime.Now),
                    Amenities = r.RoomAmenities.Select(ra => ra.Amenity).ToList()
                })
                .FirstOrDefaultAsync(r => r.Id == id);

            if (room == null)
            {
                return NotFound();
            }

            // Lấy email của người dùng đã đăng nhập và truyền vào ViewData
            var user = await _userManager.GetUserAsync(User);
            if (user != null)
            {
                ViewData["UserEmail"] = user.Email;
            }

            return View(room);
        }

        // Search Action
        [HttpPost]
        public async Task<IActionResult> Search(DateTime checkInDate, DateTime checkOutDate, int numberOfGuests)
        {
            var availableRooms = await _context.Rooms
                .Where(r => r.Capacity >= numberOfGuests)
                .Where(r => !r.Bookings.Any(b =>
                    (checkInDate >= b.CheckInDate && checkInDate < b.CheckOutDate) ||
                    (checkOutDate > b.CheckInDate && checkOutDate <= b.CheckOutDate) ||
                    (checkInDate <= b.CheckInDate && checkOutDate >= b.CheckOutDate)))
                .ToListAsync();

            return View("Index", availableRooms);
        }
    }
}
