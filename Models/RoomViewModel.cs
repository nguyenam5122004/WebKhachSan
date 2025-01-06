namespace WebKhachSan.Models
{
    public class RoomViewModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string RoomType { get; set; }
        public decimal PricePerNight { get; set; }
        public string Description { get; set; }
        public int Capacity { get; set; }
        public string ImageUrl { get; set; }
        public int Size { get; set; }
        public string View { get; set; }
        public string BedType { get; set; }
        public int Quantity { get; set; }
        public int AvailableRooms { get; set; }
        public List<Amenity> Amenities { get; set; }
    }
}