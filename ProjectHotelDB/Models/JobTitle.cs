using System;
using System.Collections.Generic;

namespace ProjectHotelDB.Models
{
    public partial class JobTitle
    {
        public JobTitle()
        {
            Employees = new HashSet<Employee>();
        }

        public int Id { get; set; }
        public string? JobTitle1 { get; set; }

        public virtual ICollection<Employee> Employees { get; set; }
    }
}
