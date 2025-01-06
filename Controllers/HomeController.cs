using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using WebKhachSan.Models;
using WebKhachSan.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Localization;
using Microsoft.AspNetCore.Mvc.Localization;
using Microsoft.AspNetCore.Localization;
using System.Globalization;

namespace WebKhachSan.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ApplicationDbContext _context;
        private readonly IStringLocalizer<HomeController> _localizer;

        public HomeController(ILogger<HomeController> logger, ApplicationDbContext context, IStringLocalizer<HomeController> localizer)
        {
            _logger = logger;
            _context = context;
            _localizer = localizer;
        }

        public async Task<IActionResult> Index()
        {
            var featuredRooms = await _context.Rooms.Take(3).ToListAsync();
            return View(featuredRooms);
        }

        public IActionResult About()
        {
            ViewData["Title"] = _localizer["About"];
            return View();
        }

        public IActionResult Services()
        {
            ViewData["Title"] = _localizer["Services"];
            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Title"] = _localizer["Contact"];
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        [HttpPost]
        public IActionResult SetLanguage(string culture, string returnUrl)
        {
            var supportedCultures = new[] { "vi-VN", "en-US" }; // Các ngôn ngữ được hỗ trợ
            if (!string.IsNullOrEmpty(culture) && supportedCultures.Contains(culture))
            {
                var cultureInfo = new CultureInfo(culture);
                CultureInfo.CurrentCulture = cultureInfo;
                CultureInfo.CurrentUICulture = cultureInfo;
                Response.Cookies.Append(CookieRequestCultureProvider.DefaultCookieName,
                    CookieRequestCultureProvider.MakeCookieValue(new RequestCulture(culture)),
                    new CookieOptions { Expires = DateTimeOffset.UtcNow.AddYears(1) });
            }
            return Redirect(returnUrl ?? "/");
        }

    }
}

