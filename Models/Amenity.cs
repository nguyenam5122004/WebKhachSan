using System.ComponentModel.DataAnnotations;

namespace WebKhachSan.Models
{
    public class Amenity
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập tên tiện nghi")]
        [Display(Name = "Tên tiện nghi")]
        public string Name { get; set; }

        [Display(Name = "Biểu tượng")]
        public string Icon { get; set; }

        // Quan hệ
        public ICollection<RoomAmenity> RoomAmenities { get; set; }
    }
}
