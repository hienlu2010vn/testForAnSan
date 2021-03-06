USE [master]
GO
/****** Object:  Database [Assignment1-TranPhuocHien]    Script Date: 03/16/2021 09:26:09 ******/
CREATE DATABASE [Assignment1-TranPhuocHien] ON  PRIMARY 
( NAME = N'Assignment1-TranPhuocHien', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Assignment1-TranPhuocHien.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Assignment1-TranPhuocHien_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Assignment1-TranPhuocHien_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment1-TranPhuocHien].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET ARITHABORT OFF
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET  DISABLE_BROKER
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET  READ_WRITE
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET  MULTI_USER
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Assignment1-TranPhuocHien] SET DB_CHAINING OFF
GO
USE [Assignment1-TranPhuocHien]
GO
/****** Object:  User [hienPro]    Script Date: 03/16/2021 09:26:09 ******/
CREATE USER [hienPro] FOR LOGIN [hienPro] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 03/16/2021 09:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [varchar](50) NOT NULL,
	[categoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'B1', N'Burger')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'C4', N'Chicken')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'C7', N'Candy')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'D2', N'Drink')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'D5', N'Dessert')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'R3', N'Rice')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'S6', N'Snack')
/****** Object:  Table [dbo].[tblRole]    Script Date: 03/16/2021 09:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRole](
	[roleID] [varchar](50) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblRole] ([roleID], [roleName]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRole] ([roleID], [roleName]) VALUES (N'US', N'User')
/****** Object:  Table [dbo].[tblUser]    Script Date: 03/16/2021 09:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUser](
	[userID] [varchar](50) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[userPassword] [varchar](50) NULL,
	[roleID] [varchar](50) NOT NULL,
	[email] [nvarchar](50) NULL,
	[phone] [varchar](15) NULL,
	[address] [nvarchar](200) NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblUser] ([userID], [userName], [userPassword], [roleID], [email], [phone], [address], [status]) VALUES (N'106815600760978946181', N'hienlu2010vn', NULL, N'US', N'hienlu2010vn@gmail.com', NULL, NULL, 1)
INSERT [dbo].[tblUser] ([userID], [userName], [userPassword], [roleID], [email], [phone], [address], [status]) VALUES (N'116717620418327923741', N'hientpse140500', NULL, N'US', N'hientpse140500@fpt.edu.vn', NULL, NULL, 1)
INSERT [dbo].[tblUser] ([userID], [userName], [userPassword], [roleID], [email], [phone], [address], [status]) VALUES (N'admin', N'admin', N'123456', N'AD', N'admin@mail.com', NULL, NULL, 1)
INSERT [dbo].[tblUser] ([userID], [userName], [userPassword], [roleID], [email], [phone], [address], [status]) VALUES (N'hienAdmin', N'Tran Phuoc Hien', N'1', N'AD', N'hien@mail.com', N'1111111111', N'aaa', 1)
INSERT [dbo].[tblUser] ([userID], [userName], [userPassword], [roleID], [email], [phone], [address], [status]) VALUES (N'hienUser', N'hien tran phuoc', N'1', N'US', N'hienlu@mail.com', N'1111111111', N'aaa', 1)
INSERT [dbo].[tblUser] ([userID], [userName], [userPassword], [roleID], [email], [phone], [address], [status]) VALUES (N'test', N'tester', N'123456', N'US', N'tester@mail.com', NULL, NULL, 1)
/****** Object:  Table [dbo].[tblItem]    Script Date: 03/16/2021 09:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblItem](
	[itemID] [varchar](50) NOT NULL,
	[itemName] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[categoryID] [varchar](50) NOT NULL,
	[imageLink] [nvarchar](200) NULL,
	[description] [nvarchar](200) NULL,
	[price] [float] NOT NULL,
	[status] [bit] NOT NULL,
	[createDate] [date] NOT NULL,
	[expDate] [date] NULL,
 CONSTRAINT [PK_tblItem] PRIMARY KEY CLUSTERED 
(
	[itemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate], [expDate]) VALUES (N'B001', N'Beef Burger + cheese', 993, N'B1', N'https://www.burgerfuel.com/uploads/media/5d265192222b6/bfd-beef-c-n-cheese-1000px-nz-2018.png?v1', NULL, 2.5, 1, CAST(0x02420B00 AS Date), NULL)
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate], [expDate]) VALUES (N'B002', N'Beef Burger + egg + cheese ', 299, N'B1', N'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2015/11/2/2/FNK_Hangover-Sausage-Egg-Burger_s4x3.jpg.rend.hgtvcom.826.620.suffix/1447284805283.jpeg', NULL, 2.5, 1, CAST(0x02420B00 AS Date), NULL)
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate], [expDate]) VALUES (N'B003', N'Ham Burger', 100, N'B1', N'https://assets.epicurious.com/photos/57c5c6d9cf9e9ad43de2d96e/master/pass/the-ultimate-hamburger.jpg', N'good', 2, 1, CAST(0x02420B00 AS Date), NULL)
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate], [expDate]) VALUES (N'B004', N'Shrimp Burger', 400, N'B1', N'https://imagesvc.meredithcorp.io/v3/mm/image?q=85&c=sc&poi=face&w=420&h=220&url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F19%2F2013%2F09%2F06%2Fshrimp-burger-ck-x.jpg', NULL, 1.5, 1, CAST(0x02420B00 AS Date), NULL)
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate], [expDate]) VALUES (N'B005', N'Less-Kcal Ham Burger', 100, N'B1', N'https://i.pinimg.com/originals/63/c1/e2/63c1e2497eed844ed0dc0b3c6216d45d.jpg', NULL, 1.5, 1, CAST(0x02420B00 AS Date), NULL)
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate], [expDate]) VALUES (N'B010', N'Very big burger', 20, N'B1', N'https://i.imgur.com/Fim2CJf.jpg', N'everything inside', 20, 0, CAST(0x0C420B00 AS Date), NULL)
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate], [expDate]) VALUES (N'C001', N'6 X Chicken wings', 97, N'C4', N'https://thewoksoflife.com/wp-content/uploads/2015/04/fried-chicken-wings-4.jpg', NULL, 5, 1, CAST(0x02420B00 AS Date), NULL)
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate], [expDate]) VALUES (N'C002', N'10 X Chicken wings', 50, N'C4', N'https://thewoksoflife.com/wp-content/uploads/2015/04/fried-chicken-wings-4.jpg', NULL, 8, 1, CAST(0x02420B00 AS Date), NULL)
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate], [expDate]) VALUES (N'C006', N'deep fried chicken', 0, N'C4', N'https://i.imgur.com/QRohjjn.jpg', N'good', 10, 0, CAST(0x0C420B00 AS Date), NULL)
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate], [expDate]) VALUES (N'C022', N'SUGUS', 58, N'C7', N'https://i.imgur.com/qtKA4L7.jpg', N'kid very like this', 1, 0, CAST(0x0F420B00 AS Date), NULL)
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate], [expDate]) VALUES (N'D201', N'TH true MILK', 997, N'D2', N'https://cdn.tgdd.vn/Products/Images/2386/79296/bhx/sua-tuoi-tiet-trung-co-duong-th-true-milk-hop-1-lit-202002241537054195.JPG', NULL, 1, 1, CAST(0x02420B00 AS Date), NULL)
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate], [expDate]) VALUES (N'D202', N'Fanta', 997, N'D2', N'https://cdn.tgdd.vn/Products/Images/2443/76453/bhx/nuoc-ngot-fanta-vi-cam-lon-330ml-201812281420358633.jpg', NULL, 1.5, 1, CAST(0x02420B00 AS Date), NULL)
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate], [expDate]) VALUES (N'D203', N'Coca-Cola', 999, N'D2', N'https://cf.shopee.vn/file/d8d4a36f436bc147eb74a7965f97bd36', NULL, 1.5, 1, CAST(0x02420B00 AS Date), NULL)
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate], [expDate]) VALUES (N'D204', N'Milo', 1000, N'D2', N'https://bizweb.dktcdn.net/thumb/large/100/197/189/products/70-14194070-c2a2-4659-ac44-9d17de133e79.jpg', NULL, 1, 0, CAST(0x02420B00 AS Date), NULL)
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate], [expDate]) VALUES (N'D501', N'Ice-Cream', 9998, N'D5', N'https://laurenslatest.com/wp-content/uploads/2020/08/vanilla-ice-cream-5-copy.jpg', NULL, 0.5, 1, CAST(0x02420B00 AS Date), NULL)
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate], [expDate]) VALUES (N'D502', N'Apple pie', 996, N'D5', N'https://kristineskitchenblog.com/wp-content/uploads/2013/11/Apple-Pie-700-592.jpg', NULL, 1.5, 1, CAST(0x02420B00 AS Date), NULL)
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate], [expDate]) VALUES (N'D503', N'Strawberry sundae', 100, N'D5', N'https://realfood.tesco.com/media/images/RFO-1400x919-Strawberry-sharing-sundae-12692ed4-8c60-4366-847f-a73c945801fc-0-1400x919.jpg', NULL, 1.5, 1, CAST(0x02420B00 AS Date), NULL)
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate], [expDate]) VALUES (N'D504', N'Chocolate sundae', 100, N'D5', N'https://lifeasmom.com/wp-content/uploads/2012/02/Triple-Chocolate-Sundaes-Life-as-Mom.jpg', NULL, 1.5, 1, CAST(0x02420B00 AS Date), NULL)
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate], [expDate]) VALUES (N'PU01', N'PhuHuu', 2, N'D5', N'https://i.imgur.com/UM3oyTv.png', N'good', 99999, 0, CAST(0x0E420B00 AS Date), NULL)
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate], [expDate]) VALUES (N'R001', N'Chicken rice', 0, N'R3', N'https://img.buzzfeed.com/thumbnailer-prod-us-east-1/video-api/assets/156880.jpg?output-format=auto&output-quality=auto', N'ngon', 5, 1, CAST(0x03420B00 AS Date), NULL)
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate], [expDate]) VALUES (N'R002', N'Beef rice', 187, N'R3', N'https://tmbidigitalassetsazure.blob.core.windows.net/rms3-prod/attachments/37/1200x1200/exps183075_SD153320C12_09_2b.jpg', NULL, 2.5, 0, CAST(0x03420B00 AS Date), NULL)
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate], [expDate]) VALUES (N'R003', N'Special Spice Chicken rice', 94, N'R3', N'https://www.gimmesomeoven.com/wp-content/uploads/2014/08/Spicy-Chicken-Fried-Rice-2.jpg', NULL, 4, 0, CAST(0x03420B00 AS Date), NULL)
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate], [expDate]) VALUES (N'R004', N'Pork + Egg rice ', 67, N'R3', N'https://comtamanhtu.com/images/stores/2019/11/16/A17.jpg', NULL, 2, 0, CAST(0x03420B00 AS Date), NULL)
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate], [expDate]) VALUES (N'R005', N'Extra rice', 0, N'R3', N'https://photo-cms-plo.zadn.vn/w653/Uploaded/2021/ymzmf/2017_11_18/com_trang_mwxu.jpg', NULL, 1, 1, CAST(0x03420B00 AS Date), NULL)
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate], [expDate]) VALUES (N'R006', N'Egg fried rice', 995, N'R3', N'https://myfoodstory.com/wp-content/uploads/2020/02/Egg-Fried-Rice-3.jpg', NULL, 2, 1, CAST(0xFE410B00 AS Date), NULL)
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate], [expDate]) VALUES (N'S001', N'Toonies Snack Cheese Favor', 196, N'S6', N'https://i.imgur.com/Kasdr6Z.jpg', N'popular snack for kid', 0.5, 0, CAST(0x0E420B00 AS Date), NULL)
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate], [expDate]) VALUES (N'S002', N'Toonies snack ', 396, N'S6', N'https://i.imgur.com/0wRjHZG.jpg', N'good', 0.5, 0, CAST(0x0E420B00 AS Date), NULL)
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate], [expDate]) VALUES (N'V001', N'Vinh Hao', 50, N'D2', N'https://i.imgur.com/k8YsSW8.jpg', N'fresh, good for hot days', 0.5, 0, CAST(0x0F420B00 AS Date), NULL)
/****** Object:  Table [dbo].[tblOrder]    Script Date: 03/16/2021 09:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [varchar](50) NOT NULL,
	[totalPrice] [float] NOT NULL,
	[orderDate] [date] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrder] ON
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (1, N'hienUser', 4.1, CAST(0x09420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (2, N'hienUser', 13.8, CAST(0x09420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (3, N'hienUser', 6.6, CAST(0x09420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (4, N'hienUser', 10.8, CAST(0x09420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (5, N'hienUser', 6.6, CAST(0x09420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (7, N'hienUser', 10, CAST(0x0D420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (8, N'hienUser', 20, CAST(0x0D420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (9, N'hienUser', 12, CAST(0x0D420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (10, N'hienUser', 38, CAST(0x0D420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (11, N'hienUser', 4.2, CAST(0x0D420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (12, N'hienUser', 2.2, CAST(0x0D420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (13, N'hienUser', 20, CAST(0x0D420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (14, N'hienUser', 20, CAST(0x0D420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (15, N'hienUser', 41.8, CAST(0x0D420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (16, N'hienUser', 4.4, CAST(0x0D420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (17, N'106815600760978946181', 10, CAST(0x0D420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (18, N'106815600760978946181', 200, CAST(0x0D420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (19, N'106815600760978946181', 8.8, CAST(0x0D420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (20, N'116717620418327923741', 20.5, CAST(0x0E420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (21, N'hienUser', 26, CAST(0x0F420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (22, N'hienUser', 7.5, CAST(0x10420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (23, N'hienUser', 7, CAST(0x10420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (24, N'hienUser', 4, CAST(0x10420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (25, N'106815600760978946181', 15, CAST(0x10420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (26, N'hienUser', 4, CAST(0x10420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (27, N'116717620418327923741', 9, CAST(0x10420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (28, N'hienUser', 6, CAST(0x16420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (29, N'106815600760978946181', 72.5, CAST(0x1F420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (30, N'106815600760978946181', 32.5, CAST(0x3E420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (31, N'106815600760978946181', 22.5, CAST(0x3E420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (32, N'hienUser', 915, CAST(0x48420B00 AS Date), 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalPrice], [orderDate], [status]) VALUES (33, N'hienUser', 1008, CAST(0x48420B00 AS Date), 1)
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
/****** Object:  Table [dbo].[tblHistory]    Script Date: 03/16/2021 09:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblHistory](
	[historyID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [varchar](50) NOT NULL,
	[itemID] [varchar](50) NOT NULL,
	[updateDate] [date] NOT NULL,
	[updateContent] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_tblHistory] PRIMARY KEY CLUSTERED 
(
	[historyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblHistory] ON
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (1, N'hienAdmin', N'PU01', CAST(0x0F420B00 AS Date), N'itemID = PU01 have been updated: [itemName from [Phu] to [PhuHuu]] [description from [very good] to [good]] [price from [90000.0] to [9000.0]] [quantity from [3] to [1]] ')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (2, N'hienAdmin', N'C022', CAST(0x0F420B00 AS Date), N'itemID = C022 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (3, N'hienAdmin', N'C022', CAST(0x0F420B00 AS Date), N'itemID = C022 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (4, N'hienAdmin', N'C022', CAST(0x0F420B00 AS Date), N'itemID = C022 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (5, N'hienAdmin', N'PU01', CAST(0x0F420B00 AS Date), N'itemID = PU01 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (6, N'hienAdmin', N'PU01', CAST(0x0F420B00 AS Date), N'itemID = PU01 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (7, N'hienAdmin', N'PU01', CAST(0x0F420B00 AS Date), N'itemID = PU01 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (8, N'hienAdmin', N'S001', CAST(0x0F420B00 AS Date), N'itemID = S001 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (9, N'hienAdmin', N'S001', CAST(0x0F420B00 AS Date), N'itemID = S001 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (10, N'hienAdmin', N'C022', CAST(0x0F420B00 AS Date), N'itemID = C022 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (11, N'hienAdmin', N'C022', CAST(0x0F420B00 AS Date), N'itemID = C022 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (12, N'hienAdmin', N'PU01', CAST(0x0F420B00 AS Date), N'itemID = PU01 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (13, N'hienAdmin', N'S001', CAST(0x0F420B00 AS Date), N'itemID = S001 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (14, N'hienAdmin', N'B010', CAST(0x0F420B00 AS Date), N'itemID = B010 have been updated: [quantity from [0] to [20]] ')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (15, N'hienAdmin', N'S002', CAST(0x0F420B00 AS Date), N'itemID = S002 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (16, N'hienAdmin', N'C001', CAST(0x0F420B00 AS Date), N'itemID = C001 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (17, N'hienAdmin', N'C001', CAST(0x0F420B00 AS Date), N'itemID = C001 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (18, N'hienAdmin', N'D204', CAST(0x0F420B00 AS Date), N'itemID = D204 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (19, N'hienAdmin', N'D204', CAST(0x0F420B00 AS Date), N'itemID = D204 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (20, N'hienAdmin', N'PU01', CAST(0x0F420B00 AS Date), N'itemID = PU01 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (21, N'hienAdmin', N'PU01', CAST(0x0F420B00 AS Date), N'itemID = PU01 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (22, N'hienAdmin', N'D204', CAST(0x0F420B00 AS Date), N'itemID = D204 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (23, N'hienAdmin', N'D204', CAST(0x0F420B00 AS Date), N'itemID = D204 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (24, N'hienAdmin', N'D204', CAST(0x0F420B00 AS Date), N'itemID = D204 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (25, N'hienAdmin', N'D204', CAST(0x0F420B00 AS Date), N'itemID = D204 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (26, N'hienAdmin', N'PU01', CAST(0x0F420B00 AS Date), N'itemID = PU01 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (27, N'hienAdmin', N'PU01', CAST(0x0F420B00 AS Date), N'itemID = PU01 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (28, N'hienAdmin', N'B001', CAST(0x0F420B00 AS Date), N'itemID = B001 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (29, N'hienAdmin', N'B001', CAST(0x0F420B00 AS Date), N'itemID = B001 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (30, N'hienAdmin', N'PU01', CAST(0x0F420B00 AS Date), N'itemID = PU01 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (31, N'hienAdmin', N'PU01', CAST(0x0F420B00 AS Date), N'itemID = PU01 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (32, N'hienAdmin', N'D501', CAST(0x0F420B00 AS Date), N'itemID = D501 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (33, N'hienAdmin', N'D501', CAST(0x0F420B00 AS Date), N'itemID = D501 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (34, N'hienAdmin', N'D204', CAST(0x0F420B00 AS Date), N'itemID = D204 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (35, N'hienAdmin', N'D204', CAST(0x0F420B00 AS Date), N'itemID = D204 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (36, N'hienAdmin', N'D204', CAST(0x0F420B00 AS Date), N'itemID = D204 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (37, N'hienAdmin', N'D204', CAST(0x0F420B00 AS Date), N'itemID = D204 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (38, N'hienAdmin', N'PU01', CAST(0x0F420B00 AS Date), N'itemID = PU01 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (39, N'hienAdmin', N'PU01', CAST(0x0F420B00 AS Date), N'itemID = PU01 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (40, N'hienAdmin', N'C022', CAST(0x0F420B00 AS Date), N'itemID = C022 have been updated: [quantity from [99] to [100]] ')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (41, N'hienAdmin', N'V001', CAST(0x0F420B00 AS Date), N'New Item Added itemID = V001')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (42, N'hienAdmin', N'V001', CAST(0x0F420B00 AS Date), N'itemID = V001 have been updated: [itemName from [Vinh Hao] to [Vinh Ha0]] [description from [fresh, good for hot day] to [fresh, good for hot days]] ')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (43, N'hienAdmin', N'V001', CAST(0x0F420B00 AS Date), N'itemID = V001 have been updated: [itemName from [Vinh Ha0] to [Vinh Hao]] ')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (44, N'hienAdmin', N'C022', CAST(0x10420B00 AS Date), N'itemID = C022 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (45, N'hienAdmin', N'C022', CAST(0x10420B00 AS Date), N'itemID = C022 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (46, N'hienAdmin', N'C022', CAST(0x10420B00 AS Date), N'itemID = C022 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (47, N'hienAdmin', N'C022', CAST(0x10420B00 AS Date), N'itemID = C022 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (48, N'hienAdmin', N'R002', CAST(0x10420B00 AS Date), N'itemID = R002 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (49, N'hienAdmin', N'R002', CAST(0x10420B00 AS Date), N'itemID = R002 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (50, N'hienAdmin', N'V001', CAST(0x10420B00 AS Date), N'itemID = V001 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (51, N'hienAdmin', N'V001', CAST(0x10420B00 AS Date), N'itemID = V001 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (52, N'hienAdmin', N'PU01', CAST(0x10420B00 AS Date), N'itemID = PU01 have been updated: [quantity from [1] to [2]] ')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (53, N'hienAdmin', N'PU01', CAST(0x10420B00 AS Date), N'itemID = PU01 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (54, N'hienAdmin', N'C022', CAST(0x10420B00 AS Date), N'itemID = [C022, itemID, pageNum, name, priceMax, priceMin, category, V001, S001, btnAction] have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (61, N'hienAdmin', N'V001', CAST(0x10420B00 AS Date), N'itemID = [C022, itemID, pageNum, name, priceMax, priceMin, category, V001, S001, btnAction] have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (62, N'hienAdmin', N'S001', CAST(0x10420B00 AS Date), N'itemID = [C022, itemID, pageNum, name, priceMax, priceMin, category, V001, S001, btnAction] have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (64, N'hienAdmin', N'D202', CAST(0x10420B00 AS Date), N'itemID = [D202, itemID, pageNum, name, priceMax, priceMin, category, D203, D204, btnAction] have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (71, N'hienAdmin', N'D203', CAST(0x10420B00 AS Date), N'itemID = [D202, itemID, pageNum, name, priceMax, priceMin, category, D203, D204, btnAction] have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (72, N'hienAdmin', N'D204', CAST(0x10420B00 AS Date), N'itemID = [D202, itemID, pageNum, name, priceMax, priceMin, category, D203, D204, btnAction] have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (74, N'hienAdmin', N'C022', CAST(0x10420B00 AS Date), N'itemID = C022 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (75, N'hienAdmin', N'V001', CAST(0x10420B00 AS Date), N'itemID = V001 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (76, N'hienAdmin', N'V001', CAST(0x10420B00 AS Date), N'itemID = V001 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (80, N'hienAdmin', N'B004', CAST(0x10420B00 AS Date), N'itemID = B004 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (81, N'hienAdmin', N'B005', CAST(0x10420B00 AS Date), N'itemID = B005 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (83, N'hienAdmin', N'D202', CAST(0x10420B00 AS Date), N'itemID = D202 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (84, N'hienAdmin', N'D203', CAST(0x10420B00 AS Date), N'itemID = D203 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (85, N'hienAdmin', N'V001', CAST(0x10420B00 AS Date), N'itemID = V001 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (86, N'hienAdmin', N'S001', CAST(0x10420B00 AS Date), N'itemID = S001 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (87, N'hienAdmin', N'S001', CAST(0x10420B00 AS Date), N'itemID = S001 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (88, N'hienAdmin', N'V001', CAST(0x10420B00 AS Date), N'itemID = V001 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (89, N'hienAdmin', N'V001', CAST(0x10420B00 AS Date), N'itemID = V001 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (90, N'hienAdmin', N'V001', CAST(0x10420B00 AS Date), N'itemID = V001 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (91, N'hienAdmin', N'C022', CAST(0x10420B00 AS Date), N'itemID = C022 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (92, N'hienAdmin', N'S002', CAST(0x10420B00 AS Date), N'itemID = S002 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (93, N'hienAdmin', N'B010', CAST(0x10420B00 AS Date), N'itemID = B010 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (94, N'hienAdmin', N'R005', CAST(0x10420B00 AS Date), N'itemID = R005 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (95, N'hienAdmin', N'C022', CAST(0x10420B00 AS Date), N'itemID = C022 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (96, N'hienAdmin', N'C022', CAST(0x10420B00 AS Date), N'itemID = C022 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (103, N'hienAdmin', N'C006', CAST(0x10420B00 AS Date), N'itemID = C006 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (104, N'hienAdmin', N'R001', CAST(0x10420B00 AS Date), N'itemID = R001 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (105, N'hienAdmin', N'R002', CAST(0x10420B00 AS Date), N'itemID = R002 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (107, N'hienAdmin', N'R003', CAST(0x10420B00 AS Date), N'itemID = R003 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (114, N'hienAdmin', N'R004', CAST(0x10420B00 AS Date), N'itemID = R004 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (116, N'hienAdmin', N'B004', CAST(0x10420B00 AS Date), N'itemID = B004 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (117, N'hienAdmin', N'B005', CAST(0x10420B00 AS Date), N'itemID = B005 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (118, N'hienAdmin', N'C022', CAST(0x10420B00 AS Date), N'itemID = C022 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (119, N'hienAdmin', N'V001', CAST(0x10420B00 AS Date), N'itemID = V001 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (120, N'hienAdmin', N'S001', CAST(0x10420B00 AS Date), N'itemID = S001 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (121, N'hienAdmin', N'S002', CAST(0x10420B00 AS Date), N'itemID = S002 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (122, N'hienAdmin', N'PU01', CAST(0x10420B00 AS Date), N'itemID = PU01 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (123, N'hienAdmin', N'B010', CAST(0x10420B00 AS Date), N'itemID = B010 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (124, N'hienAdmin', N'C006', CAST(0x10420B00 AS Date), N'itemID = C006 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (125, N'hienAdmin', N'R001', CAST(0x10420B00 AS Date), N'itemID = R001 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (126, N'hienAdmin', N'R002', CAST(0x10420B00 AS Date), N'itemID = R002 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (127, N'hienAdmin', N'PU01', CAST(0x10420B00 AS Date), N'itemID = PU01 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (129, N'hienAdmin', N'R003', CAST(0x10420B00 AS Date), N'itemID = R003 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (130, N'hienAdmin', N'R004', CAST(0x10420B00 AS Date), N'itemID = R004 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (131, N'hienAdmin', N'R005', CAST(0x10420B00 AS Date), N'itemID = R005 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (133, N'hienAdmin', N'C022', CAST(0x10420B00 AS Date), N'itemID = C022 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (134, N'hienAdmin', N'V001', CAST(0x10420B00 AS Date), N'itemID = V001 have been removed')
GO
print 'Processed 100 total records'
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (135, N'hienAdmin', N'V001', CAST(0x10420B00 AS Date), N'itemID = V001 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (136, N'hienAdmin', N'C022', CAST(0x10420B00 AS Date), N'itemID = C022 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (138, N'hienAdmin', N'C022', CAST(0x10420B00 AS Date), N'itemID = C022 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (139, N'hienAdmin', N'V001', CAST(0x10420B00 AS Date), N'itemID = V001 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (140, N'hienAdmin', N'V001', CAST(0x10420B00 AS Date), N'itemID = V001 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (141, N'hienAdmin', N'C022', CAST(0x10420B00 AS Date), N'itemID = C022 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (142, N'hienAdmin', N'C022', CAST(0x10420B00 AS Date), N'itemID = C022 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (143, N'hienAdmin', N'V001', CAST(0x10420B00 AS Date), N'itemID = V001 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (144, N'hienAdmin', N'B010', CAST(0x10420B00 AS Date), N'itemID = B010 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (145, N'hienAdmin', N'R003', CAST(0x10420B00 AS Date), N'itemID = R003 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (146, N'hienAdmin', N'R004', CAST(0x10420B00 AS Date), N'itemID = R004 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (147, N'hienAdmin', N'R006', CAST(0x10420B00 AS Date), N'itemID = R006 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (148, N'hienAdmin', N'R006', CAST(0x10420B00 AS Date), N'itemID = R006 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (149, N'hienAdmin', N'C006', CAST(0x10420B00 AS Date), N'itemID = C006 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (150, N'hienAdmin', N'C006', CAST(0x10420B00 AS Date), N'itemID = C006 have been updated: [quantity from [0] to [5]] ')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (151, N'hienAdmin', N'C006', CAST(0x10420B00 AS Date), N'itemID = C006 have been updated: [quantity from [5] to [7]] ')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (152, N'hienAdmin', N'S001', CAST(0x10420B00 AS Date), N'itemID = S001 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (153, N'hienAdmin', N'S002', CAST(0x10420B00 AS Date), N'itemID = S002 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (154, N'hienAdmin', N'V001', CAST(0x10420B00 AS Date), N'itemID = V001 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (155, N'hienAdmin', N'V001', CAST(0x10420B00 AS Date), N'itemID = V001 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (156, N'hienAdmin', N'R001', CAST(0x10420B00 AS Date), N'itemID = R001 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (157, N'hienAdmin', N'R001', CAST(0x10420B00 AS Date), N'itemID = R001 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (158, N'hienAdmin', N'V001', CAST(0x10420B00 AS Date), N'itemID = V001 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (159, N'hienAdmin', N'C022', CAST(0x10420B00 AS Date), N'itemID = C022 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (160, N'hienAdmin', N'S001', CAST(0x10420B00 AS Date), N'itemID = S001 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (161, N'hienAdmin', N'V001', CAST(0x10420B00 AS Date), N'itemID = V001 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (162, N'hienAdmin', N'V001', CAST(0x10420B00 AS Date), N'itemID = V001 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (163, N'hienAdmin', N'V001', CAST(0x10420B00 AS Date), N'itemID = V001 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (164, N'hienAdmin', N'S001', CAST(0x10420B00 AS Date), N'itemID = S001 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (165, N'hienAdmin', N'V001', CAST(0x10420B00 AS Date), N'itemID = V001 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (166, N'hienAdmin', N'S001', CAST(0x10420B00 AS Date), N'itemID = S001 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (167, N'hienAdmin', N'C022', CAST(0x10420B00 AS Date), N'itemID = C022 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (168, N'hienAdmin', N'V001', CAST(0x10420B00 AS Date), N'itemID = V001 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (169, N'hienAdmin', N'S001', CAST(0x10420B00 AS Date), N'itemID = S001 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (170, N'hienAdmin', N'C022', CAST(0x10420B00 AS Date), N'itemID = C022 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (171, N'hienAdmin', N'V001', CAST(0x10420B00 AS Date), N'itemID = V001 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (172, N'hienAdmin', N'S001', CAST(0x10420B00 AS Date), N'itemID = S001 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (173, N'hienAdmin', N'S002', CAST(0x10420B00 AS Date), N'itemID = S002 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (174, N'hienAdmin', N'B010', CAST(0x10420B00 AS Date), N'itemID = B010 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (175, N'hienAdmin', N'V001', CAST(0x10420B00 AS Date), N'itemID = V001 have been updated: [quantity from [81] to [50]] ')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (176, N'hienAdmin', N'V001', CAST(0x10420B00 AS Date), N'itemID = V001 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (177, N'hienAdmin', N'S001', CAST(0x10420B00 AS Date), N'itemID = S001 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (178, N'hienAdmin', N'B010', CAST(0x10420B00 AS Date), N'itemID = B010 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (179, N'hienAdmin', N'S001', CAST(0x10420B00 AS Date), N'itemID = S001 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (180, N'hienAdmin', N'V001', CAST(0x10420B00 AS Date), N'itemID = V001 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (181, N'hienAdmin', N'B010', CAST(0x10420B00 AS Date), N'itemID = B010 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (182, N'hienAdmin', N'C022', CAST(0x16420B00 AS Date), N'itemID = C022 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (183, N'hienAdmin', N'V001', CAST(0x16420B00 AS Date), N'itemID = V001 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (184, N'hienAdmin', N'S002', CAST(0x16420B00 AS Date), N'itemID = S002 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (185, N'hienAdmin', N'V001', CAST(0x16420B00 AS Date), N'itemID = V001 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (186, N'hienAdmin', N'C022', CAST(0x16420B00 AS Date), N'itemID = C022 have been updated: [quantity from [81] to [90]] ')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (187, N'hienAdmin', N'PU01', CAST(0x19420B00 AS Date), N'itemID = PU01 have been updated: [price from [9000.0] to [123.0]] ')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (188, N'hienAdmin', N'PU01', CAST(0x19420B00 AS Date), N'itemID = PU01 have been updated: [price from [123.0] to [99999.0]] ')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (189, N'hienAdmin', N'PU01', CAST(0x19420B00 AS Date), N'itemID = PU01 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (190, N'hienAdmin', N'V001', CAST(0x19420B00 AS Date), N'itemID = V001 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (191, N'hienAdmin', N'PU01', CAST(0x19420B00 AS Date), N'itemID = PU01 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (192, N'hienAdmin', N'S001', CAST(0x19420B00 AS Date), N'itemID = S001 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (193, N'hienAdmin', N'B010', CAST(0x19420B00 AS Date), N'itemID = B010 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (194, N'hienAdmin', N'C006', CAST(0x1F420B00 AS Date), N'itemID = C006 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (195, N'hienAdmin', N'R001', CAST(0x1F420B00 AS Date), N'itemID = R001 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (196, N'hienAdmin', N'R001', CAST(0x1F420B00 AS Date), N'itemID = R001 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (197, N'hienAdmin', N'R001', CAST(0x1F420B00 AS Date), N'itemID = R001 have been updated: [description from [null] to [ngon]] [price from [2.5] to [5.0]] ')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (198, N'admin', N'C022', CAST(0x3E420B00 AS Date), N'itemID = C022 have been updated: [quantity from [90] to [58]] ')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (199, N'admin', N'R001', CAST(0x40420B00 AS Date), N'itemID = R001 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (200, N'admin', N'R002', CAST(0x40420B00 AS Date), N'itemID = R002 have been removed')
INSERT [dbo].[tblHistory] ([historyID], [userID], [itemID], [updateDate], [updateContent]) VALUES (201, N'admin', N'R001', CAST(0x40420B00 AS Date), N'itemID = R001 have been restored')
SET IDENTITY_INSERT [dbo].[tblHistory] OFF
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 03/16/2021 09:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[orderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NOT NULL,
	[itemID] [varchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_tblorderDetail] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetail] ON
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (1, 1, N'R004', 1, 1.9)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (2, 1, N'R001', 1, 2.2)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (4, 4, N'R002', 1, 2.2)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (5, 4, N'R003', 1, 4.2)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (6, 4, N'R001', 2, 2.2)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (7, 5, N'R002', 1, 2.2)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (8, 5, N'R001', 2, 2.2)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (9, 8, N'B010', 1, 20)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (10, 9, N'R001', 2, 2.2)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (11, 9, N'R004', 4, 1.9)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (12, 10, N'R003', 5, 4.2)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (13, 10, N'D502', 4, 1.5)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (14, 10, N'R005', 1, 1)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (15, 10, N'R006', 5, 2)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (16, 13, N'B010', 1, 20)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (17, 14, N'B010', 1, 20)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (18, 15, N'R004', 22, 1.9)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (19, 16, N'R001', 1, 2.2)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (20, 16, N'R002', 1, 2.2)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (21, 17, N'C006', 1, 10)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (22, 18, N'B003', 100, 2)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (23, 19, N'R002', 2, 2.2)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (24, 19, N'R001', 2, 2.2)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (25, 20, N'R003', 1, 4)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (26, 20, N'B001', 3, 2.5)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (27, 20, N'C001', 1, 5)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (28, 20, N'D201', 1, 1)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (29, 20, N'D202', 1, 1.5)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (30, 20, N'D203', 1, 1.5)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (31, 21, N'R004', 7, 2)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (32, 21, N'R005', 1, 1)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (33, 21, N'C001', 2, 5)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (34, 21, N'D501', 2, 0.5)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (35, 22, N'V001', 5, 0.5)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (36, 22, N'C022', 5, 1)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (37, 23, N'S001', 1, 0.5)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (38, 23, N'V001', 3, 0.5)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (39, 23, N'D201', 2, 1)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (40, 23, N'D202', 2, 1.5)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (41, 24, N'V001', 3, 0.5)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (42, 24, N'R001', 1, 2.5)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (43, 25, N'S001', 1, 0.5)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (44, 25, N'S002', 4, 0.5)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (45, 25, N'C006', 1, 10)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (46, 25, N'B002', 1, 2.5)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (47, 26, N'C022', 3, 1)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (48, 26, N'S001', 2, 0.5)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (49, 27, N'V001', 8, 0.5)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (50, 27, N'C022', 5, 1)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (51, 28, N'C022', 6, 1)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (52, 29, N'C006', 6, 10)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (53, 29, N'R001', 5, 2.5)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (54, 30, N'R001', 3, 5)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (55, 30, N'R002', 7, 2.5)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (56, 31, N'R001', 3, 5)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (57, 31, N'R002', 3, 2.5)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (58, 32, N'R001', 183, 5)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (59, 33, N'R005', 998, 1)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [itemID], [quantity], [price]) VALUES (60, 33, N'B001', 4, 2.5)
SET IDENTITY_INSERT [dbo].[tblOrderDetail] OFF
/****** Object:  ForeignKey [FK_tblUser_tblRole]    Script Date: 03/16/2021 09:26:10 ******/
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblRole] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRole] ([roleID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblRole]
GO
/****** Object:  ForeignKey [FK_tblItem_tblCategory]    Script Date: 03/16/2021 09:26:10 ******/
ALTER TABLE [dbo].[tblItem]  WITH CHECK ADD  CONSTRAINT [FK_tblItem_tblCategory] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblItem] CHECK CONSTRAINT [FK_tblItem_tblCategory]
GO
/****** Object:  ForeignKey [FK_tblOrder_tblUser]    Script Date: 03/16/2021 09:26:10 ******/
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUser] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUser]
GO
/****** Object:  ForeignKey [FK_tblHistory_tblItem]    Script Date: 03/16/2021 09:26:10 ******/
ALTER TABLE [dbo].[tblHistory]  WITH CHECK ADD  CONSTRAINT [FK_tblHistory_tblItem] FOREIGN KEY([itemID])
REFERENCES [dbo].[tblItem] ([itemID])
GO
ALTER TABLE [dbo].[tblHistory] CHECK CONSTRAINT [FK_tblHistory_tblItem]
GO
/****** Object:  ForeignKey [FK_tblHistory_tblUser]    Script Date: 03/16/2021 09:26:10 ******/
ALTER TABLE [dbo].[tblHistory]  WITH CHECK ADD  CONSTRAINT [FK_tblHistory_tblUser] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblHistory] CHECK CONSTRAINT [FK_tblHistory_tblUser]
GO
/****** Object:  ForeignKey [FK_tblorderDetail_tblItem]    Script Date: 03/16/2021 09:26:10 ******/
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblorderDetail_tblItem] FOREIGN KEY([itemID])
REFERENCES [dbo].[tblItem] ([itemID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblorderDetail_tblItem]
GO
/****** Object:  ForeignKey [FK_tblorderDetail_tblOrder]    Script Date: 03/16/2021 09:26:10 ******/
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblorderDetail_tblOrder] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblorderDetail_tblOrder]
GO
