USE [master]
GO
/****** Object:  Database [HotelDB]    Script Date: 2022-02-08 07:56:31 ******/
CREATE DATABASE [HotelDB]

ALTER DATABASE [HotelDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HotelDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HotelDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HotelDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HotelDB] SET  MULTI_USER 
GO
ALTER DATABASE [HotelDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HotelDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HotelDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HotelDB] SET QUERY_STORE = OFF
GO
USE [HotelDB]
GO
/****** Object:  Table [dbo].[Arrivals]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arrivals](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ArrivalTime] [datetime2](0) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking_Details]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking_Details](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomersBooked] [float] NULL,
	[NumberOfRooms] [int] NULL,
	[NumberOfExtraBeds] [int] NULL,
	[CostPerExtraBed] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BookedTo] [datetime2](0) NULL,
	[BookedFrom] [datetime2](0) NULL,
	[SpecialRequest] [nvarchar](200) NULL,
	[Breakfast] [varchar](10) NULL,
	[BreakfastCost] [money] NULL,
	[BreakfastDeal] [money] NULL,
	[Status] [varchar](10) NULL,
	[BookingDetailID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings_Arrivals]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings_Arrivals](
	[BookingID] [int] NOT NULL,
	[ArrivalID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC,
	[ArrivalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings_Cancels]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings_Cancels](
	[BookingID] [int] NOT NULL,
	[CancelID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC,
	[CancelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings_CheckOuts]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings_CheckOuts](
	[BookingID] [int] NOT NULL,
	[CheckOutID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC,
	[CheckOutID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings_Customers]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings_Customers](
	[BookingID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC,
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings_FailToArrive]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings_FailToArrive](
	[BookingID] [int] NOT NULL,
	[FailToArriveID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC,
	[FailToArriveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings_Requests]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings_Requests](
	[BookingID] [int] NOT NULL,
	[RequestID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC,
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings_Rooms]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings_Rooms](
	[BookingID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC,
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cancels]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cancels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Time] [datetime2](0) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CheckOuts]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckOuts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CheckoutTime] [datetime2](0) NULL,
	[ExtraBilling] [money] NULL,
	[PaymentDetailID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactPerson]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactPerson](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Relation] [nvarchar](20) NULL,
	[Phone] [varchar](20) NULL,
	[Email] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerRequests]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerRequests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Request] [nvarchar](300) NULL,
	[ExtraCost] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Street] [nvarchar](100) NULL,
	[Zipcode] [varchar](10) NULL,
	[City] [nvarchar](50) NULL,
	[Country] [varchar](30) NULL,
	[Phone] [varchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[Active] [nvarchar](10) NULL,
	[Social_Security_number] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers_Ratings]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers_Ratings](
	[CustomerID] [int] NOT NULL,
	[RatingID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[RatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[TitleID] [int] NULL,
	[Salary] [money] NULL,
	[HireDate] [datetime2](7) NULL,
	[ContactPersonID] [int] NULL,
	[Social_Security_Number] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees_Communication]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees_Communication](
	[EmployeeID] [int] NOT NULL,
	[CommunicationID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[CommunicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FailToArrive]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FailToArrive](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Reason] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelCustomerCommunication]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelCustomerCommunication](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[CustomerMessage] [nvarchar](300) NULL,
	[EmployeeMessage] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobTitle]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTitle](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[JobTitle] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Minibar]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Minibar](
	[ProductID] [int] NOT NULL,
	[BookingID] [int] NOT NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NULL,
	[OrderDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment_details]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_details](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentDate] [date] NULL,
	[Status] [varchar](20) NULL,
	[TypeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment_Type]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_Type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentType] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductItem] [nvarchar](20) NULL,
	[Cost] [money] NULL,
	[OrderID] [int] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Rating] [int] NULL,
	[Description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoomTypeID] [int] NULL,
	[RoomNumber] [nvarchar](10) NULL,
	[Cost_Per_Day] [money] NULL,
	[RoomDeal] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomTypes]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](20) NULL,
	[Description] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Booking_Details] ON 
GO
INSERT [dbo].[Booking_Details] ([ID], [CustomersBooked], [NumberOfRooms], [NumberOfExtraBeds], [CostPerExtraBed]) VALUES (1, 1, 1, 0, 290.9300)
GO
INSERT [dbo].[Booking_Details] ([ID], [CustomersBooked], [NumberOfRooms], [NumberOfExtraBeds], [CostPerExtraBed]) VALUES (2, 2, 1, 1, 264.0100)
GO
INSERT [dbo].[Booking_Details] ([ID], [CustomersBooked], [NumberOfRooms], [NumberOfExtraBeds], [CostPerExtraBed]) VALUES (3, 1, 1, 0, 221.9100)
GO
INSERT [dbo].[Booking_Details] ([ID], [CustomersBooked], [NumberOfRooms], [NumberOfExtraBeds], [CostPerExtraBed]) VALUES (4, 1, 1, 0, 175.0000)
GO
INSERT [dbo].[Booking_Details] ([ID], [CustomersBooked], [NumberOfRooms], [NumberOfExtraBeds], [CostPerExtraBed]) VALUES (5, 2, 2, 0, 236.2500)
GO
INSERT [dbo].[Booking_Details] ([ID], [CustomersBooked], [NumberOfRooms], [NumberOfExtraBeds], [CostPerExtraBed]) VALUES (6, 1, 1, 0, 272.6100)
GO
INSERT [dbo].[Booking_Details] ([ID], [CustomersBooked], [NumberOfRooms], [NumberOfExtraBeds], [CostPerExtraBed]) VALUES (7, 2, 2, 0, 220.9100)
GO
INSERT [dbo].[Booking_Details] ([ID], [CustomersBooked], [NumberOfRooms], [NumberOfExtraBeds], [CostPerExtraBed]) VALUES (8, 1, 1, 0, 116.2400)
GO
INSERT [dbo].[Booking_Details] ([ID], [CustomersBooked], [NumberOfRooms], [NumberOfExtraBeds], [CostPerExtraBed]) VALUES (9, 2, 1, 1, 244.4400)
GO
INSERT [dbo].[Booking_Details] ([ID], [CustomersBooked], [NumberOfRooms], [NumberOfExtraBeds], [CostPerExtraBed]) VALUES (10, 2, 2, 2, 104.1900)
GO
INSERT [dbo].[Booking_Details] ([ID], [CustomersBooked], [NumberOfRooms], [NumberOfExtraBeds], [CostPerExtraBed]) VALUES (11, 1, 1, 0, 230.4600)
GO
INSERT [dbo].[Booking_Details] ([ID], [CustomersBooked], [NumberOfRooms], [NumberOfExtraBeds], [CostPerExtraBed]) VALUES (12, 2, 1, 0, 177.4900)
GO
INSERT [dbo].[Booking_Details] ([ID], [CustomersBooked], [NumberOfRooms], [NumberOfExtraBeds], [CostPerExtraBed]) VALUES (13, 1, 1, 0, 141.4800)
GO
INSERT [dbo].[Booking_Details] ([ID], [CustomersBooked], [NumberOfRooms], [NumberOfExtraBeds], [CostPerExtraBed]) VALUES (14, 1, 1, 0, 275.0100)
GO
INSERT [dbo].[Booking_Details] ([ID], [CustomersBooked], [NumberOfRooms], [NumberOfExtraBeds], [CostPerExtraBed]) VALUES (15, 1, 1, 1, 129.4800)
GO
INSERT [dbo].[Booking_Details] ([ID], [CustomersBooked], [NumberOfRooms], [NumberOfExtraBeds], [CostPerExtraBed]) VALUES (16, 1, 1, 0, 133.7100)
GO
INSERT [dbo].[Booking_Details] ([ID], [CustomersBooked], [NumberOfRooms], [NumberOfExtraBeds], [CostPerExtraBed]) VALUES (17, 2, 1, 1, 100.4500)
GO
INSERT [dbo].[Booking_Details] ([ID], [CustomersBooked], [NumberOfRooms], [NumberOfExtraBeds], [CostPerExtraBed]) VALUES (18, 1, 1, 0, 204.6900)
GO
INSERT [dbo].[Booking_Details] ([ID], [CustomersBooked], [NumberOfRooms], [NumberOfExtraBeds], [CostPerExtraBed]) VALUES (19, 1, 1, 0, 134.5800)
GO
INSERT [dbo].[Booking_Details] ([ID], [CustomersBooked], [NumberOfRooms], [NumberOfExtraBeds], [CostPerExtraBed]) VALUES (20, 1, 1, 0, 259.2200)
GO
INSERT [dbo].[Booking_Details] ([ID], [CustomersBooked], [NumberOfRooms], [NumberOfExtraBeds], [CostPerExtraBed]) VALUES (21, 1, 1, 1, 193.0600)
GO
INSERT [dbo].[Booking_Details] ([ID], [CustomersBooked], [NumberOfRooms], [NumberOfExtraBeds], [CostPerExtraBed]) VALUES (22, 1, 1, 1, 153.9000)
GO
INSERT [dbo].[Booking_Details] ([ID], [CustomersBooked], [NumberOfRooms], [NumberOfExtraBeds], [CostPerExtraBed]) VALUES (23, 1, 1, 0, 105.4000)
GO
INSERT [dbo].[Booking_Details] ([ID], [CustomersBooked], [NumberOfRooms], [NumberOfExtraBeds], [CostPerExtraBed]) VALUES (24, 1, 1, 0, 191.1300)
GO
SET IDENTITY_INSERT [dbo].[Booking_Details] OFF
GO
SET IDENTITY_INSERT [dbo].[Bookings] ON 
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (3, CAST(N'2021-06-23T00:00:00.0000000' AS DateTime2), CAST(N'2021-06-15T00:00:00.0000000' AS DateTime2), N'vodka in the room', N'yes', 225.7700, 67.5200, NULL, 1)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (4, CAST(N'2021-06-10T00:00:00.0000000' AS DateTime2), CAST(N'2021-05-22T00:00:00.0000000' AS DateTime2), N'null', N'No', 115.3200, 60.5600, NULL, 2)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (5, CAST(N'2021-06-25T00:00:00.0000000' AS DateTime2), CAST(N'2021-07-06T00:00:00.0000000' AS DateTime2), N'breakfast on the room', N'no', 180.5900, 56.5600, NULL, 2)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (6, CAST(N'2021-02-15T00:00:00.0000000' AS DateTime2), CAST(N'2022-01-21T00:00:00.0000000' AS DateTime2), NULL, N'Yes', 123.0100, 53.6400, NULL, 3)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (7, CAST(N'2021-01-25T00:00:00.0000000' AS DateTime2), CAST(N'2022-01-22T00:00:00.0000000' AS DateTime2), NULL, N'yes', 267.1900, 66.6700, NULL, 4)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (8, CAST(N'2021-11-18T00:00:00.0000000' AS DateTime2), CAST(N'2021-11-11T00:00:00.0000000' AS DateTime2), N'extra towels', N'no', 262.4200, 51.9100, NULL, 5)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (9, CAST(N'2021-12-28T00:00:00.0000000' AS DateTime2), CAST(N'2021-12-03T00:00:00.0000000' AS DateTime2), NULL, N'no', 200.8500, 53.0400, NULL, 5)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (10, CAST(N'2021-03-13T00:00:00.0000000' AS DateTime2), CAST(N'2021-03-11T00:00:00.0000000' AS DateTime2), NULL, N'no', 127.9700, 68.5100, NULL, 6)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (11, CAST(N'2021-04-06T00:00:00.0000000' AS DateTime2), CAST(N'2021-03-29T00:00:00.0000000' AS DateTime2), N'late breakfast', N'yes', 228.2100, 57.0300, NULL, 7)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (12, CAST(N'2021-05-20T00:00:00.0000000' AS DateTime2), CAST(N'2021-05-12T00:00:00.0000000' AS DateTime2), NULL, N'yes', 272.2000, 60.1700, NULL, 7)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (13, CAST(N'2021-03-05T00:00:00.0000000' AS DateTime2), CAST(N'2021-02-10T00:00:00.0000000' AS DateTime2), NULL, N'yes', 213.7900, 68.3600, NULL, 8)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (14, CAST(N'2021-02-05T00:00:00.0000000' AS DateTime2), CAST(N'2022-02-01T00:00:00.0000000' AS DateTime2), N'No windows', N'yes', 134.9500, 63.2900, NULL, 9)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (15, CAST(N'2021-07-19T00:00:00.0000000' AS DateTime2), CAST(N'2021-06-23T00:00:00.0000000' AS DateTime2), NULL, N'yes', 158.1300, 66.7200, NULL, 9)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (16, CAST(N'2021-08-02T00:00:00.0000000' AS DateTime2), CAST(N'2021-07-03T00:00:00.0000000' AS DateTime2), N'great view', N'yes', 114.2700, 66.8800, NULL, 10)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (17, CAST(N'2021-10-30T00:00:00.0000000' AS DateTime2), CAST(N'2021-10-13T00:00:00.0000000' AS DateTime2), NULL, N'yes', 226.0100, 51.6300, NULL, 11)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (18, CAST(N'2021-05-22T00:00:00.0000000' AS DateTime2), CAST(N'2021-05-07T00:00:00.0000000' AS DateTime2), NULL, N'yes', 260.4400, 57.8200, NULL, 12)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (19, CAST(N'2021-12-06T00:00:00.0000000' AS DateTime2), CAST(N'2021-12-03T00:00:00.0000000' AS DateTime2), N'late leave', N'yes', 102.7300, 61.5800, NULL, 12)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (20, CAST(N'2021-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2021-09-22T00:00:00.0000000' AS DateTime2), NULL, N'yes', 155.3300, 55.6800, NULL, 13)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (21, CAST(N'2021-10-14T00:00:00.0000000' AS DateTime2), CAST(N'2021-10-02T00:00:00.0000000' AS DateTime2), NULL, N'no', 279.1900, 51.5000, NULL, 14)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (22, CAST(N'2021-07-27T00:00:00.0000000' AS DateTime2), CAST(N'2021-07-25T00:00:00.0000000' AS DateTime2), N'early access to the room', N'no', 136.4300, 66.1200, NULL, 15)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (23, CAST(N'2021-02-02T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-18T00:00:00.0000000' AS DateTime2), NULL, N'no', 212.8000, 54.0100, NULL, 16)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (24, CAST(N'2021-04-16T00:00:00.0000000' AS DateTime2), CAST(N'2021-03-09T00:00:00.0000000' AS DateTime2), NULL, N'no', 189.8800, 69.6700, NULL, 17)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (25, CAST(N'2021-10-30T00:00:00.0000000' AS DateTime2), CAST(N'2021-10-04T00:00:00.0000000' AS DateTime2), NULL, N'no', 210.3700, 53.4000, NULL, 17)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (26, CAST(N'2021-07-16T00:00:00.0000000' AS DateTime2), CAST(N'2021-07-13T00:00:00.0000000' AS DateTime2), NULL, N'no', 242.2700, 53.3500, NULL, 18)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (27, CAST(N'2021-05-22T00:00:00.0000000' AS DateTime2), CAST(N'2021-05-03T00:00:00.0000000' AS DateTime2), NULL, N'no', 170.4600, 57.7700, NULL, 19)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (28, CAST(N'2021-08-06T00:00:00.0000000' AS DateTime2), CAST(N'2021-07-11T00:00:00.0000000' AS DateTime2), N'no windows', N'no', 271.3300, 56.1800, NULL, 20)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (29, CAST(N'2021-11-27T00:00:00.0000000' AS DateTime2), CAST(N'2021-11-01T00:00:00.0000000' AS DateTime2), NULL, N'no', 172.8900, 54.8300, NULL, 21)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (30, CAST(N'2021-01-23T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-07T00:00:00.0000000' AS DateTime2), NULL, N'no', 287.7500, 68.3200, NULL, 22)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (31, CAST(N'2021-12-30T00:00:00.0000000' AS DateTime2), CAST(N'2021-12-03T00:00:00.0000000' AS DateTime2), N'extra sheet', N'no', 204.7000, 69.5500, N'CANCELLED', 23)
GO
INSERT [dbo].[Bookings] ([ID], [BookedTo], [BookedFrom], [SpecialRequest], [Breakfast], [BreakfastCost], [BreakfastDeal], [Status], [BookingDetailID]) VALUES (32, CAST(N'2021-06-05T00:00:00.0000000' AS DateTime2), CAST(N'2021-05-15T00:00:00.0000000' AS DateTime2), NULL, N'no', 101.4600, 54.2100, NULL, 24)
GO
SET IDENTITY_INSERT [dbo].[Bookings] OFF
GO
INSERT [dbo].[Bookings_Cancels] ([BookingID], [CancelID]) VALUES (31, 3)
GO
INSERT [dbo].[Bookings_Customers] ([BookingID], [CustomerID]) VALUES (3, 4)
GO
INSERT [dbo].[Bookings_Customers] ([BookingID], [CustomerID]) VALUES (4, 5)
GO
INSERT [dbo].[Bookings_Customers] ([BookingID], [CustomerID]) VALUES (5, 6)
GO
INSERT [dbo].[Bookings_Customers] ([BookingID], [CustomerID]) VALUES (5, 7)
GO
INSERT [dbo].[Bookings_Customers] ([BookingID], [CustomerID]) VALUES (6, 8)
GO
INSERT [dbo].[Bookings_Customers] ([BookingID], [CustomerID]) VALUES (7, 9)
GO
INSERT [dbo].[Bookings_Customers] ([BookingID], [CustomerID]) VALUES (7, 10)
GO
INSERT [dbo].[Bookings_Customers] ([BookingID], [CustomerID]) VALUES (11, 7)
GO
INSERT [dbo].[Bookings_Rooms] ([BookingID], [RoomID]) VALUES (3, 1)
GO
INSERT [dbo].[Bookings_Rooms] ([BookingID], [RoomID]) VALUES (4, 2)
GO
INSERT [dbo].[Bookings_Rooms] ([BookingID], [RoomID]) VALUES (5, 6)
GO
INSERT [dbo].[Bookings_Rooms] ([BookingID], [RoomID]) VALUES (6, 8)
GO
INSERT [dbo].[Bookings_Rooms] ([BookingID], [RoomID]) VALUES (7, 11)
GO
INSERT [dbo].[Bookings_Rooms] ([BookingID], [RoomID]) VALUES (8, 66)
GO
INSERT [dbo].[Bookings_Rooms] ([BookingID], [RoomID]) VALUES (9, 45)
GO
INSERT [dbo].[Bookings_Rooms] ([BookingID], [RoomID]) VALUES (10, 88)
GO
SET IDENTITY_INSERT [dbo].[Cancels] ON 
GO
INSERT [dbo].[Cancels] ([ID], [Time]) VALUES (3, CAST(N'2022-02-04T14:59:59.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Cancels] OFF
GO
SET IDENTITY_INSERT [dbo].[ContactPerson] ON 
GO
INSERT [dbo].[ContactPerson] ([ID], [FullName], [Relation], [Phone], [Email]) VALUES (1, N'Grace Bohden', NULL, N'262 282 7545', N'gbohden0@g.co')
GO
INSERT [dbo].[ContactPerson] ([ID], [FullName], [Relation], [Phone], [Email]) VALUES (2, N'Dorris Dumbar', NULL, N'768 101 0112', N'ddumbar1@istockphoto.com')
GO
INSERT [dbo].[ContactPerson] ([ID], [FullName], [Relation], [Phone], [Email]) VALUES (3, N'Ciro Galer', NULL, N'138 898 4532', N'cgaler2@ca.gov')
GO
INSERT [dbo].[ContactPerson] ([ID], [FullName], [Relation], [Phone], [Email]) VALUES (4, N'Gayle D''Alessandro', NULL, N'559 306 7476', N'gdalessandro3@amazonaws.com')
GO
INSERT [dbo].[ContactPerson] ([ID], [FullName], [Relation], [Phone], [Email]) VALUES (5, N'Hartley Fullager', NULL, N'831 233 1748', N'hfullager4@dailymotion.com')
GO
INSERT [dbo].[ContactPerson] ([ID], [FullName], [Relation], [Phone], [Email]) VALUES (6, N'Mollie Hullyer', NULL, N'885 503 0972', N'mhullyer5@webnode.com')
GO
INSERT [dbo].[ContactPerson] ([ID], [FullName], [Relation], [Phone], [Email]) VALUES (7, N'George Costelow', NULL, N'587 515 6396', N'gcostelow6@about.me')
GO
INSERT [dbo].[ContactPerson] ([ID], [FullName], [Relation], [Phone], [Email]) VALUES (8, N'Barbette Chimes', NULL, N'828 700 1848', N'bchimes7@github.com')
GO
INSERT [dbo].[ContactPerson] ([ID], [FullName], [Relation], [Phone], [Email]) VALUES (9, N'Ina Aspell', NULL, N'407 828 7116', N'iaspell8@cbsnews.com')
GO
INSERT [dbo].[ContactPerson] ([ID], [FullName], [Relation], [Phone], [Email]) VALUES (10, N'Alfreda Ridd', NULL, N'312 349 9581', N'aridd9@wiley.com')
GO
SET IDENTITY_INSERT [dbo].[ContactPerson] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (1, N'Pepi', N'Jacob', N'Killdeer', NULL, N'Nyköping', N'Sweden', N'203 228 7310', N'pjacob0@mit.edu', NULL, N'20030613-5997')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (2, N'Isahella', N'Oakenfull', N'Glacier Hill', NULL, N'Umeå', N'Sweden', N'549 215 1486', N'ioakenfull1@oakley.com', NULL, N'20030613-5922')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (3, N'Natty', N'Reinmar', N'Stoughton', NULL, N'Heby', N'Sweden', N'540 754 2158', N'nreinmar2@g.co', NULL, N'20030613-5906')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (4, N'Prudence', N'Sockell', N'Northport', NULL, N'Älvsjö', N'Sweden', N'432 775 3870', N'psockell3@amazon.co.uk', NULL, N'19930613-5956')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (5, N'Murial', N'Garrad', N'Truax', NULL, N'Västerås', N'Sweden', N'774 570 8148', N'mgarrad4@sohu.com', NULL, N'19941005-7120')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (6, N'Alia', N'Pownall', N'Prentice', NULL, N'Oslo', N'Norway', N'248 923 2203', N'apownall5@independent.co.uk', NULL, N'19930924-1660')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (7, N'Judye', N'Amorts', N'Morning', NULL, N'Kalix', N'Sweden', N'758 985 7622', N'jamorts6@google.co.jp', NULL, N'19820225-3848')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (8, N'Far', N'O'' Connell', N'Vermont', NULL, N'Degerfors', N'Sweden', N'936 411 2663', N'foconnell7@barnesandnoble.com', NULL, N'19481218-9613')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (9, N'Zondra', N'Ianitti', N'Tomscot', NULL, N'Drammen', N'Norway', N'586 342 8774', N'zianitti8@webeden.co.uk', NULL, N'19520915-6628')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (10, N'Amata', N'Laguerre', N'Arkansas', NULL, N'Sandefjord', N'Norway', N'997 257 3997', N'alaguerre9@soup.io', NULL, N'19841110-9542')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (11, N'Billie', N'Rochell', N'Thompson', NULL, N'Järfälla', N'Sweden', N'860 380 9379', N'brochella@comcast.net', NULL, N'19600809-5876')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (12, N'Koren', N'Crier', N'Talisman', NULL, N'Sundsvall', N'Sweden', N'257 349 6155', N'kcrierb@stanford.edu', NULL, N'19830128-7473')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (13, N'Willey', N'Le Pruvost', N'Hallows', NULL, N'Harstad', N'Norway', N'366 225 6886', N'wlepruvostc@simplemachines.org', NULL, N'19960724-5934')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (14, N'Ara', N'Smallpiece', N'Ridge Oak', NULL, N'Årsta', N'Sweden', N'246 911 1540', N'asmallpieced@icq.com', NULL, N'19461206-0964')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (15, N'Cherianne', N'Scatchar', N'Petterle', NULL, N'Oslo', N'Norway', N'919 764 4225', N'cscatchare@weather.com', NULL, N'19991206-0960')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (16, N'Janine', N'Darling', N'Schlimgen', NULL, N'Skurup', N'Sweden', N'408 313 3587', N'jdarlingf@answers.com', NULL, N'19660412-2389')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (17, N'Greer', N'Agent', N'Kings', NULL, N'Arlöv', N'Sweden', N'682 651 5830', N'gagentg@dropbox.com', NULL, N'19730412-0558')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (18, N'Leigh', N'Mather', N'David', NULL, N'Visby', N'Sweden', N'172 754 1784', N'lmatherh@senate.gov', NULL, N'19840705-5204')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (19, N'Lanie', N'Crackel', N'Dixon', NULL, N'Bromma', N'Sweden', N'716 336 0599', N'lcrackeli@nationalgeographic.com', NULL, N'19791229-7723')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (20, N'Toddy', N'Bolte', N'Farragut', NULL, N'Uddevalla', N'Sweden', N'396 596 1275', N'tboltej@slideshare.net', NULL, N'19970522-3072')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (21, N'Karol', N'Benoi', N'American', NULL, N'Boden', N'Sweden', N'515 743 8530', N'kbenoik@diigo.com', NULL, N'20020910-9286')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (22, N'Robinett', N'Bracken', N'Comanche', NULL, N'Oxelösund', N'Sweden', N'904 231 2639', N'rbrackenl@liveinternet.ru', NULL, N'19530501-5033')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (23, N'Murielle', N'Jurasz', N'Waywood', NULL, N'Örbyhus', N'Sweden', N'265 781 1055', N'mjuraszm@qq.com', NULL, N'19530501-5066')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (24, N'Amata', N'Fellow', N'Buhler', NULL, N'Enskede', N'Sweden', N'478 235 1419', N'afellown@dedecms.com', NULL, N'20010421-3756')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (25, N'Guntar', N'Smewin', N'Rieder', NULL, N'Stockholm', N'Sweden', N'303 658 2971', N'gsmewino@pcworld.com', NULL, N'19710820-1091')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (26, N'Doris', N'Rigg', N'Shasta', NULL, N'Örebro', N'Sweden', N'155 945 6053', N'driggp@rediff.com', NULL, N'19781020-4698')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (27, N'Orazio', N'Simonson', N'Lake View', NULL, N'Oslo', N'Norway', N'894 991 3915', N'osimonsonq@paypal.com', NULL, N'19661108-6171')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (28, N'Gustie', N'Sommersett', N'Pierstorff', NULL, N'Nacka', N'Sweden', N'603 179 2502', N'gsommersettr@bloomberg.com', NULL, N'20000227-6459')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (29, N'Alane', N'Golden of Ireland', N'Bellgrove', NULL, N'Eskilstuna', N'Sweden', N'284 278 5417', N'agoldenofirelands@sfgate.com', NULL, N'20031203-9605')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (30, N'Sheilakathryn', N'Maitland', N'Scott', NULL, N'Kungälv', N'Sweden', N'839 379 1241', N'smaitlandt@wikia.com', NULL, N'19450803-7209')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (31, N'Ericka', N'Hillum', N'Schiller', NULL, N'Limmared', N'Sweden', N'579 652 1387', N'ehillumu@yandex.ru', NULL, N'19950919-3828')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (32, N'Amory', N'Vedenichev', N'Fairfield', NULL, N'Gävle', N'Sweden', N'323 295 8584', N'avedenichevv@scribd.com', NULL, N'19370606-8727')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (33, N'Dominique', N'Nolder', N'Myrtle', NULL, N'Ingarö', N'Sweden', N'753 525 5709', N'dnolderw@smugmug.com', NULL, N'19530112-6511')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (34, N'Arlene', N'Redihough', N'Tennessee', NULL, N'Sala', N'Sweden', N'150 155 6401', N'aredihoughx@a8.net', NULL, N'19340620-0885')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (35, N'Daryle', N'Esby', N'Luster', NULL, N'Stockholm', N'Sweden', N'894 938 6322', N'desbyy@wikispaces.com', NULL, N'19401219-3951')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (36, N'Verena', N'Scogings', N'Randy', NULL, N'Helsingborg', N'Sweden', N'874 259 6899', N'vscogingsz@apple.com', NULL, N'19600628-3987')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (37, N'Ariel', N'Wortley', N'Maple', NULL, N'Kalmar', N'Sweden', N'223 463 8490', N'awortley10@chron.com', NULL, N'19780926-4901')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (38, N'Lyda', N'Keuneke', N'Homewood', NULL, N'Göteborg', N'Sweden', N'591 307 1968', N'lkeuneke11@yahoo.co.jp', NULL, N'19480710-0625')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (39, N'Anna-diana', N'Gerler', N'Susan', NULL, N'Kungshamn', N'Sweden', N'801 575 2342', N'agerler12@alexa.com', NULL, N'19690713-4826')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (40, N'Benedetto', N'Tofanini', N'Monument', NULL, N'Falun', N'Sweden', N'211 350 6350', N'btofanini13@usda.gov', NULL, N'19870822-8542')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Street], [Zipcode], [City], [Country], [Phone], [Email], [Active], [Social_Security_number]) VALUES (42, N'Carl', N'Johans', N'Johans väg 10', N'12345', N'gothenburg', N'Sweden', N'0123231233', N'calle@asdasd.com', N'Yes', N'199001234133')
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
INSERT [dbo].[Customers_Ratings] ([CustomerID], [RatingID]) VALUES (1, 1)
GO
INSERT [dbo].[Customers_Ratings] ([CustomerID], [RatingID]) VALUES (2, 3)
GO
INSERT [dbo].[Customers_Ratings] ([CustomerID], [RatingID]) VALUES (3, 2)
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 
GO
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Address], [TitleID], [Salary], [HireDate], [ContactPersonID], [Social_Security_Number]) VALUES (1, N'Marrissa', N'Peacey', N'5 Morning Place', 1, 50000.0000, CAST(N'2020-01-03T00:00:00.0000000' AS DateTime2), 1, N'625-50-8948')
GO
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Address], [TitleID], [Salary], [HireDate], [ContactPersonID], [Social_Security_Number]) VALUES (2, N'Paddie', N'Cranidge', N'443 Fuller Park', 2, 42000.0000, CAST(N'2020-07-12T00:00:00.0000000' AS DateTime2), 2, N'347-13-0108')
GO
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Address], [TitleID], [Salary], [HireDate], [ContactPersonID], [Social_Security_Number]) VALUES (3, N'Perkin', N'Hunn', N'81374 Fallview Point', 3, 37240.0000, CAST(N'2020-07-05T00:00:00.0000000' AS DateTime2), 3, N'239-77-5448')
GO
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Address], [TitleID], [Salary], [HireDate], [ContactPersonID], [Social_Security_Number]) VALUES (4, N'Mersey', N'Tarren', N'660 Monica Park', 4, 32315.0000, CAST(N'2020-12-22T00:00:00.0000000' AS DateTime2), 4, N'716-10-0784')
GO
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Address], [TitleID], [Salary], [HireDate], [ContactPersonID], [Social_Security_Number]) VALUES (5, N'Idelle', N'McKaile', N'4873 Declaration Plaza', 4, 32280.0000, CAST(N'2021-10-09T00:00:00.0000000' AS DateTime2), 5, N'187-34-7494')
GO
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Address], [TitleID], [Salary], [HireDate], [ContactPersonID], [Social_Security_Number]) VALUES (6, N'Cyrill', N'Le Brom', N'45 Clarendon Avenue', 4, 32547.0000, CAST(N'2020-05-16T00:00:00.0000000' AS DateTime2), 6, N'243-54-9638')
GO
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Address], [TitleID], [Salary], [HireDate], [ContactPersonID], [Social_Security_Number]) VALUES (7, N'Noni', N'Dowyer', N'4 Del Sol Road', 4, 36473.0000, CAST(N'2021-11-16T00:00:00.0000000' AS DateTime2), 7, N'141-53-2707')
GO
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Address], [TitleID], [Salary], [HireDate], [ContactPersonID], [Social_Security_Number]) VALUES (8, N'Carole', N'Shee', N'309 Haas Place', 4, 32899.0000, CAST(N'2020-01-17T00:00:00.0000000' AS DateTime2), 8, N'168-61-4232')
GO
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Address], [TitleID], [Salary], [HireDate], [ContactPersonID], [Social_Security_Number]) VALUES (9, N'Elsa', N'Tefft', N'48 Swallow Place', 4, 32492.0000, CAST(N'2021-12-14T00:00:00.0000000' AS DateTime2), 9, N'218-95-7440')
GO
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Address], [TitleID], [Salary], [HireDate], [ContactPersonID], [Social_Security_Number]) VALUES (10, N'Josie', N'Pach', N'26205 Morning Crossing', 4, 35783.0000, CAST(N'2020-07-21T00:00:00.0000000' AS DateTime2), 10, N'140-63-6619')
GO
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
INSERT [dbo].[Employees_Communication] ([EmployeeID], [CommunicationID]) VALUES (1, 1)
GO
INSERT [dbo].[Employees_Communication] ([EmployeeID], [CommunicationID]) VALUES (1, 2)
GO
SET IDENTITY_INSERT [dbo].[HotelCustomerCommunication] ON 
GO
INSERT [dbo].[HotelCustomerCommunication] ([ID], [CustomerID], [CustomerMessage], [EmployeeMessage]) VALUES (1, 1, N'Can i have an champane bottle on my room when i arrive', N'Yes we will fix that for you')
GO
INSERT [dbo].[HotelCustomerCommunication] ([ID], [CustomerID], [CustomerMessage], [EmployeeMessage]) VALUES (2, 2, N'when does the breakfast open', N'from 8am to 11 am is the breakfast available')
GO
SET IDENTITY_INSERT [dbo].[HotelCustomerCommunication] OFF
GO
SET IDENTITY_INSERT [dbo].[JobTitle] ON 
GO
INSERT [dbo].[JobTitle] ([ID], [JobTitle]) VALUES (1, N'Director')
GO
INSERT [dbo].[JobTitle] ([ID], [JobTitle]) VALUES (2, N'Manager')
GO
INSERT [dbo].[JobTitle] ([ID], [JobTitle]) VALUES (3, N'Team Leader')
GO
INSERT [dbo].[JobTitle] ([ID], [JobTitle]) VALUES (4, N'Receptionist')
GO
SET IDENTITY_INSERT [dbo].[JobTitle] OFF
GO
INSERT [dbo].[Minibar] ([ProductID], [BookingID], [Quantity]) VALUES (1, 7, 5)
GO
INSERT [dbo].[Minibar] ([ProductID], [BookingID], [Quantity]) VALUES (2, 5, 5)
GO
INSERT [dbo].[Minibar] ([ProductID], [BookingID], [Quantity]) VALUES (2, 7, 5)
GO
INSERT [dbo].[Minibar] ([ProductID], [BookingID], [Quantity]) VALUES (3, 11, 5)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([ID], [Quantity], [OrderDate]) VALUES (1, 500, CAST(N'2021-12-21' AS Date))
GO
INSERT [dbo].[Orders] ([ID], [Quantity], [OrderDate]) VALUES (2, 45, CAST(N'2021-11-22' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment_details] ON 
GO
INSERT [dbo].[Payment_details] ([ID], [PaymentDate], [Status], [TypeID]) VALUES (1, CAST(N'2022-02-04' AS Date), N'PAID', 1)
GO
INSERT [dbo].[Payment_details] ([ID], [PaymentDate], [Status], [TypeID]) VALUES (2, CAST(N'2022-02-04' AS Date), N'PAID', 1)
GO
INSERT [dbo].[Payment_details] ([ID], [PaymentDate], [Status], [TypeID]) VALUES (3, CAST(N'2022-02-04' AS Date), N'sent.Not paid', 3)
GO
INSERT [dbo].[Payment_details] ([ID], [PaymentDate], [Status], [TypeID]) VALUES (4, CAST(N'2022-02-04' AS Date), N'Sent, paid', 3)
GO
INSERT [dbo].[Payment_details] ([ID], [PaymentDate], [Status], [TypeID]) VALUES (5, CAST(N'2022-02-04' AS Date), N'PAID', 2)
GO
INSERT [dbo].[Payment_details] ([ID], [PaymentDate], [Status], [TypeID]) VALUES (6, CAST(N'2022-02-04' AS Date), N'PAID', 2)
GO
INSERT [dbo].[Payment_details] ([ID], [PaymentDate], [Status], [TypeID]) VALUES (7, CAST(N'2022-02-04' AS Date), N'In transaction', 4)
GO
INSERT [dbo].[Payment_details] ([ID], [PaymentDate], [Status], [TypeID]) VALUES (8, CAST(N'2022-02-04' AS Date), N'PAID', 4)
GO
INSERT [dbo].[Payment_details] ([ID], [PaymentDate], [Status], [TypeID]) VALUES (9, CAST(N'2022-02-04' AS Date), N'PAID', 1)
GO
INSERT [dbo].[Payment_details] ([ID], [PaymentDate], [Status], [TypeID]) VALUES (10, CAST(N'2022-02-04' AS Date), N'in transaction', 5)
GO
SET IDENTITY_INSERT [dbo].[Payment_details] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment_Type] ON 
GO
INSERT [dbo].[Payment_Type] ([ID], [PaymentType]) VALUES (1, N'MasterCard')
GO
INSERT [dbo].[Payment_Type] ([ID], [PaymentType]) VALUES (2, N'Visa')
GO
INSERT [dbo].[Payment_Type] ([ID], [PaymentType]) VALUES (3, N'Invoice')
GO
INSERT [dbo].[Payment_Type] ([ID], [PaymentType]) VALUES (4, N'Paypal')
GO
INSERT [dbo].[Payment_Type] ([ID], [PaymentType]) VALUES (5, N'Bitcoin')
GO
SET IDENTITY_INSERT [dbo].[Payment_Type] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([ID], [ProductItem], [Cost], [OrderID], [Quantity]) VALUES (1, N'Cola', 15.0000, 1, 100)
GO
INSERT [dbo].[Products] ([ID], [ProductItem], [Cost], [OrderID], [Quantity]) VALUES (2, N'Fanta', 14.0000, NULL, 1000)
GO
INSERT [dbo].[Products] ([ID], [ProductItem], [Cost], [OrderID], [Quantity]) VALUES (3, N'heiniken', 24.0000, NULL, 1000)
GO
INSERT [dbo].[Products] ([ID], [ProductItem], [Cost], [OrderID], [Quantity]) VALUES (4, N'Nut Mix', 25.0000, 2, 440)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Ratings] ON 
GO
INSERT [dbo].[Ratings] ([ID], [Rating], [Description]) VALUES (1, 5, N'I realy enjoyed my stay here. will choose this hotel in the feauture')
GO
INSERT [dbo].[Ratings] ([ID], [Rating], [Description]) VALUES (2, 2, N'The room smelled wired')
GO
INSERT [dbo].[Ratings] ([ID], [Rating], [Description]) VALUES (3, 5, N'AWSOME')
GO
SET IDENTITY_INSERT [dbo].[Ratings] OFF
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (1, 2, N'1', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (2, 2, N'2', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (3, 2, N'3', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (4, 1, N'4', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (5, 2, N'5', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (6, 2, N'6', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (7, 1, N'7', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (8, 2, N'8', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (9, 2, N'9', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (10, 2, N'10', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (11, 1, N'11', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (12, 2, N'12', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (13, 1, N'13', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (14, 1, N'14', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (15, 2, N'15', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (16, 1, N'16', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (17, 2, N'17', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (18, 2, N'18', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (19, 1, N'19', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (20, 2, N'20', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (21, 1, N'21', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (22, 2, N'22', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (23, 1, N'23', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (24, 2, N'24', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (25, 1, N'25', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (26, 2, N'26', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (27, 1, N'27', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (28, 2, N'28', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (29, 2, N'29', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (30, 1, N'30', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (31, 2, N'31', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (32, 2, N'32', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (33, 1, N'33', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (34, 2, N'34', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (35, 2, N'35', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (36, 1, N'36', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (37, 1, N'37', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (38, 1, N'38', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (39, 2, N'39', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (40, 2, N'40', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (41, 2, N'41', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (42, 1, N'42', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (43, 1, N'43', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (44, 2, N'44', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (45, 2, N'45', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (46, 1, N'46', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (47, 2, N'47', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (48, 1, N'48', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (49, 1, N'49', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (50, 1, N'50', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (51, 1, N'51', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (52, 2, N'52', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (53, 1, N'53', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (54, 1, N'54', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (55, 1, N'55', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (56, 2, N'56', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (57, 2, N'57', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (58, 1, N'58', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (59, 1, N'59', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (60, 2, N'60', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (61, 2, N'61', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (62, 2, N'62', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (63, 1, N'63', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (64, 1, N'64', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (65, 1, N'65', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (66, 2, N'66', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (67, 2, N'67', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (68, 1, N'68', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (69, 1, N'69', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (70, 1, N'70', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (71, 2, N'71', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (72, 1, N'72', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (73, 2, N'73', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (74, 2, N'74', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (75, 2, N'75', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (76, 2, N'76', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (77, 1, N'77', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (78, 2, N'78', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (79, 2, N'79', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (80, 2, N'80', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (81, 1, N'81', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (82, 2, N'82', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (83, 1, N'83', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (84, 1, N'84', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (85, 2, N'85', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (86, 2, N'86', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (87, 2, N'87', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (88, 1, N'88', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (89, 1, N'89', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (90, 2, N'90', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (91, 2, N'91', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (92, 2, N'92', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (93, 2, N'93', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (94, 1, N'94', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (95, 2, N'95', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (96, 1, N'96', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (97, 1, N'97', 777.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (98, 2, N'98', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (99, 2, N'99', 999.0000, NULL)
GO
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomNumber], [Cost_Per_Day], [RoomDeal]) VALUES (100, 1, N'100', 777.0000, NULL)
GO
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomTypes] ON 
GO
INSERT [dbo].[RoomTypes] ([ID], [Type], [Description]) VALUES (1, N'Singel room', N'Singel Room one bed')
GO
INSERT [dbo].[RoomTypes] ([ID], [Type], [Description]) VALUES (2, N'Dubbel Room room', N' Dubbel room, two beds')
GO
SET IDENTITY_INSERT [dbo].[RoomTypes] OFF
GO
/****** Object:  Index [Fk]    Script Date: 2022-02-08 07:56:31 ******/
CREATE NONCLUSTERED INDEX [Fk] ON [dbo].[CheckOuts]
(
	[PaymentDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [pk]    Script Date: 2022-02-08 07:56:31 ******/
CREATE NONCLUSTERED INDEX [pk] ON [dbo].[Payment_Type]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings.BookingDetailID] FOREIGN KEY([BookingDetailID])
REFERENCES [dbo].[Booking_Details] ([ID])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings.BookingDetailID]
GO
ALTER TABLE [dbo].[Bookings_Arrivals]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Arrivals.ArrivalID] FOREIGN KEY([ArrivalID])
REFERENCES [dbo].[Arrivals] ([ID])
GO
ALTER TABLE [dbo].[Bookings_Arrivals] CHECK CONSTRAINT [FK_Bookings_Arrivals.ArrivalID]
GO
ALTER TABLE [dbo].[Bookings_Arrivals]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Arrivals.BookingID] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Bookings] ([ID])
GO
ALTER TABLE [dbo].[Bookings_Arrivals] CHECK CONSTRAINT [FK_Bookings_Arrivals.BookingID]
GO
ALTER TABLE [dbo].[Bookings_Cancels]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Cancels.BookingID] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Bookings] ([ID])
GO
ALTER TABLE [dbo].[Bookings_Cancels] CHECK CONSTRAINT [FK_Bookings_Cancels.BookingID]
GO
ALTER TABLE [dbo].[Bookings_Cancels]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Cancels.CancelID] FOREIGN KEY([CancelID])
REFERENCES [dbo].[Cancels] ([ID])
GO
ALTER TABLE [dbo].[Bookings_Cancels] CHECK CONSTRAINT [FK_Bookings_Cancels.CancelID]
GO
ALTER TABLE [dbo].[Bookings_CheckOuts]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_CheckOuts.BookingID] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Bookings] ([ID])
GO
ALTER TABLE [dbo].[Bookings_CheckOuts] CHECK CONSTRAINT [FK_Bookings_CheckOuts.BookingID]
GO
ALTER TABLE [dbo].[Bookings_CheckOuts]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_CheckOuts.CheckOutID] FOREIGN KEY([CheckOutID])
REFERENCES [dbo].[CheckOuts] ([ID])
GO
ALTER TABLE [dbo].[Bookings_CheckOuts] CHECK CONSTRAINT [FK_Bookings_CheckOuts.CheckOutID]
GO
ALTER TABLE [dbo].[Bookings_Customers]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Customers.BookingID] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Bookings] ([ID])
GO
ALTER TABLE [dbo].[Bookings_Customers] CHECK CONSTRAINT [FK_Bookings_Customers.BookingID]
GO
ALTER TABLE [dbo].[Bookings_Customers]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Customers.CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([ID])
GO
ALTER TABLE [dbo].[Bookings_Customers] CHECK CONSTRAINT [FK_Bookings_Customers.CustomerID]
GO
ALTER TABLE [dbo].[Bookings_FailToArrive]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_FailToArrive.BookingID] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Bookings] ([ID])
GO
ALTER TABLE [dbo].[Bookings_FailToArrive] CHECK CONSTRAINT [FK_Bookings_FailToArrive.BookingID]
GO
ALTER TABLE [dbo].[Bookings_Requests]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Requests.BookingID] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Bookings] ([ID])
GO
ALTER TABLE [dbo].[Bookings_Requests] CHECK CONSTRAINT [FK_Bookings_Requests.BookingID]
GO
ALTER TABLE [dbo].[Bookings_Requests]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Requests.RequestID] FOREIGN KEY([RequestID])
REFERENCES [dbo].[CustomerRequests] ([ID])
GO
ALTER TABLE [dbo].[Bookings_Requests] CHECK CONSTRAINT [FK_Bookings_Requests.RequestID]
GO
ALTER TABLE [dbo].[Bookings_Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Rooms.BookingID] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Bookings] ([ID])
GO
ALTER TABLE [dbo].[Bookings_Rooms] CHECK CONSTRAINT [FK_Bookings_Rooms.BookingID]
GO
ALTER TABLE [dbo].[Bookings_Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Rooms.RoomID] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([ID])
GO
ALTER TABLE [dbo].[Bookings_Rooms] CHECK CONSTRAINT [FK_Bookings_Rooms.RoomID]
GO
ALTER TABLE [dbo].[Customers_Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Ratings.CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([ID])
GO
ALTER TABLE [dbo].[Customers_Ratings] CHECK CONSTRAINT [FK_Customers_Ratings.CustomerID]
GO
ALTER TABLE [dbo].[Customers_Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Ratings.RatingID] FOREIGN KEY([RatingID])
REFERENCES [dbo].[Ratings] ([ID])
GO
ALTER TABLE [dbo].[Customers_Ratings] CHECK CONSTRAINT [FK_Customers_Ratings.RatingID]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees.ContactPersonID] FOREIGN KEY([ContactPersonID])
REFERENCES [dbo].[ContactPerson] ([ID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees.ContactPersonID]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees.TitleID] FOREIGN KEY([TitleID])
REFERENCES [dbo].[JobTitle] ([ID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees.TitleID]
GO
ALTER TABLE [dbo].[Employees_Communication]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Communication.CommunicationID] FOREIGN KEY([CommunicationID])
REFERENCES [dbo].[HotelCustomerCommunication] ([ID])
GO
ALTER TABLE [dbo].[Employees_Communication] CHECK CONSTRAINT [FK_Employees_Communication.CommunicationID]
GO
ALTER TABLE [dbo].[Employees_Communication]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Communication.EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([ID])
GO
ALTER TABLE [dbo].[Employees_Communication] CHECK CONSTRAINT [FK_Employees_Communication.EmployeeID]
GO
ALTER TABLE [dbo].[HotelCustomerCommunication]  WITH CHECK ADD  CONSTRAINT [FK_HotelCustomerCommunication.CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([ID])
GO
ALTER TABLE [dbo].[HotelCustomerCommunication] CHECK CONSTRAINT [FK_HotelCustomerCommunication.CustomerID]
GO
ALTER TABLE [dbo].[Minibar]  WITH CHECK ADD  CONSTRAINT [FK_Minibar.BookingID] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Bookings] ([ID])
GO
ALTER TABLE [dbo].[Minibar] CHECK CONSTRAINT [FK_Minibar.BookingID]
GO
ALTER TABLE [dbo].[Minibar]  WITH CHECK ADD  CONSTRAINT [FK_Minibar.ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Minibar] CHECK CONSTRAINT [FK_Minibar.ProductID]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products.OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products.OrderID]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms.RoomTypeID] FOREIGN KEY([RoomTypeID])
REFERENCES [dbo].[RoomTypes] ([ID])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms.RoomTypeID]
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertOrUpdate]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Denna procedure gör det möjligt att antigen lägga till en ny kund i databasen eller uppdatera en redan existerande kund beroende på vad 
-- för "StatementType" man väljer att göra, Antigen "Insert" för att lägga till en ny kund. Eller "Update" för att uppdatera en kund 

CREATE   PROCEDURE [dbo].[usp_InsertOrUpdate](@FirstName nvarchar(50),
											@LastName nvarchar(50),
											@Street nvarchar(100),
											@Zipcode varchar(10),
											@City nvarchar(50),
											@Country varchar(30),
											@Phone varchar(20),
											@Email nvarchar(100),
											@StatementType nvarchar(20),
											@Active nvarchar(10),
											@Social_Security_number varchar(20))
AS
BEGIN
	IF @StatementType = 'Insert'
		BEGIN
			INSERT INTO Customers
						(
						FirstName,
						LastName, 
						Street, 
						Zipcode,
						City,
						Country,
						Phone,
						Email,
						Active,
						Social_Security_number)
			VALUES	(
						@FirstName,
						@LastName,
						@Street,
						@Zipcode,
						@City,
						@Country,
						@Phone, 
						@Email,
						@Active,
						@Social_Security_number)
		END
		
		IF @StatementType = 'UPDATE'
		BEGIN
			Update Customers
			SET 
				FirstName= @FirstName,
				LastName = @LastName,
				Street = @Street,
				Zipcode = @Zipcode,
				City = @City,
				Country = @Country,
				Phone = @Phone, 
				Email = @Email,
				Active = @Active,
				Social_Security_number = @Social_Security_number
			WHERE FirstName = @FirstName
		END
END
GO
/****** Object:  StoredProcedure [dbo].[usp_NotUnderEighteen]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   procedure [dbo].[usp_NotUnderEighteen]

  @socialsecuritynumber nvarchar(12),
  @firstname nvarchar(50),
  @lastname nvarchar(50),
  @street nvarchar(100),
  @zipcode varchar(10),
  @city nvarchar(50),
  @country varchar(30),
  @phone varchar(20),
  @email nvarchar(100),
  @active nvarchar(10)

  as
  
  if ((cast(datediff(day,(cast(substring(@socialsecuritynumber, 1, 8) as date)), getdate()) as float) / 365.25) < 18)
  
    begin
      
      print('No people under 18 allowed!') 
      
      return
            
      
    end
    

  else 
  
    begin
   
        INSERT INTO Customers (Social_Security_number,FirstName, LastName, Street, Zipcode, City, Country, Phone, Email, Active)
        VALUES (@socialsecuritynumber, @firstname, @lastname, @street, @zipcode, @city, @country, @phone, @email, @active)
  
    
    end 
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateCancelBookings]    Script Date: 2022-02-08 07:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_UpdateCancelBookings] ( @status varchar(10))

AS
Declare @bookingID int
Declare @cancelID int
DECLARE @counter int 
SET @counter = 1;

	
	BEGIN
			SET @bookingID = ( SELECT TOP 1 id FROM Bookings Where status = 'cancel' )
			Update Bookings
			SET Status = 'CANCELLED' where id = @bookingID
			
			if @bookingID is not null
			begin
			INSERT INTO Cancels (time)
			values(GETDATE())
			
			SET @cancelID = 
			(select TOP 1 id from Cancels order by id desc )
			end
			
			If @cancelID is not null
			BEGIN 
			iNSERT INTO Bookings_Cancels(BookingID,CancelID)
			values(@bookingID,@cancelID)
			END

END
GO
USE [master]
GO
ALTER DATABASE [HotelDB] SET  READ_WRITE 
GO
