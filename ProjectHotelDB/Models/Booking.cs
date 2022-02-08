using System;
using System.Collections.Generic;

namespace ProjectHotelDB.Models
{
    public partial class Booking
    {
        public Booking()
        {
            BookingsFailToArrives = new HashSet<BookingsFailToArrive>();
            Minibars = new HashSet<Minibar>();
            Arrivals = new HashSet<Arrival>();
            Cancels = new HashSet<Cancel>();
            CheckOuts = new HashSet<CheckOut>();
            Customers = new HashSet<Customer>();
            Requests = new HashSet<CustomerRequest>();
            Rooms = new HashSet<Room>();
        }

        public int Id { get; set; }
        public DateTime? BookedTo { get; set; }
        public DateTime? BookedFrom { get; set; }
        public string? SpecialRequest { get; set; }
        public string? Breakfast { get; set; }
        public decimal? BreakfastCost { get; set; }
        public decimal? BreakfastDeal { get; set; }
        public string? Status { get; set; }
        public int? BookingDetailId { get; set; }

        public virtual BookingDetail? BookingDetail { get; set; }
        public virtual ICollection<BookingsFailToArrive> BookingsFailToArrives { get; set; }
        public virtual ICollection<Minibar> Minibars { get; set; }

        public virtual ICollection<Arrival> Arrivals { get; set; }
        public virtual ICollection<Cancel> Cancels { get; set; }
        public virtual ICollection<CheckOut> CheckOuts { get; set; }
        public virtual ICollection<Customer> Customers { get; set; }
        public virtual ICollection<CustomerRequest> Requests { get; set; }
        public virtual ICollection<Room> Rooms { get; set; }
    }
}
