using System;
using System.Collections.Generic;

namespace ProjectHotelDB.Models
{
    public partial class Customer
    {
        public Customer()
        {
            HotelCustomerCommunications = new HashSet<HotelCustomerCommunication>();
            Bookings = new HashSet<Booking>();
            Ratings = new HashSet<Rating>();
        }

        public int Id { get; set; }
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public string? Street { get; set; }
        public string? Zipcode { get; set; }
        public string? City { get; set; }
        public string? Country { get; set; }
        public string? Phone { get; set; }
        public string? Email { get; set; }
        public string? Active { get; set; }
        public string? SocialSecurityNumber { get; set; }

        public virtual ICollection<HotelCustomerCommunication> HotelCustomerCommunications { get; set; }

        public virtual ICollection<Booking> Bookings { get; set; }
        public virtual ICollection<Rating> Ratings { get; set; }
    }
}
