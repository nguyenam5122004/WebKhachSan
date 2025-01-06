using System.ComponentModel.DataAnnotations;

namespace WebKhachSan.Models
{
    public enum BookingStatus
    {
        [Display(Name = "Đang chờ")]
        Pending,
        [Display(Name = "Đã xác nhận")]
        Confirmed,
        [Display(Name = "Đã hủy")]
        Cancelled
    }
}
