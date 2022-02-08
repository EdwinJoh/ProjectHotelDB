using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace ProjectHotelDB.Models
{
    public partial class HotelDBContext : DbContext
    {
        public HotelDBContext()
        {
        }

        public HotelDBContext(DbContextOptions<HotelDBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Arrival> Arrivals { get; set; } = null!;
        public virtual DbSet<Booking> Bookings { get; set; } = null!;
        public virtual DbSet<BookingDetail> BookingDetails { get; set; } = null!;
        public virtual DbSet<BookingsFailToArrive> BookingsFailToArrives { get; set; } = null!;
        public virtual DbSet<Cancel> Cancels { get; set; } = null!;
        public virtual DbSet<CheckOut> CheckOuts { get; set; } = null!;
        public virtual DbSet<ContactPerson> ContactPeople { get; set; } = null!;
        public virtual DbSet<Customer> Customers { get; set; } = null!;
        public virtual DbSet<CustomerRequest> CustomerRequests { get; set; } = null!;
        public virtual DbSet<Employee> Employees { get; set; } = null!;
        public virtual DbSet<FailToArrive> FailToArrives { get; set; } = null!;
        public virtual DbSet<HotelCustomerCommunication> HotelCustomerCommunications { get; set; } = null!;
        public virtual DbSet<JobTitle> JobTitles { get; set; } = null!;
        public virtual DbSet<Minibar> Minibars { get; set; } = null!;
        public virtual DbSet<Order> Orders { get; set; } = null!;
        public virtual DbSet<PaymentDetail> PaymentDetails { get; set; } = null!;
        public virtual DbSet<PaymentType> PaymentTypes { get; set; } = null!;
        public virtual DbSet<Product> Products { get; set; } = null!;
        public virtual DbSet<Rating> Ratings { get; set; } = null!;
        public virtual DbSet<Room> Rooms { get; set; } = null!;
        public virtual DbSet<RoomType> RoomTypes { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=(localdb)\\MSSQLLocalDB;Database=HotelDB;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Arrival>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.ArrivalTime).HasPrecision(0);
            });

            modelBuilder.Entity<Booking>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.BookedFrom).HasPrecision(0);

                entity.Property(e => e.BookedTo).HasPrecision(0);

                entity.Property(e => e.BookingDetailId).HasColumnName("BookingDetailID");

                entity.Property(e => e.Breakfast)
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.BreakfastCost).HasColumnType("money");

                entity.Property(e => e.BreakfastDeal).HasColumnType("money");

                entity.Property(e => e.SpecialRequest).HasMaxLength(200);

                entity.Property(e => e.Status)
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.HasOne(d => d.BookingDetail)
                    .WithMany(p => p.Bookings)
                    .HasForeignKey(d => d.BookingDetailId)
                    .HasConstraintName("FK_Bookings.BookingDetailID");

                entity.HasMany(d => d.Arrivals)
                    .WithMany(p => p.Bookings)
                    .UsingEntity<Dictionary<string, object>>(
                        "BookingsArrival",
                        l => l.HasOne<Arrival>().WithMany().HasForeignKey("ArrivalId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_Bookings_Arrivals.ArrivalID"),
                        r => r.HasOne<Booking>().WithMany().HasForeignKey("BookingId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_Bookings_Arrivals.BookingID"),
                        j =>
                        {
                            j.HasKey("BookingId", "ArrivalId").HasName("PK__Bookings__D124BFDE124927F8");

                            j.ToTable("Bookings_Arrivals");

                            j.IndexerProperty<int>("BookingId").HasColumnName("BookingID");

                            j.IndexerProperty<int>("ArrivalId").HasColumnName("ArrivalID");
                        });

                entity.HasMany(d => d.Cancels)
                    .WithMany(p => p.Bookings)
                    .UsingEntity<Dictionary<string, object>>(
                        "BookingsCancel",
                        l => l.HasOne<Cancel>().WithMany().HasForeignKey("CancelId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_Bookings_Cancels.CancelID"),
                        r => r.HasOne<Booking>().WithMany().HasForeignKey("BookingId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_Bookings_Cancels.BookingID"),
                        j =>
                        {
                            j.HasKey("BookingId", "CancelId").HasName("PK__Bookings__4DEC676921EADF0E");

                            j.ToTable("Bookings_Cancels");

                            j.IndexerProperty<int>("BookingId").HasColumnName("BookingID");

                            j.IndexerProperty<int>("CancelId").HasColumnName("CancelID");
                        });

                entity.HasMany(d => d.CheckOuts)
                    .WithMany(p => p.Bookings)
                    .UsingEntity<Dictionary<string, object>>(
                        "BookingsCheckOut",
                        l => l.HasOne<CheckOut>().WithMany().HasForeignKey("CheckOutId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_Bookings_CheckOuts.CheckOutID"),
                        r => r.HasOne<Booking>().WithMany().HasForeignKey("BookingId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_Bookings_CheckOuts.BookingID"),
                        j =>
                        {
                            j.HasKey("BookingId", "CheckOutId").HasName("PK__Bookings__D69F5C8CDBE8CCFC");

                            j.ToTable("Bookings_CheckOuts");

                            j.IndexerProperty<int>("BookingId").HasColumnName("BookingID");

                            j.IndexerProperty<int>("CheckOutId").HasColumnName("CheckOutID");
                        });

                entity.HasMany(d => d.Customers)
                    .WithMany(p => p.Bookings)
                    .UsingEntity<Dictionary<string, object>>(
                        "BookingsCustomer",
                        l => l.HasOne<Customer>().WithMany().HasForeignKey("CustomerId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_Bookings_Customers.CustomerID"),
                        r => r.HasOne<Booking>().WithMany().HasForeignKey("BookingId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_Bookings_Customers.BookingID"),
                        j =>
                        {
                            j.HasKey("BookingId", "CustomerId").HasName("PK__Bookings__E9DFFC8646184462");

                            j.ToTable("Bookings_Customers");

                            j.IndexerProperty<int>("BookingId").HasColumnName("BookingID");

                            j.IndexerProperty<int>("CustomerId").HasColumnName("CustomerID");
                        });

                entity.HasMany(d => d.Requests)
                    .WithMany(p => p.Bookings)
                    .UsingEntity<Dictionary<string, object>>(
                        "BookingsRequest",
                        l => l.HasOne<CustomerRequest>().WithMany().HasForeignKey("RequestId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_Bookings_Requests.RequestID"),
                        r => r.HasOne<Booking>().WithMany().HasForeignKey("BookingId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_Bookings_Requests.BookingID"),
                        j =>
                        {
                            j.HasKey("BookingId", "RequestId").HasName("PK__Bookings__C0AF9FD4A5DE4E89");

                            j.ToTable("Bookings_Requests");

                            j.IndexerProperty<int>("BookingId").HasColumnName("BookingID");

                            j.IndexerProperty<int>("RequestId").HasColumnName("RequestID");
                        });

                entity.HasMany(d => d.Rooms)
                    .WithMany(p => p.Bookings)
                    .UsingEntity<Dictionary<string, object>>(
                        "BookingsRoom",
                        l => l.HasOne<Room>().WithMany().HasForeignKey("RoomId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_Bookings_Rooms.RoomID"),
                        r => r.HasOne<Booking>().WithMany().HasForeignKey("BookingId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_Bookings_Rooms.BookingID"),
                        j =>
                        {
                            j.HasKey("BookingId", "RoomId").HasName("PK__Bookings__F0BD795C259D7A1E");

                            j.ToTable("Bookings_Rooms");

                            j.IndexerProperty<int>("BookingId").HasColumnName("BookingID");

                            j.IndexerProperty<int>("RoomId").HasColumnName("RoomID");
                        });
            });

            modelBuilder.Entity<BookingDetail>(entity =>
            {
                entity.ToTable("Booking_Details");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.CostPerExtraBed).HasColumnType("money");
            });

            modelBuilder.Entity<BookingsFailToArrive>(entity =>
            {
                entity.HasKey(e => new { e.BookingId, e.FailToArriveId })
                    .HasName("PK__Bookings__F326DDEA006B83B1");

                entity.ToTable("Bookings_FailToArrive");

                entity.Property(e => e.BookingId).HasColumnName("BookingID");

                entity.Property(e => e.FailToArriveId).HasColumnName("FailToArriveID");

                entity.HasOne(d => d.Booking)
                    .WithMany(p => p.BookingsFailToArrives)
                    .HasForeignKey(d => d.BookingId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Bookings_FailToArrive.BookingID");
            });

            modelBuilder.Entity<Cancel>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Time).HasPrecision(0);
            });

            modelBuilder.Entity<CheckOut>(entity =>
            {
                entity.HasIndex(e => e.PaymentDetailId, "Fk");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.CheckoutTime).HasPrecision(0);

                entity.Property(e => e.ExtraBilling).HasColumnType("money");

                entity.Property(e => e.PaymentDetailId).HasColumnName("PaymentDetailID");
            });

            modelBuilder.Entity<ContactPerson>(entity =>
            {
                entity.ToTable("ContactPerson");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Email).HasMaxLength(50);

                entity.Property(e => e.FullName).HasMaxLength(50);

                entity.Property(e => e.Phone)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.Relation).HasMaxLength(20);
            });

            modelBuilder.Entity<Customer>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Active).HasMaxLength(10);

                entity.Property(e => e.City).HasMaxLength(50);

                entity.Property(e => e.Country)
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.Email).HasMaxLength(100);

                entity.Property(e => e.FirstName).HasMaxLength(50);

                entity.Property(e => e.LastName).HasMaxLength(50);

                entity.Property(e => e.Phone)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.SocialSecurityNumber)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("Social_Security_number");

                entity.Property(e => e.Street).HasMaxLength(100);

                entity.Property(e => e.Zipcode)
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.HasMany(d => d.Ratings)
                    .WithMany(p => p.Customers)
                    .UsingEntity<Dictionary<string, object>>(
                        "CustomersRating",
                        l => l.HasOne<Rating>().WithMany().HasForeignKey("RatingId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_Customers_Ratings.RatingID"),
                        r => r.HasOne<Customer>().WithMany().HasForeignKey("CustomerId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_Customers_Ratings.CustomerID"),
                        j =>
                        {
                            j.HasKey("CustomerId", "RatingId").HasName("PK__Customer__7B62BB3D18309428");

                            j.ToTable("Customers_Ratings");

                            j.IndexerProperty<int>("CustomerId").HasColumnName("CustomerID");

                            j.IndexerProperty<int>("RatingId").HasColumnName("RatingID");
                        });
            });

            modelBuilder.Entity<CustomerRequest>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.ExtraCost).HasColumnType("money");

                entity.Property(e => e.Request).HasMaxLength(300);
            });

            modelBuilder.Entity<Employee>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Address).HasMaxLength(100);

                entity.Property(e => e.ContactPersonId).HasColumnName("ContactPersonID");

                entity.Property(e => e.FirstName).HasMaxLength(50);

                entity.Property(e => e.LastName).HasMaxLength(50);

                entity.Property(e => e.Salary).HasColumnType("money");

                entity.Property(e => e.SocialSecurityNumber)
                    .HasMaxLength(15)
                    .IsUnicode(false)
                    .HasColumnName("Social_Security_Number");

                entity.Property(e => e.TitleId).HasColumnName("TitleID");

                entity.HasOne(d => d.ContactPerson)
                    .WithMany(p => p.Employees)
                    .HasForeignKey(d => d.ContactPersonId)
                    .HasConstraintName("FK_Employees.ContactPersonID");

                entity.HasOne(d => d.Title)
                    .WithMany(p => p.Employees)
                    .HasForeignKey(d => d.TitleId)
                    .HasConstraintName("FK_Employees.TitleID");

                entity.HasMany(d => d.Communications)
                    .WithMany(p => p.Employees)
                    .UsingEntity<Dictionary<string, object>>(
                        "EmployeesCommunication",
                        l => l.HasOne<HotelCustomerCommunication>().WithMany().HasForeignKey("CommunicationId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_Employees_Communication.CommunicationID"),
                        r => r.HasOne<Employee>().WithMany().HasForeignKey("EmployeeId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_Employees_Communication.EmployeeID"),
                        j =>
                        {
                            j.HasKey("EmployeeId", "CommunicationId").HasName("PK__Employee__9FEE19A9E8F88800");

                            j.ToTable("Employees_Communication");

                            j.IndexerProperty<int>("EmployeeId").HasColumnName("EmployeeID");

                            j.IndexerProperty<int>("CommunicationId").HasColumnName("CommunicationID");
                        });
            });

            modelBuilder.Entity<FailToArrive>(entity =>
            {
                entity.ToTable("FailToArrive");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Reason).HasMaxLength(300);
            });

            modelBuilder.Entity<HotelCustomerCommunication>(entity =>
            {
                entity.ToTable("HotelCustomerCommunication");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.CustomerId).HasColumnName("CustomerID");

                entity.Property(e => e.CustomerMessage).HasMaxLength(300);

                entity.Property(e => e.EmployeeMessage).HasMaxLength(300);

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.HotelCustomerCommunications)
                    .HasForeignKey(d => d.CustomerId)
                    .HasConstraintName("FK_HotelCustomerCommunication.CustomerID");
            });

            modelBuilder.Entity<JobTitle>(entity =>
            {
                entity.ToTable("JobTitle");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.JobTitle1)
                    .HasMaxLength(50)
                    .HasColumnName("JobTitle");
            });

            modelBuilder.Entity<Minibar>(entity =>
            {
                entity.HasKey(e => new { e.ProductId, e.BookingId })
                    .HasName("PK__Minibar__73359741F45C60B6");

                entity.ToTable("Minibar");

                entity.Property(e => e.ProductId).HasColumnName("ProductID");

                entity.Property(e => e.BookingId).HasColumnName("BookingID");

                entity.HasOne(d => d.Booking)
                    .WithMany(p => p.Minibars)
                    .HasForeignKey(d => d.BookingId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Minibar.BookingID");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.Minibars)
                    .HasForeignKey(d => d.ProductId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Minibar.ProductID");
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.OrderDate).HasColumnType("date");
            });

            modelBuilder.Entity<PaymentDetail>(entity =>
            {
                entity.ToTable("Payment_details");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.PaymentDate).HasColumnType("date");

                entity.Property(e => e.Status)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.TypeId).HasColumnName("TypeID");
            });

            modelBuilder.Entity<PaymentType>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("Payment_Type");

                entity.HasIndex(e => e.Id, "pk");

                entity.Property(e => e.Id)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("ID");

                entity.Property(e => e.PaymentType1)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("PaymentType");
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Cost).HasColumnType("money");

                entity.Property(e => e.OrderId).HasColumnName("OrderID");

                entity.Property(e => e.ProductItem).HasMaxLength(20);

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.OrderId)
                    .HasConstraintName("FK_Products.OrderID");
            });

            modelBuilder.Entity<Rating>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Description).HasMaxLength(200);

                entity.Property(e => e.Rating1).HasColumnName("Rating");
            });

            modelBuilder.Entity<Room>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.CostPerDay)
                    .HasColumnType("money")
                    .HasColumnName("Cost_Per_Day");

                entity.Property(e => e.RoomDeal).HasColumnType("money");

                entity.Property(e => e.RoomNumber).HasMaxLength(10);

                entity.Property(e => e.RoomTypeId).HasColumnName("RoomTypeID");

                entity.HasOne(d => d.RoomType)
                    .WithMany(p => p.Rooms)
                    .HasForeignKey(d => d.RoomTypeId)
                    .HasConstraintName("FK_Rooms.RoomTypeID");
            });

            modelBuilder.Entity<RoomType>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Description).HasMaxLength(50);

                entity.Property(e => e.Type).HasMaxLength(20);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
