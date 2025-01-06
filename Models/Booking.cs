using System.ComponentModel.DataAnnotations;

namespace WebKhachSan.Models
{
    public class Booking
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Vui lòng chọn ngày check-in")]
        [Display(Name = "Ngày check-in")]
        [DataType(DataType.Date)]
        public DateTime CheckInDate { get; set; }

        [Required(ErrorMessage = "Vui lòng chọn ngày check-out")]
        [Display(Name = "Ngày check-out")]
        [DataType(DataType.Date)]
        public DateTime CheckOutDate { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập số khách")]
        [Range(1, 10, ErrorMessage = "Số khách từ 1 đến 10")]
        [Display(Name = "Số khách")]
        public int NumberOfGuests { get; set; }

        [Display(Name = "Tổng tiền")]
        public decimal TotalPrice { get; set; }

        [Display(Name = "Trạng thái")]
        public BookingStatus Status { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập địa chỉ email")]
        [EmailAddress(ErrorMessage = "Địa chỉ email không hợp lệ")]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Display(Name = "Email đã xác minh")]
        public bool IsEmailVerified { get; set; }

        [Display(Name = "Mã xác minh email")]
        public string EmailVerificationToken { get; set; }

        // Quan hệ
        public int RoomId { get; set; }
        public Room Room { get; set; }
    }
}

