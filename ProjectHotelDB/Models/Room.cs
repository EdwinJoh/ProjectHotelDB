using System;
using System.Collections.Generic;

namespace ProjectHotelDB.Models
{
    public partial class Room
    {
        public Room()
        {
            Bookings = new HashSet<Booking>();
        }

        public int Id { get; set; }
        public int? RoomTypeId { get; set; }
        public string? RoomNumber { get; set; }
        public decimal? CostPerDay { get; set; }
        public decimal? RoomDeal { get; set; }

        public virtual RoomType? RoomType { get; set; }

        public virtual ICollection<Booking> Bookings { get; set; }
    }
}
