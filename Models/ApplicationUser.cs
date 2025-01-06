using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Identity;

namespace WebKhachSan.Models
{
    public class ApplicationUser : IdentityUser
    {
        [Required(ErrorMessage = "Vui lòng nhập họ")]
        [Display(Name = "Họ")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập tên")]
        [Display(Name = "Tên")]
        public string LastName { get; set; }

        public string FullName { get; set; }

        // Quan hệ với Booking
        public ICollection<Booking> Bookings { get; set; }
    }
}
