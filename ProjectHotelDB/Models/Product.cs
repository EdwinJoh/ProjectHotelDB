using System;
using System.Collections.Generic;

namespace ProjectHotelDB.Models
{
    public partial class Product
    {
        public Product()
        {
            Minibars = new HashSet<Minibar>();
        }

        public int Id { get; set; }
        public string? ProductItem { get; set; }
        public decimal? Cost { get; set; }
        public int? OrderId { get; set; }
        public int? Quantity { get; set; }

        public virtual Order? Order { get; set; }
        public virtual ICollection<Minibar> Minibars { get; set; }
    }
}
