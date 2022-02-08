using System;
using System.Collections.Generic;

namespace ProjectHotelDB.Models
{
    public partial class Employee
    {
        public Employee()
        {
            Communications = new HashSet<HotelCustomerCommunication>();
        }

        public int Id { get; set; }
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public string? Address { get; set; }
        public int? TitleId { get; set; }
        public decimal? Salary { get; set; }
        public DateTime? HireDate { get; set; }
        public int? ContactPersonId { get; set; }
        public string? SocialSecurityNumber { get; set; }

        public virtual ContactPerson? ContactPerson { get; set; }
        public virtual JobTitle? Title { get; set; }

        public virtual ICollection<HotelCustomerCommunication> Communications { get; set; }
    }
}
