using System;
using System.Collections.Generic;

namespace ProjectHotelDB.Models
{
    public partial class ContactPerson
    {
        public ContactPerson()
        {
            Employees = new HashSet<Employee>();
        }

        public int Id { get; set; }
        public string? FullName { get; set; }
        public string? Relation { get; set; }
        public string? Phone { get; set; }
        public string? Email { get; set; }

        public virtual ICollection<Employee> Employees { get; set; }
    }
}
