USE [master]
GO
/****** Object:  Database [QLMyPham]    Script Date: 10/01/2025 8:43:07 AM ******/
CREATE DATABASE [QLMyPham]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLMyPham', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLMyPham.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLMyPham_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLMyPham_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLMyPham] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLMyPham].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLMyPham] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLMyPham] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLMyPham] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLMyPham] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLMyPham] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLMyPham] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLMyPham] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLMyPham] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLMyPham] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLMyPham] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLMyPham] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLMyPham] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLMyPham] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLMyPham] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLMyPham] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLMyPham] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLMyPham] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLMyPham] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLMyPham] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLMyPham] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLMyPham] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLMyPham] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLMyPham] SET RECOVERY FULL 
GO
ALTER DATABASE [QLMyPham] SET  MULTI_USER 
GO
ALTER DATABASE [QLMyPham] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLMyPham] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLMyPham] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLMyPham] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLMyPham] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLMyPham] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLMyPham', N'ON'
GO
ALTER DATABASE [QLMyPham] SET QUERY_STORE = OFF
GO
USE [QLMyPham]
GO
/****** Object:  Table [dbo].[mypham]    Script Date: 10/01/2025 8:43:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mypham](
	[mamp] [nvarchar](50) NOT NULL,
	[tenmp] [nvarchar](50) NULL,
	[soluong] [bigint] NULL,
	[gia] [bigint] NULL,
	[maloai] [nvarchar](50) NULL,
	[anh] [nvarchar](50) NULL,
	[NgayNhap] [datetime] NULL,
	[NhaSanXuat] [nvarchar](50) NULL,
 CONSTRAINT [PK_mypham] PRIMARY KEY CLUSTERED 
(
	[mamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 10/01/2025 8:43:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[makh] [bigint] IDENTITY(1,1) NOT NULL,
	[hoten] [nvarchar](50) NULL,
	[diachi] [nvarchar](50) NULL,
	[sodt] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[tendn] [nvarchar](50) NULL,
	[pass] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[makh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoadon]    Script Date: 10/01/2025 8:43:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadon](
	[MaHoaDon] [bigint] IDENTITY(1,1) NOT NULL,
	[makh] [bigint] NULL,
	[NgayMua] [datetime] NOT NULL,
	[damua] [bit] NULL,
 CONSTRAINT [PK_hoadon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 10/01/2025 8:43:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaChiTietHD] [bigint] IDENTITY(1,1) NOT NULL,
	[MaMP] [nvarchar](50) NOT NULL,
	[SoLuongMua] [int] NOT NULL,
	[MaHoaDon] [bigint] NOT NULL,
	[damua] [bit] NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaChiTietHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vlichsu]    Script Date: 10/01/2025 8:43:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vlichsu]
AS
SELECT dbo.KhachHang.hoten, dbo.mypham.tenmp, dbo.ChiTietHoaDon.SoLuongMua, dbo.mypham.gia, dbo.ChiTietHoaDon.SoLuongMua * dbo.mypham.gia AS ThanhTien, dbo.hoadon.NgayMua, dbo.hoadon.damua, dbo.KhachHang.makh
FROM     dbo.KhachHang INNER JOIN
                  dbo.hoadon ON dbo.KhachHang.makh = dbo.hoadon.makh INNER JOIN
                  dbo.ChiTietHoaDon ON dbo.hoadon.MaHoaDon = dbo.ChiTietHoaDon.MaHoaDon INNER JOIN
                  dbo.mypham ON dbo.ChiTietHoaDon.MaMP = dbo.mypham.mamp
GO
/****** Object:  View [dbo].[Vxacnhan]    Script Date: 10/01/2025 8:43:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vxacnhan]
AS
SELECT dbo.KhachHang.hoten, dbo.hoadon.NgayMua, SUM(dbo.ChiTietHoaDon.SoLuongMua) AS SoLuongMua, SUM(dbo.mypham.gia) AS gia, SUM(dbo.ChiTietHoaDon.SoLuongMua * dbo.mypham.gia) AS ThanhTien, 
                  dbo.ChiTietHoaDon.MaHoaDon
FROM     dbo.ChiTietHoaDon INNER JOIN
                  dbo.hoadon ON dbo.ChiTietHoaDon.MaHoaDon = dbo.hoadon.MaHoaDon INNER JOIN
                  dbo.KhachHang ON dbo.hoadon.makh = dbo.KhachHang.makh INNER JOIN
                  dbo.mypham ON dbo.ChiTietHoaDon.MaMP = dbo.mypham.mamp
WHERE  (dbo.ChiTietHoaDon.damua = 0)
GROUP BY dbo.hoadon.NgayMua, dbo.ChiTietHoaDon.MaHoaDon, dbo.KhachHang.hoten
GO
/****** Object:  Table [dbo].[loai]    Script Date: 10/01/2025 8:43:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loai](
	[maloai] [nvarchar](50) NOT NULL,
	[tenloai] [nvarchar](50) NULL,
 CONSTRAINT [PK_loai] PRIMARY KEY CLUSTERED 
(
	[maloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[abc]    Script Date: 10/01/2025 8:43:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[abc]
AS
SELECT dbo.mypham.tenmp, dbo.loai.tenloai, dbo.ChiTietHoaDon.SoLuongMua
FROM     dbo.ChiTietHoaDon INNER JOIN
                  dbo.mypham ON dbo.ChiTietHoaDon.MaMP = dbo.mypham.mamp INNER JOIN
                  dbo.loai ON dbo.mypham.maloai = dbo.loai.maloai
GO
/****** Object:  View [dbo].[HtMyPham]    Script Date: 10/01/2025 8:43:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[HtMyPham]
AS
SELECT dbo.mypham.maloai, dbo.loai.tenloai, dbo.mypham.mamp, dbo.mypham.tenmp, dbo.mypham.NhaSanXuat, dbo.mypham.gia
FROM     dbo.loai INNER JOIN
                  dbo.mypham ON dbo.loai.maloai = dbo.mypham.maloai
GO
/****** Object:  View [dbo].[Vhoadon]    Script Date: 10/01/2025 8:43:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vhoadon]
AS
SELECT dbo.ChiTietHoaDon.SoLuongMua, dbo.mypham.tenmp, dbo.mypham.gia, dbo.mypham.mamp
FROM     dbo.ChiTietHoaDon INNER JOIN
                  dbo.hoadon ON dbo.ChiTietHoaDon.MaHoaDon = dbo.hoadon.MaHoaDon INNER JOIN
                  dbo.mypham ON dbo.ChiTietHoaDon.MaMP = dbo.mypham.mamp
GO
/****** Object:  View [dbo].[VDoanhThu]    Script Date: 10/01/2025 8:43:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VDoanhThu]
AS
SELECT dbo.KhachHang.hoten, dbo.hoadon.NgayMua, SUM(dbo.ChiTietHoaDon.SoLuongMua) AS SoLuongMua, SUM(dbo.mypham.gia) AS gia, SUM(dbo.ChiTietHoaDon.SoLuongMua * dbo.mypham.gia) AS ThanhTien, 
                  dbo.ChiTietHoaDon.MaHoaDon
FROM     dbo.ChiTietHoaDon INNER JOIN
                  dbo.hoadon ON dbo.ChiTietHoaDon.MaHoaDon = dbo.hoadon.MaHoaDon INNER JOIN
                  dbo.KhachHang ON dbo.hoadon.makh = dbo.KhachHang.makh INNER JOIN
                  dbo.mypham ON dbo.ChiTietHoaDon.MaMP = dbo.mypham.mamp
WHERE  (dbo.ChiTietHoaDon.damua = 1)
GROUP BY dbo.KhachHang.hoten, dbo.hoadon.NgayMua, dbo.ChiTietHoaDon.MaHoaDon
GO
/****** Object:  Table [dbo].[DangNhap]    Script Date: 10/01/2025 8:43:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangNhap](
	[TenDangNhap] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Quyen] [bit] NULL,
 CONSTRAINT [PK_DangNhap] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] ON 

INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (1, N'e1', 1, 1, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (2, N'e1', 2, 1, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (3, N'e1', 5, 2, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (4, N'e1', 12, 2, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (5, N'e2', 20, 1, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (6, N'e1', 1, 7, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (7, N'f1', 1, 8, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (8, N'l2', 1, 8, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (9, N'e1', 1, 9, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (10, N'f2', 1, 10, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (11, N'e1', 1, 13, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (12, N'e1', 1, 14, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (13, N's2', 1, 14, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (14, N'e1', 1, 15, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (15, N'e1', 1, 16, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (16, N'f1', 1, 17, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (17, N's1', 1, 19, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (18, N'f1', 1, 20, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (19, N'f2', 1, 20, NULL)
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] OFF
GO
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'nancy', N'321', 0)
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'nhan', N'123', 1)
GO
SET IDENTITY_INSERT [dbo].[hoadon] ON 

INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (1, 2, CAST(N'1989-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (2, 1, CAST(N'2017-10-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (3, 6, CAST(N'2025-01-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (4, 6, CAST(N'2025-01-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (5, 6, CAST(N'2025-01-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (6, 6, CAST(N'2025-01-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (7, 6, CAST(N'2025-01-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (8, 6, CAST(N'2025-01-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (9, 6, CAST(N'2025-01-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (10, 6, CAST(N'2025-01-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (11, 6, CAST(N'2025-01-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (12, 6, CAST(N'2025-01-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (13, 5, CAST(N'2025-01-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (14, 5, CAST(N'2025-01-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (15, 5, CAST(N'2025-01-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (16, 6, CAST(N'2025-01-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (17, 6, CAST(N'2025-01-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (18, 6, CAST(N'2025-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (19, 6, CAST(N'2025-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (20, 7, CAST(N'2025-01-10T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[hoadon] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([makh], [hoten], [diachi], [sodt], [email], [tendn], [pass]) VALUES (1, N'Lê Thị Thanh Nhàn', N'Huế', N'0344242303', N'nhan@gmail.com', N'nhan', N'123')
INSERT [dbo].[KhachHang] ([makh], [hoten], [diachi], [sodt], [email], [tendn], [pass]) VALUES (2, N'Lê Thị Minh Anh', N'Huế', NULL, NULL, N'nancy', N'321')
INSERT [dbo].[KhachHang] ([makh], [hoten], [diachi], [sodt], [email], [tendn], [pass]) VALUES (3, N'Lê Th? Thanh Nhàn', N'Hu?', N'0344242423', N'nhann@gmail.com', N'nhan', N'123')
INSERT [dbo].[KhachHang] ([makh], [hoten], [diachi], [sodt], [email], [tendn], [pass]) VALUES (4, N'Lê Văn Mỹ', N'Huế', N'0344242303', N'my@gmail.com', N'my', N'123')
INSERT [dbo].[KhachHang] ([makh], [hoten], [diachi], [sodt], [email], [tendn], [pass]) VALUES (5, N'Lê Thị Hồng Nhi', N'Huế', N'0344242303', N'nhi@gmail.com', N'nhi', N'202cb962ac59075b964b07152d234b70')
INSERT [dbo].[KhachHang] ([makh], [hoten], [diachi], [sodt], [email], [tendn], [pass]) VALUES (6, N'Le Nhàn', N'Hue', N'0344242303', N'nan@gmail.com', N'nan', N'202cb962ac59075b964b07152d234b70')
INSERT [dbo].[KhachHang] ([makh], [hoten], [diachi], [sodt], [email], [tendn], [pass]) VALUES (7, N'Lê Văn A', N'Huế', N'11', N'huy@gmail.com', N'abc', N'202cb962ac59075b964b07152d234b70')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'eye', N'Eyes')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'face', N'Face')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'lip', N'Lips')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'skincare', N'Skincare')
GO
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N'e1', N'Bảng phấn mắt', 112, 120000, N'eye', N'img/bangphanmat.jpg', CAST(N'2025-01-09T18:07:36.000' AS DateTime), N'apon')
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N'e2', N'Chì kẻ mày', 225, 35000, N'eye', N'img/chikemay.jpg', CAST(N'2024-09-15T19:25:58.897' AS DateTime), N'M.O.I')
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N'e3', N'Dưỡng mắt', 50, 60000, N'eye', N'img/duongmat.jpg', CAST(N'2024-09-15T19:25:58.897' AS DateTime), N'skintific')
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N'e4', N'Kẻ eyeliner', 113, 67000, N'eye', N'img/keeyeliner.jpg', CAST(N'2024-09-15T19:25:58.897' AS DateTime), N'colorgram')
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N'e5', N'Kẹp mi', 25, 108000, N'eye', N'img/kepmi.jpg', CAST(N'2024-09-15T19:25:58.897' AS DateTime), N'dose')
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N'e6', N'Mascara', 36, 134000, N'eye', N'img/mascara.jpg', CAST(N'2024-09-15T19:25:58.897' AS DateTime), N'lemonade')
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N'f1', N'Che khuyết điểm', 12, 75000, N'face', N'img/chekhuyetdiem.jpg', CAST(N'2024-09-15T19:25:58.897' AS DateTime), N'lameila')
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N'f2', N'Kem lót', 23, 125000, N'face', N'img/kemlot.jpg', CAST(N'2024-09-15T19:25:58.897' AS DateTime), N'zeesea')
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N'f3', N'Kem nền', 26, 300000, N'face', N'img/kemnen.jpg', CAST(N'2024-09-15T19:25:58.897' AS DateTime), N'jojo')
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N'f4', N'Má hồng', 24, 126000, N'face', N'img/mahong.jpg', CAST(N'2024-09-15T19:25:58.897' AS DateTime), N'peipera')
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N'f5', N'Má kem mịn lì', 5, 46000, N'face', N'img/makemminli.jpg', CAST(N'2024-09-15T19:25:58.897' AS DateTime), N'lemonade')
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N'f6', N'Phấn bắt sáng', 36, 26000, N'face', N'img/phanbatsang.jpg', CAST(N'2024-09-15T19:25:58.897' AS DateTime), N'glad')
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N'f7', N'Phấn nước', 32, 180000, N'face', N'img/phannuoc.jpg', CAST(N'2024-09-15T19:25:58.897' AS DateTime), N'gege')
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N'f8', N'Phấn phủ', 14, 165000, N'face', N'img/phanphu.jpg', CAST(N'2024-09-15T19:25:58.897' AS DateTime), N'sheglam')
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N'f9', N'Phấn tạo khối', 20, 27000, N'face', N'img/phantaokhoi.jpg', CAST(N'2024-09-15T19:25:58.897' AS DateTime), N'judydoll')
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N'l1', N'Son', 100, 170000, N'lip', N'img/son.jpg', CAST(N'2024-09-15T19:25:58.897' AS DateTime), N'peipera')
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N'l2', N'Son Dior', 50, 600000, N'lip', N'img//sondior.jpg', CAST(N'2024-09-15T19:25:58.897' AS DateTime), N'dior')
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N'l3', N'Son dưỡng', 120, 175000, N'lip', N'img/sonduong.jpg', CAST(N'2024-09-15T19:25:58.897' AS DateTime), N'dhc')
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N'l4', N'Son kem mịn lì', 240, 125000, N'lip', N'img/sonkemminli.jpg', CAST(N'2024-09-15T19:25:58.897' AS DateTime), N'doly')
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N'l5', N'Son lì dạng thỏi', 210, 300000, N'lip', N'img/sonlidangthoi.jpg', CAST(N'2024-09-15T19:25:58.897' AS DateTime), N'ink')
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N'l6', N'Son tint bóng', 300, 127000, N'lip', N'img/sontintbong.jpg', CAST(N'2024-09-15T19:25:58.897' AS DateTime), N'peipera')
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N'l7', N'Son hồng', 56, 120000, N'lip', N'img/sonhong.jpg', CAST(N'2025-01-09T16:15:09.000' AS DateTime), N'romand')
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N'l8', N'Son Into you', 56, 120000, N'lip', N'img/soninto.jpg', CAST(N'2025-01-09T16:22:25.000' AS DateTime), N'into you')
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N's1', N'BHA', 12, 125000, N'skincare', N'img/bha.jpg', CAST(N'2024-09-15T19:25:58.897' AS DateTime), N'ordianry')
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N's2', N'Mặt Nạ', 50, 12000, N'skincare', N'img/matna.jpg', CAST(N'2024-09-15T19:25:58.897' AS DateTime), N'lakerain')
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N's3', N'Serum', 21, 200000, N'skincare', N'img/serum.jpg', CAST(N'2024-09-15T19:25:58.897' AS DateTime), N'anua')
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N's4', N'Sửa rửa mặt', 60, 75000, N'skincare', N'img/srm.jpg', CAST(N'2024-09-15T19:25:58.897' AS DateTime), N'vari')
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N's5', N'Tẩy tế bào', 14, 112000, N'skincare', N'img/taytebao.jpg', CAST(N'2024-09-15T19:25:58.897' AS DateTime), N'o hui')
INSERT [dbo].[mypham] ([mamp], [tenmp], [soluong], [gia], [maloai], [anh], [NgayNhap], [NhaSanXuat]) VALUES (N's6', N'Tẩy trang', 75, 136000, N'skincare', N'img/taytrang.jpg', CAST(N'2024-09-15T19:25:58.897' AS DateTime), N'pond')
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "mypham"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "loai"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 126
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'abc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'abc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "loai"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 126
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "mypham"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HtMyPham'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HtMyPham'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 7
               Left = 306
               Bottom = 170
               Right = 516
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KhachHang"
            Begin Extent = 
               Top = 7
               Left = 564
               Bottom = 170
               Right = 774
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "mypham"
            Begin Extent = 
               Top = 7
               Left = 822
               Bottom = 170
               Right = 1032
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 258
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VDoanhThu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VDoanhThu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VDoanhThu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "mypham"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 170
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vhoadon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vhoadon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "KhachHang"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 170
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "mypham"
            Begin Extent = 
               Top = 7
               Left = 774
               Bottom = 170
               Right = 968
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vlichsu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vlichsu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vlichsu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 258
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 7
               Left = 306
               Bottom = 170
               Right = 516
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KhachHang"
            Begin Extent = 
               Top = 7
               Left = 564
               Bottom = 170
               Right = 774
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "mypham"
            Begin Extent = 
               Top = 7
               Left = 822
               Bottom = 170
               Right = 1032
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vxacnhan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vxacnhan'
GO
USE [master]
GO
ALTER DATABASE [QLMyPham] SET  READ_WRITE 
GO
