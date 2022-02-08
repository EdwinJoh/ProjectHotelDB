using System;
using System.Collections.Generic;

namespace ProjectHotelDB.Models
{
    public partial class Arrival
    {
        public Arrival()
        {
            Bookings = new HashSet<Booking>();
        }

        public int Id { get; set; }
        public DateTime? ArrivalTime { get; set; }

        public virtual ICollection<Booking> Bookings { get; set; }
    }
}
