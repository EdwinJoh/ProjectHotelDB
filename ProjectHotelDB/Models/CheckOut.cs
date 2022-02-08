using System;
using System.Collections.Generic;

namespace ProjectHotelDB.Models
{
    public partial class CheckOut
    {
        public CheckOut()
        {
            Bookings = new HashSet<Booking>();
        }

        public int Id { get; set; }
        public DateTime? CheckoutTime { get; set; }
        public decimal? ExtraBilling { get; set; }
        public int? PaymentDetailId { get; set; }

        public virtual ICollection<Booking> Bookings { get; set; }
    }
}
