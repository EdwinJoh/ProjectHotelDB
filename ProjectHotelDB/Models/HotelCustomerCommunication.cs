using System;
using System.Collections.Generic;

namespace ProjectHotelDB.Models
{
    public partial class HotelCustomerCommunication
    {
        public HotelCustomerCommunication()
        {
            Employees = new HashSet<Employee>();
        }

        public int Id { get; set; }
        public int? CustomerId { get; set; }
        public string? CustomerMessage { get; set; }
        public string? EmployeeMessage { get; set; }

        public virtual Customer? Customer { get; set; }

        public virtual ICollection<Employee> Employees { get; set; }
    }
}
