using System;
using System.Collections.Generic;

namespace ProjectHotelDB.Models
{
    public partial class BookingDetail
    {
        public BookingDetail()
        {
            Bookings = new HashSet<Booking>();
        }

        public int Id { get; set; }
        public double? CustomersBooked { get; set; }
        public int? NumberOfRooms { get; set; }
        public int? NumberOfExtraBeds { get; set; }
        public decimal? CostPerExtraBed { get; set; }

        public virtual ICollection<Booking> Bookings { get; set; }
    }
}
