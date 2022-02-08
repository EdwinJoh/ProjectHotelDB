using System;
using System.Collections.Generic;

namespace ProjectHotelDB.Models
{
    public partial class Minibar
    {
        public int ProductId { get; set; }
        public int BookingId { get; set; }
        public int? Quantity { get; set; }

        public virtual Booking Booking { get; set; } = null!;
        public virtual Product Product { get; set; } = null!;
    }
}
