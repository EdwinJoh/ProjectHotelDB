using System;
using System.Collections.Generic;

namespace ProjectHotelDB.Models
{
    public partial class PaymentDetail
    {
        public int Id { get; set; }
        public DateTime? PaymentDate { get; set; }
        public string? Status { get; set; }
        public int? TypeId { get; set; }
    }
}
