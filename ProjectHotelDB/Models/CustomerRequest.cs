using System;
using System.Collections.Generic;

namespace ProjectHotelDB.Models
{
    public partial class CustomerRequest
    {
        public CustomerRequest()
        {
            Bookings = new HashSet<Booking>();
        }

        public int Id { get; set; }
        public string? Request { get; set; }
        public decimal? ExtraCost { get; set; }

        public virtual ICollection<Booking> Bookings { get; set; }
    }
}
