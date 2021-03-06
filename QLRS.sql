USE [master]
GO
/****** Object:  Database [RauSach]    Script Date: 11/9/2018 8:23:15 PM ******/
CREATE DATABASE [RauSach]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RauSach', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RauSach.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RauSach_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RauSach_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RauSach] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RauSach].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RauSach] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RauSach] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RauSach] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RauSach] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RauSach] SET ARITHABORT OFF 
GO
ALTER DATABASE [RauSach] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [RauSach] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RauSach] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RauSach] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RauSach] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RauSach] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RauSach] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RauSach] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RauSach] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RauSach] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RauSach] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RauSach] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RauSach] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RauSach] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RauSach] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RauSach] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RauSach] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RauSach] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RauSach] SET  MULTI_USER 
GO
ALTER DATABASE [RauSach] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RauSach] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RauSach] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RauSach] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RauSach] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RauSach] SET QUERY_STORE = OFF
GO
USE [RauSach]
GO
/****** Object:  User [vanviet1998]    Script Date: 11/9/2018 8:23:15 PM ******/
CREATE USER [vanviet1998] FOR LOGIN [vanviet1998] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [vanviet1998]
GO
/****** Object:  UserDefinedFunction [dbo].[TuDongThemChiTietHD]    Script Date: 11/9/2018 8:23:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[TuDongThemChiTietHD]()
returns nvarchar(10)
as
begin
declare @ID nvarchar(10)
IF ((SELECT COUNT(MaChiTietHD) FROM ChiTietHD) = 0)
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaChiTietHD, 3)) FROM ChiTietHD
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'CTHD00' + CONVERT(NVARCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 and @ID <99 THEN 'CTHD0' + CONVERT(NVARCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'CTHD' + CONVERT(NVARCHAR, CONVERT(INT, @ID) + 1)
		END
	return @ID
end
GO
/****** Object:  UserDefinedFunction [dbo].[TudongthemID]    Script Date: 11/9/2018 8:23:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[TudongthemID]()
returns nvarchar(10)
as
begin
declare @ID nvarchar(10)
	IF ((SELECT COUNT(MaDangNhap) FROM Users) = 0)
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaDangNhap, 3)) FROM Users
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'TK00' + CONVERT(NVARCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'TK0' + CONVERT(NVARCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'TK' + CONVERT(NVARCHAR, CONVERT(INT, @ID) + 1)
		END
	return @ID
end
GO
/****** Object:  UserDefinedFunction [dbo].[TuDongThemMaHD]    Script Date: 11/9/2018 8:23:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[TuDongThemMaHD]()
returns nvarchar(10)
as
begin
declare @ID nvarchar(10)
IF ((SELECT COUNT(MaHD) FROM HoaDon) = 0)
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaHD, 3)) FROM HoaDon
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'HD00' + CONVERT(NVARCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 and @ID <99 THEN 'HD0' + CONVERT(NVARCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'HD' + CONVERT(NVARCHAR, CONVERT(INT, @ID) + 1)
		END
	return @ID
end
GO
/****** Object:  UserDefinedFunction [dbo].[TuDongThemMaLichSu]    Script Date: 11/9/2018 8:23:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[TuDongThemMaLichSu]()
returns varchar(10)
as
begin
declare @ID varchar(10)
IF ((SELECT COUNT(MaLichSu) FROM LichSuGia) = 0)
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaLichSu, 3)) FROM LichSuGia
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'LS00' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 and @ID <99 THEN 'LS0' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'LS' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
		END
	return @ID
end
GO
/****** Object:  UserDefinedFunction [dbo].[TuDongThemMALOAI]    Script Date: 11/9/2018 8:23:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[TuDongThemMALOAI]()
returns nvarchar(10)
as
begin
declare @ID nvarchar(10)
IF ((SELECT COUNT(MaLoai) FROM LoaiSP) = 0)
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaLoai, 3)) FROM LoaiSP
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'LOAI00' + CONVERT(NVARCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 and @ID <99 THEN 'LOAI0' + CONVERT(NVARCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'LOAI' + CONVERT(NVARCHAR, CONVERT(INT, @ID) + 1)
		END
	return @ID
end
GO
/****** Object:  UserDefinedFunction [dbo].[TuDongThemMaSP]    Script Date: 11/9/2018 8:23:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[TuDongThemMaSP]()
returns nvarchar(10)
as
begin
declare @ID nvarchar(10)
IF ((SELECT COUNT(MaSP) FROM SanPham) = 0)
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaSP, 3)) FROM SanPham
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'SP00' + CONVERT(NVARCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 and @ID <99 THEN 'SP0' + CONVERT(NVARCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'SP' + CONVERT(NVARCHAR, CONVERT(INT, @ID) + 1)
		END
	return @ID
end
GO
/****** Object:  UserDefinedFunction [dbo].[TuDongThemquangcao]    Script Date: 11/9/2018 8:23:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[TuDongThemquangcao]()
returns nvarchar(20)
as
begin
declare @ID nvarchar(20)
IF ((SELECT COUNT(MaQC) FROM QuangCao) = 0)
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaQC, 3)) FROM QuangCao
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'QC00' + CONVERT(NVARCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 and @ID <99 THEN 'QC0' + CONVERT(NVARCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'QC' + CONVERT(NVARCHAR, CONVERT(INT, @ID) + 1)
		END
	return @ID
end
GO
/****** Object:  Table [dbo].[ChiTietHD]    Script Date: 11/9/2018 8:23:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHD](
	[MaChiTietHD] [nvarchar](10) NOT NULL,
	[MaHD] [nvarchar](10) NULL,
	[MaSP] [nvarchar](10) NULL,
	[SoLuong] [int] NULL,
	[DonGia] [float] NULL,
	[NgayNhan] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTietHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 11/9/2018 8:23:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [nvarchar](10) NOT NULL,
	[MaKH] [nvarchar](10) NULL,
	[NgayMua] [datetime] NULL,
	[TongTien] [float] NULL,
	[TenKH] [nvarchar](20) NULL,
	[DiaChi] [nvarchar](20) NULL,
	[SDT] [char](11) NULL,
	[NgayNhan] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichSuGia]    Script Date: 11/9/2018 8:23:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichSuGia](
	[MaLichSu] [varchar](50) NOT NULL,
	[MaSP] [nvarchar](10) NULL,
	[GiaSP] [nvarchar](10) NULL,
	[NgayBatDau] [date] NULL,
	[NgayKetThuc] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLichSu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 11/9/2018 8:23:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLoai] [nvarchar](10) NOT NULL,
	[TenLoai] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/9/2018 8:23:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[MaR] [nvarchar](50) NOT NULL,
	[TenR] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 11/9/2018 8:23:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [nvarchar](10) NOT NULL,
	[TenSP] [nvarchar](20) NULL,
	[MaLoai] [nvarchar](10) NULL,
	[NoiSanXuat] [nvarchar](20) NULL,
	[GiaSP] [nvarchar](10) NULL,
	[AnhSP] [nvarchar](500) NULL,
	[ChiTietSP] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/9/2018 8:23:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[MaDangNhap] [nvarchar](10) NOT NULL,
	[TenDangNhap] [nvarchar](100) NULL,
	[MatKhau] [varchar](100) NULL,
	[LoaiTaiKhoan] [nvarchar](50) NULL,
	[TenKH] [nvarchar](20) NULL,
	[DiaChi] [nvarchar](20) NULL,
	[SDT] [char](11) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ChiTietHD] ([MaChiTietHD], [MaHD], [MaSP], [SoLuong], [DonGia], [NgayNhan]) VALUES (N'CTHD001', N'HD002', N'Rau001', 2, 2000, CAST(N'2018-11-08T00:00:00.000' AS DateTime))
INSERT [dbo].[ChiTietHD] ([MaChiTietHD], [MaHD], [MaSP], [SoLuong], [DonGia], [NgayNhan]) VALUES (N'CTHD002', N'HD002', N'Rau002', 2, 2000, CAST(N'2018-11-08T00:00:00.000' AS DateTime))
INSERT [dbo].[ChiTietHD] ([MaChiTietHD], [MaHD], [MaSP], [SoLuong], [DonGia], [NgayNhan]) VALUES (N'CTHD004', N'HD004', N'Qua002', 3, 5000, CAST(N'2018-11-08T00:00:00.000' AS DateTime))
INSERT [dbo].[ChiTietHD] ([MaChiTietHD], [MaHD], [MaSP], [SoLuong], [DonGia], [NgayNhan]) VALUES (N'CTHD006', N'HD006', N'Qua002', 2, 5000, CAST(N'2018-11-08T00:00:00.000' AS DateTime))
INSERT [dbo].[ChiTietHD] ([MaChiTietHD], [MaHD], [MaSP], [SoLuong], [DonGia], [NgayNhan]) VALUES (N'CTHD008', N'HD006', N'Cu003', 3, 2000, CAST(N'2018-11-08T00:00:00.000' AS DateTime))
INSERT [dbo].[ChiTietHD] ([MaChiTietHD], [MaHD], [MaSP], [SoLuong], [DonGia], [NgayNhan]) VALUES (N'CTHD009', N'HD009', N'Cu003', 4, 2000, CAST(N'2018-11-08T00:00:00.000' AS DateTime))
INSERT [dbo].[ChiTietHD] ([MaChiTietHD], [MaHD], [MaSP], [SoLuong], [DonGia], [NgayNhan]) VALUES (N'CTHD010', N'HD010', N'Qua001', 1, 5000, CAST(N'2018-11-08T00:00:00.000' AS DateTime))
INSERT [dbo].[ChiTietHD] ([MaChiTietHD], [MaHD], [MaSP], [SoLuong], [DonGia], [NgayNhan]) VALUES (N'CTHD011', N'HD010', N'Cu003', 1, 2000, CAST(N'2018-11-08T00:00:00.000' AS DateTime))
INSERT [dbo].[ChiTietHD] ([MaChiTietHD], [MaHD], [MaSP], [SoLuong], [DonGia], [NgayNhan]) VALUES (N'CTHD012', N'HD014', N'Qua001', 1, 5000, NULL)
INSERT [dbo].[ChiTietHD] ([MaChiTietHD], [MaHD], [MaSP], [SoLuong], [DonGia], [NgayNhan]) VALUES (N'CTHD013', N'HD014', N'Cu003', 2, 2000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [TongTien], [TenKH], [DiaChi], [SDT], [NgayNhan]) VALUES (N'HD002', N'TK001', CAST(N'2018-11-04T00:00:00.000' AS DateTime), 8000, N'Tran Van Viet', N'TPHCM', N'0964396401 ', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [TongTien], [TenKH], [DiaChi], [SDT], [NgayNhan]) VALUES (N'HD004', N'TK001', CAST(N'2018-11-04T00:00:00.000' AS DateTime), 15000, N'hiep', N'TPHCM', N'0964396401 ', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [TongTien], [TenKH], [DiaChi], [SDT], [NgayNhan]) VALUES (N'HD006', N'TK001', CAST(N'2018-11-04T00:00:00.000' AS DateTime), 16000, N'danh', N'TPHCM', N'0964396401 ', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [TongTien], [TenKH], [DiaChi], [SDT], [NgayNhan]) VALUES (N'HD009', N'TK001', CAST(N'2018-11-04T00:00:00.000' AS DateTime), 8000, N'vietdanh', N'TPHCM', N'123        ', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [TongTien], [TenKH], [DiaChi], [SDT], [NgayNhan]) VALUES (N'HD010', N'TK001', CAST(N'2018-11-04T00:00:00.000' AS DateTime), 7000, N'dung', N'Ha Noi', N'01647164966', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [TongTien], [TenKH], [DiaChi], [SDT], [NgayNhan]) VALUES (N'HD011', NULL, CAST(N'2018-12-04T00:00:00.000' AS DateTime), 5000, N'Viet', N'TPHCM', NULL, CAST(N'2018-12-08' AS Date))
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [TongTien], [TenKH], [DiaChi], [SDT], [NgayNhan]) VALUES (N'HD012', N'TK001', CAST(N'2018-11-07T00:00:00.000' AS DateTime), 0, N'null', N'null', N'null       ', CAST(N'2018-11-11' AS Date))
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [TongTien], [TenKH], [DiaChi], [SDT], [NgayNhan]) VALUES (N'HD013', N'TK003', CAST(N'2018-11-07T00:00:00.000' AS DateTime), 0, N'poon', N'Phú Yên', N'0123456789 ', CAST(N'2018-11-11' AS Date))
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [TongTien], [TenKH], [DiaChi], [SDT], [NgayNhan]) VALUES (N'HD014', N'TK003', CAST(N'2018-11-07T00:00:00.000' AS DateTime), 9000, N'poon', N'Phú Yên', N'0123456789 ', CAST(N'2018-11-11' AS Date))
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [TongTien], [TenKH], [DiaChi], [SDT], [NgayNhan]) VALUES (N'HD015', NULL, CAST(N'2018-11-07T00:00:00.000' AS DateTime), 2000, N'123', N'123', N'123        ', CAST(N'2018-11-11' AS Date))
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [TongTien], [TenKH], [DiaChi], [SDT], [NgayNhan]) VALUES (N'HD016', N'TK001', CAST(N'2018-11-07T00:00:00.000' AS DateTime), 3000, N'van viet', N'TPHCM', N'0964396401 ', CAST(N'2018-11-11' AS Date))
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [TongTien], [TenKH], [DiaChi], [SDT], [NgayNhan]) VALUES (N'HD017', N'TK003', CAST(N'2018-11-07T00:00:00.000' AS DateTime), 3000, N'poon', N'Phú Yên', N'0123456789 ', CAST(N'2018-11-11' AS Date))
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [TongTien], [TenKH], [DiaChi], [SDT], [NgayNhan]) VALUES (N'HD018', N'TK003', CAST(N'2018-11-07T00:00:00.000' AS DateTime), 3000, N'viet', N'Phú Yên', N'0123456789 ', CAST(N'2018-11-11' AS Date))
INSERT [dbo].[LichSuGia] ([MaLichSu], [MaSP], [GiaSP], [NgayBatDau], [NgayKetThuc]) VALUES (N'LS015', N'Cu001', N'5000', CAST(N'2018-11-06' AS Date), NULL)
INSERT [dbo].[LichSuGia] ([MaLichSu], [MaSP], [GiaSP], [NgayBatDau], [NgayKetThuc]) VALUES (N'LS016', N'Rau009', N'5000', CAST(N'2018-11-06' AS Date), CAST(N'2018-11-06' AS Date))
INSERT [dbo].[LichSuGia] ([MaLichSu], [MaSP], [GiaSP], [NgayBatDau], [NgayKetThuc]) VALUES (N'LS017', N'Rau009', N'555555', CAST(N'2018-11-06' AS Date), CAST(N'2018-11-06' AS Date))
INSERT [dbo].[LichSuGia] ([MaLichSu], [MaSP], [GiaSP], [NgayBatDau], [NgayKetThuc]) VALUES (N'LS018', N'Rau009', N'6656556', CAST(N'2018-11-06' AS Date), CAST(N'2018-11-07' AS Date))
INSERT [dbo].[LichSuGia] ([MaLichSu], [MaSP], [GiaSP], [NgayBatDau], [NgayKetThuc]) VALUES (N'LS019', N'SP017', N'5000', CAST(N'2018-11-07' AS Date), NULL)
INSERT [dbo].[LichSuGia] ([MaLichSu], [MaSP], [GiaSP], [NgayBatDau], [NgayKetThuc]) VALUES (N'LS020', N'SP017', N'3000', CAST(N'2018-11-07' AS Date), NULL)
INSERT [dbo].[LichSuGia] ([MaLichSu], [MaSP], [GiaSP], [NgayBatDau], [NgayKetThuc]) VALUES (N'LS021', N'SP017', N'2000', CAST(N'2018-11-07' AS Date), NULL)
INSERT [dbo].[LichSuGia] ([MaLichSu], [MaSP], [GiaSP], [NgayBatDau], [NgayKetThuc]) VALUES (N'LS022', N'SP017', N'6000', CAST(N'2018-11-07' AS Date), CAST(N'2018-11-07' AS Date))
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (N'LOAI001', N'Rau')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (N'LOAI002', N'Củ')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (N'LOAI003', N'Quả')
INSERT [dbo].[Roles] ([MaR], [TenR]) VALUES (N'MAR001', N'ADMIN')
INSERT [dbo].[Roles] ([MaR], [TenR]) VALUES (N'MAR002', N'KHACHHANG')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [NoiSanXuat], [GiaSP], [AnhSP], [ChiTietSP]) VALUES (N'Cu001', N'Củ Riềng', N'LOAI002', N'Bình Phước', N'5000', N'images/curieng.jpg', N'Củ riềng cùng họ gừng, nhưng tên của nó còn độc đáo hơn, đông y gọi là Cao Lương Khương, được xếp vào bậc cao hơn. Chữ Lương nghĩa là tốt hơn, Khương là họ gừng, mang tên Cao Lương có nghĩa là hay hơn về độ ấm. Củ riềng theo quan niệm của Đông Y nằm ở dưới đất, có vị cay. Người ta gọi củ riềng là địa hỏa. Địa là đất, hỏa là vị cay.')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [NoiSanXuat], [GiaSP], [AnhSP], [ChiTietSP]) VALUES (N'Cu002', N'Củ Tỏi', N'LOAI002', N'Bình Dương', N'3000', N'images/cutoi.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [NoiSanXuat], [GiaSP], [AnhSP], [ChiTietSP]) VALUES (N'Cu003', N'Củ Hành Tím', N'LOAI002', N'Bình Tân', N'2000', N'images/hanhtim.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [NoiSanXuat], [GiaSP], [AnhSP], [ChiTietSP]) VALUES (N'Qua001', N'Quả Bí Đao', N'LOAI003', N'Bình Phước', N'5000', N'images/quabidao.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [NoiSanXuat], [GiaSP], [AnhSP], [ChiTietSP]) VALUES (N'Qua002', N'Quả Bí Đỏ', N'LOAI003', N'Bình Phước', N'5000', N'images/quabido.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [NoiSanXuat], [GiaSP], [AnhSP], [ChiTietSP]) VALUES (N'Rau001', N'Rau Dền', N'LOAI001', N'Bình Phước', N'2000', N'images/rauren.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [NoiSanXuat], [GiaSP], [AnhSP], [ChiTietSP]) VALUES (N'Rau002', N'Rau Cải Đắng', N'LOAI001', N'Bình Dương', N'2000', N'images/raucaidang.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [NoiSanXuat], [GiaSP], [AnhSP], [ChiTietSP]) VALUES (N'Rau003', N'Rau Cải Ngọt', N'LOAI001', N'Bình Tân', N'2000', N'images/raucaingot.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [NoiSanXuat], [GiaSP], [AnhSP], [ChiTietSP]) VALUES (N'Rau004', N'Rau Muống', N'LOAI001', N'Bình Phước', N'2000', N'images/raumuong.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [NoiSanXuat], [GiaSP], [AnhSP], [ChiTietSP]) VALUES (N'Rau005', N'Rau Má', N'LOAI001', N'Bình Tân', N'5000', N'images/rauren.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [NoiSanXuat], [GiaSP], [AnhSP], [ChiTietSP]) VALUES (N'Rau006', N'Dưa chuột', N'LOAI001', N'Bình Dương', N'2000', N'images/raucaidang.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [NoiSanXuat], [GiaSP], [AnhSP], [ChiTietSP]) VALUES (N'Rau007', N'Rau Cải Đắng', N'LOAI001', N'Bình Dương', N'1000', N'images/raucaidang.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [NoiSanXuat], [GiaSP], [AnhSP], [ChiTietSP]) VALUES (N'Rau008', N'Rau Cải Đắng', N'LOAI001', N'Bình Dương', N'2000', N'images/raucaidang.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [NoiSanXuat], [GiaSP], [AnhSP], [ChiTietSP]) VALUES (N'Rau009', N'Rau Cải Đắng', N'LOAI001', N'Bình Dương', N'6656556', N'images/raucaidang.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [NoiSanXuat], [GiaSP], [AnhSP], [ChiTietSP]) VALUES (N'Rau010', N'Rau Cải Đắng', N'LOAI001', N'Bình Dương', N'2000', N'images/raucaidang.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [NoiSanXuat], [GiaSP], [AnhSP], [ChiTietSP]) VALUES (N'Rau011', N'Rau Cải Đắng', N'LOAI001', N'Bình Dương', N'2000', N'images/raucaidang.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [NoiSanXuat], [GiaSP], [AnhSP], [ChiTietSP]) VALUES (N'Rau012', N'Rau Cải Đắng', N'LOAI001', N'Bình Dương', N'2000', N'images/raucaidang.jpg', N'null')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [NoiSanXuat], [GiaSP], [AnhSP], [ChiTietSP]) VALUES (N'Rau013', N'Rau Cải Đắng', N'LOAI001', N'Bình Dương', N'50000', N'images\hanhtim.jpg', N'null')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [NoiSanXuat], [GiaSP], [AnhSP], [ChiTietSP]) VALUES (N'SP017', N'viet', N'LOAI003', N'viet', N'6000', N'images/raucaidang.jpg', N'viete')
INSERT [dbo].[Users] ([MaDangNhap], [TenDangNhap], [MatKhau], [LoaiTaiKhoan], [TenKH], [DiaChi], [SDT]) VALUES (N'TK001', N'16110265@Student.hcmute.edu.vn', N'123', N'MAR002', N'Việt', N'Hà Nội', N'0964396401 ')
INSERT [dbo].[Users] ([MaDangNhap], [TenDangNhap], [MatKhau], [LoaiTaiKhoan], [TenKH], [DiaChi], [SDT]) VALUES (N'TK002', N'ADMIN', N'ADMIN', N'MAR001', N'admin', NULL, NULL)
INSERT [dbo].[Users] ([MaDangNhap], [TenDangNhap], [MatKhau], [LoaiTaiKhoan], [TenKH], [DiaChi], [SDT]) VALUES (N'TK003', N'16110186@student.hcmute.edu.vn', N'1123', N'MAR002', N'poon', N'Phú Yên', N'0123456789 ')
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [fk_HD_DN] FOREIGN KEY([MaKH])
REFERENCES [dbo].[Users] ([MaDangNhap])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [fk_HD_DN]
GO
ALTER TABLE [dbo].[LichSuGia]  WITH CHECK ADD  CONSTRAINT [fk_ls_sp] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[LichSuGia] CHECK CONSTRAINT [fk_ls_sp]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiSP] ([MaLoai])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_ROLES] FOREIGN KEY([LoaiTaiKhoan])
REFERENCES [dbo].[Roles] ([MaR])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_ROLES]
GO
/****** Object:  StoredProcedure [dbo].[LayMatKhau]    Script Date: 11/9/2018 8:23:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[LayMatKhau]
@TK nvarchar(10)
as
begin
declare @kq nvarchar(100)
select @kq =MatKhau
from Users
where TenDangNhap = @tk
return @kq
end
GO
/****** Object:  StoredProcedure [dbo].[sp_dangkyctHD]    Script Date: 11/9/2018 8:23:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_dangkyctHD]

@mahd nvarchar(10),
@masp nvarchar(10),
@soluong int,
@dongia float,
@ngaynhan date

as
begin
declare @macthd nvarchar(10)
select @macthd = dbo.TuDongThemChiTietHD() 
	insert into ChiTietHD
	(MaChiTietHD,MaHD,MaSP,SoLuong,DonGia,NgayNhan)
	values (@macthd,@mahd,@masp,@soluong,@dongia,@ngaynhan)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_dangkyctQC]    Script Date: 11/9/2018 8:23:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_dangkyctQC]


@tenqc nvarchar(200),
@hinh nvarchar(200),
@link nvarchar(500)


as
begin
declare @maqc nvarchar(20)
select @maqc = dbo.TuDongThemquangcao() 
	insert into QuangCao
	(MaQC,TenQC,Hinh,Link)
	values (@maqc,@tenqc,@hinh,@link)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_dangkyHD]    Script Date: 11/9/2018 8:23:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_dangkyHD]

@makh nvarchar(10),
@ngaymua date,
@tongtien float,
@tenkh nvarchar(20),
@diachi nvarchar(20),
@sdt char(11),
@mahd nvarchar(10) output
as
begin
select @mahd = dbo.TuDongThemMaHD() 
	insert into HoaDon
	(MaHD,MaKH,NgayMua,TongTien,TenKH,DiaChi,SDT)
	values (@mahd,@makh,@ngaymua,@tongtien,@tenkh,@diachi,@sdt)
	select @mahd
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DangkyLoaiSP]    Script Date: 11/9/2018 8:23:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DangkyLoaiSP]
@tenloai nvarchar(20)
as
begin
declare @maloai nvarchar(10)
select @maloai=dbo.TuDongThemMALOAI()
insert into LoaiSP
(MaLoai,TenLoai)
values (@maloai,@tenloai)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_dangkysp]    Script Date: 11/9/2018 8:23:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_dangkysp]
@tensp nvarchar(20),
@maloai nvarchar(10),
@noisanxuat nvarchar(20),
@giasp nvarchar(10),
@anhsp nvarchar(50),
@chitietsp nvarchar(500)
as
begin
declare @masp nvarchar(10)
select @masp = dbo.TuDongThemMaSP()
	insert into SanPham
	(MaSP,TenSP,MaLoai,NoiSanXuat,GiaSP,AnhSP,ChiTietSP)

	values 	(@masp,@tensp,@maloai,@noisanxuat,@giasp,@anhsp,@chitietsp)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DangKyTaiKhoan]    Script Date: 11/9/2018 8:23:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DangKyTaiKhoan]
@tentk nvarchar(100),
@mk nvarchar(10),
@kh nvarchar(20),
@diachi nvarchar(20),
@sdt char(11)
as
begin
declare @id nvarchar(10)
select @id = dbo.TudongthemID() 
	insert into Users
	(MaDangNhap,TenDangNhap,MatKhau,LoaiTaiKhoan,TenKH,DiaChi,SDT)
	values (@id,@tentk,@mk,'MAR002',@kh,@diachi,@sdt)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Deletecthd]    Script Date: 11/9/2018 8:23:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Deletecthd]
@mahd nvarchar(10)
as
begin

delete ChiTietHD
where MaChiTietHD= @mahd
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteHD]    Script Date: 11/9/2018 8:23:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DeleteHD]
@mahd nvarchar(10)
as
begin
delete HoaDon
where MaHD= @mahd
delete ChiTietHD
where MaHD= @mahd
end
GO
/****** Object:  StoredProcedure [dbo].[sp_listcthd]    Script Date: 11/9/2018 8:23:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_listcthd]
@mahd nvarchar(10)
as
begin

select sp.TenSP,sp.NoiSanXuat,cthd.SoLuong,cthd.DonGia,cthd.NgayNhan
from ChiTietHD cthd join SanPham sp on(cthd.MaSP=sp.MaSP)
where MaHD=@mahd
end
GO
USE [master]
GO
ALTER DATABASE [RauSach] SET  READ_WRITE 
GO
