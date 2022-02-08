using System;
using System.Collections.Generic;

namespace ProjectHotelDB.Models
{
    public partial class BookingsFailToArrive
    {
        public int BookingId { get; set; }
        public int FailToArriveId { get; set; }

        public virtual Booking Booking { get; set; } = null!;
    }
}
