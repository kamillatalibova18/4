USE [master]
GO
/****** Object:  Database [tours]    Script Date: 22.02.2023 9:47:52 ******/
CREATE DATABASE [tours]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tours', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\tours.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tours_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\tours_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [tours] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tours].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tours] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tours] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tours] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tours] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tours] SET ARITHABORT OFF 
GO
ALTER DATABASE [tours] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tours] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tours] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tours] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tours] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tours] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tours] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tours] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tours] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tours] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tours] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tours] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tours] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tours] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tours] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tours] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tours] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tours] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [tours] SET  MULTI_USER 
GO
ALTER DATABASE [tours] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tours] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tours] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tours] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tours] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [tours] SET QUERY_STORE = OFF
GO
USE [tours]
GO
/****** Object:  Table [dbo].[count]    Script Date: 22.02.2023 9:47:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[count](
	[Code] [nchar](2) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_count] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hotel]    Script Date: 22.02.2023 9:47:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hotel](
	[id] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[CountOfStarts] [int] NULL,
	[CountryCode] [nchar](2) NULL,
 CONSTRAINT [PK_hotel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelComment]    Script Date: 22.02.2023 9:47:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelComment](
	[id] [int] NOT NULL,
	[HotelId] [int] NULL,
	[Text] [nvarchar](max) NULL,
	[Author] [nvarchar](100) NULL,
	[CreationDate] [datetime] NULL,
 CONSTRAINT [PK_HotelComment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelImage]    Script Date: 22.02.2023 9:47:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelImage](
	[id] [int] NOT NULL,
	[HotelId] [int] NULL,
	[ImageSource] [nvarchar](max) NULL,
 CONSTRAINT [PK_HotelImage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelOfTour]    Script Date: 22.02.2023 9:47:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelOfTour](
	[HotelId] [int] NOT NULL,
	[TourId] [int] NOT NULL,
 CONSTRAINT [PK_HotelOfTour] PRIMARY KEY CLUSTERED 
(
	[HotelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tour]    Script Date: 22.02.2023 9:47:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tour](
	[id] [int] NOT NULL,
	[TicketCount] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[Descripition] [nvarchar](max) NULL,
	[ImagePrewiev] [nvarchar](max) NULL,
	[Price] [money] NULL,
	[IsActual] [bit] NULL,
 CONSTRAINT [PK_tour] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tupe]    Script Date: 22.02.2023 9:47:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tupe](
	[id] [int] NOT NULL,
	[name] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_tupe] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TupeOfTour]    Script Date: 22.02.2023 9:47:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TupeOfTour](
	[TourId] [int] NOT NULL,
	[TypeId] [int] NULL,
 CONSTRAINT [PK_TupeOfTour] PRIMARY KEY CLUSTERED 
(
	[TourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tupe] ([id], [name], [Description]) VALUES (1, N'Тип 1', NULL)
INSERT [dbo].[tupe] ([id], [name], [Description]) VALUES (2, N'Тип 2', NULL)
INSERT [dbo].[tupe] ([id], [name], [Description]) VALUES (3, N'Тип 3', NULL)
INSERT [dbo].[tupe] ([id], [name], [Description]) VALUES (4, N'Тип 4', NULL)
INSERT [dbo].[tupe] ([id], [name], [Description]) VALUES (5, N'Тип 5', NULL)
GO
ALTER TABLE [dbo].[hotel]  WITH CHECK ADD  CONSTRAINT [FK_hotel_count] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[count] ([Code])
GO
ALTER TABLE [dbo].[hotel] CHECK CONSTRAINT [FK_hotel_count]
GO
ALTER TABLE [dbo].[HotelComment]  WITH CHECK ADD  CONSTRAINT [FK_HotelComment_hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[hotel] ([id])
GO
ALTER TABLE [dbo].[HotelComment] CHECK CONSTRAINT [FK_HotelComment_hotel]
GO
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_HotelImage_hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[hotel] ([id])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_HotelImage_hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[hotel] ([id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[tour] ([id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_tour]
GO
ALTER TABLE [dbo].[TupeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TupeOfTour_tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[tour] ([id])
GO
ALTER TABLE [dbo].[TupeOfTour] CHECK CONSTRAINT [FK_TupeOfTour_tour]
GO
ALTER TABLE [dbo].[TupeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TupeOfTour_tupe] FOREIGN KEY([TypeId])
REFERENCES [dbo].[tupe] ([id])
GO
ALTER TABLE [dbo].[TupeOfTour] CHECK CONSTRAINT [FK_TupeOfTour_tupe]
GO
USE [master]
GO
ALTER DATABASE [tours] SET  READ_WRITE 
GO
