
using ProjectHotelDB.Models;


//AddCustomers();
//DeleteCustomer();
//SelectCustomer("c");
//UpdateCustomer();
//HotelCommunication();


void SelectCustomer(string startWith)
{
    using (var db = new HotelDBContext())
    {
        var customers = (from c in db.Customers
                         where c.FirstName.StartsWith(startWith)
                         select c).ToList();

        foreach (var c in customers)
        {
            Console.WriteLine($"{c.FirstName} {c.LastName}");
        }
    }
}

void AddCustomers()
{
    using (var db = new HotelDBContext())
    {
        var customer = db.Set<Customer>();
        customer.Add(new Customer
        {
            FirstName = "Carl",
            LastName = "Hansson",
            Street = "Gangster gata 13",
            Zipcode = "54859",
            City = "annonyma staten",
            Country = "north pole",
            Phone = "0758978588",
            Email = "H@cker.se",
            Active = "Yes",
            SocialSecurityNumber = "199802025898"

        });
        db.SaveChanges();
    }
}
void DeleteCustomer()
{
    using (var db = new HotelDBContext())
    {
        var customer = db.Customers
            .Where(c => c.LastName == "Hansson").FirstOrDefault();
        db.Customers.Remove(customer);
        db.SaveChanges();
    }
}
void UpdateCustomer()
{
    using (var db = new HotelDBContext())
    {
        var customer = db.Customers.SingleOrDefault(c => c.FirstName == "Carl");

        if (customer != null)
        {
            customer.FirstName = "Hassan";
            db.SaveChanges();
        }
    }
}
void SelectBooking(string speicalRequest)
{
    using (var db = new HotelDBContext())
    {
        var booking = db.Bookings.SingleOrDefault(b => b.SpecialRequest.Contains(speicalRequest));
        if (booking != null)
        {
            Console.WriteLine($"{booking.Id} want vodka");
            AddToCustomerRequest(speicalRequest);
        }
        else
        {
            Console.WriteLine("No customer want vodka");
        }
    }
}
void AddToCustomerRequest(string specialRequest)
{
    using (var db = new HotelDBContext())
    {
        var cRequest = db.Set<CustomerRequest>();
        cRequest.Add(new CustomerRequest
        {
            Request = specialRequest,
            ExtraCost = 300
        });
        db.SaveChanges();
    }
}

void HotelCommunication()
{
    using (var db = new HotelDBContext())
    {
        var cComunication = db.Set<HotelCustomerCommunication>();
        cComunication.Add(new HotelCustomerCommunication
        {
            CustomerId = 4,
            CustomerMessage = "help meee",
            EmployeeMessage = "How can i help you ?"
        });
        db.SaveChanges();
    }
}

void UpdateHotelCommunication()
{
    using (var db = new HotelDBContext())
    {
        var infodata = db.Customers.FirstOrDefault(c => c.SocialSecurityNumber == "19941005-7120");
        if (infodata != null)
        {
            var infodat = new HotelCustomerCommunication()
            {
                CustomerId = infodata.Id,
                CustomerMessage = "jek",
                EmployeeMessage=  "asdd"
            };
            db.HotelCustomerCommunications.Add(infodat);
            db.SaveChanges();
        }
    }
}