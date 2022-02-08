using System;
using System.Collections.Generic;

namespace ProjectHotelDB.Models
{
    public partial class Order
    {
        public Order()
        {
            Products = new HashSet<Product>();
        }

        public int Id { get; set; }
        public int? Quantity { get; set; }
        public DateTime? OrderDate { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}
