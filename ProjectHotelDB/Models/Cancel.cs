using System;
using System.Collections.Generic;

namespace ProjectHotelDB.Models
{
    public partial class Cancel
    {
        public Cancel()
        {
            Bookings = new HashSet<Booking>();
        }

        public int Id { get; set; }
        public DateTime? Time { get; set; }

        public virtual ICollection<Booking> Bookings { get; set; }
    }
}
