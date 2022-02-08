using System;
using System.Collections.Generic;

namespace ProjectHotelDB.Models
{
    public partial class Rating
    {
        public Rating()
        {
            Customers = new HashSet<Customer>();
        }

        public int Id { get; set; }
        public int? Rating1 { get; set; }
        public string? Description { get; set; }

        public virtual ICollection<Customer> Customers { get; set; }
    }
}
