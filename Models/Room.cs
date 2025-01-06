using System.ComponentModel.DataAnnotations;

namespace WebKhachSan.Models
{
    public class Room
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập tên phòng")]
        [Display(Name = "Tên phòng")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập loại phòng")]
        [Display(Name = "Loại phòng")]
        public string RoomType { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập giá phòng")]
        [Range(1, 1000000, ErrorMessage = "Giá phòng phải lớn hơn 0")]
        [Display(Name = "Giá mỗi đêm")]
        public decimal PricePerNight { get; set; }

        [Display(Name = "Mô tả phòng")]
        public string Description { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập sức chứa")]
        [Range(1, 20, ErrorMessage = "Sức chứa phải từ 1 đến 20")]
        [Display(Name = "Sức chứa tối đa")]
        public int Capacity { get; set; }

        [Display(Name = "Hình ảnh")]
        public string ImageUrl { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập kích thước phòng")]
        [Range(1, 1000, ErrorMessage = "Kích thước phòng phải từ 1 đến 1000")]
        [Display(Name = "Kích thước (m²)")]
        public int Size { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập hướng nhìn")]
        [Display(Name = "Hướng nhìn")]
        public string View { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập loại giường")]
        [Display(Name = "Loại giường")]
        public string BedType { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập số lượng phòng")]
        [Range(0, 100, ErrorMessage = "Số lượng phòng phải từ 0 đến 100")]
        [Display(Name = "Số lượng phòng")]
        public int Quantity { get; set; }

        [Display(Name = "Số phòng còn trống")]
        public int AvailableRooms { get; set; }

        public bool IsAvailable { get; set; } = true;

        // Quan hệ
        public ICollection<RoomAmenity> RoomAmenities { get; set; }
        public ICollection<Booking> Bookings { get; set; }
    }
}
