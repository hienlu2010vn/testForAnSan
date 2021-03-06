USE [master]
GO
/****** Object:  Database [Assignment2-TranPhuocHien]    Script Date: 03/25/2021 07:31:32 ******/
CREATE DATABASE [Assignment2-TranPhuocHien] ON  PRIMARY 
( NAME = N'Assignment2-TranPhuocHien', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Assignment2-TranPhuocHien.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Assignment2-TranPhuocHien_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Assignment2-TranPhuocHien_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment2-TranPhuocHien].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET ARITHABORT OFF
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET  DISABLE_BROKER
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET  READ_WRITE
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET  MULTI_USER
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Assignment2-TranPhuocHien] SET DB_CHAINING OFF
GO
USE [Assignment2-TranPhuocHien]
GO
/****** Object:  User [hienPro]    Script Date: 03/25/2021 07:31:32 ******/
CREATE USER [hienPro] FOR LOGIN [hienPro] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[tblSubject]    Script Date: 03/25/2021 07:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSubject](
	[subjectID] [varchar](10) NOT NULL,
	[subjectName] [nvarchar](50) NULL,
	[totalQuest] [int] NULL,
	[time] [int] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblSubject] PRIMARY KEY CLUSTERED 
(
	[subjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblSubject] ([subjectID], [subjectName], [totalQuest], [time], [status]) VALUES (N'DBI', N'DataBase', 10, 2, 1)
INSERT [dbo].[tblSubject] ([subjectID], [subjectName], [totalQuest], [time], [status]) VALUES (N'MAD', N'Discrete Mathematics', 10, 2, 1)
INSERT [dbo].[tblSubject] ([subjectID], [subjectName], [totalQuest], [time], [status]) VALUES (N'PRF', N'C++', 5, 10, 1)
INSERT [dbo].[tblSubject] ([subjectID], [subjectName], [totalQuest], [time], [status]) VALUES (N'PRJ', N'Java app', 5, 2, 1)
INSERT [dbo].[tblSubject] ([subjectID], [subjectName], [totalQuest], [time], [status]) VALUES (N'PRJ321', N'Java web', 5, 2, 1)
INSERT [dbo].[tblSubject] ([subjectID], [subjectName], [totalQuest], [time], [status]) VALUES (N'PRN', N'C#', 5, 2, 1)
INSERT [dbo].[tblSubject] ([subjectID], [subjectName], [totalQuest], [time], [status]) VALUES (N'PRO', N'Java', 5, 2, 1)
INSERT [dbo].[tblSubject] ([subjectID], [subjectName], [totalQuest], [time], [status]) VALUES (N'SSG', N'Working in group', 5, 2, 1)
/****** Object:  Table [dbo].[tblRole]    Script Date: 03/25/2021 07:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRole](
	[roleID] [varchar](10) NOT NULL,
	[roleName] [varchar](20) NOT NULL,
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
/****** Object:  Table [dbo].[tblUser]    Script Date: 03/25/2021 07:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUser](
	[email] [nvarchar](100) NOT NULL,
	[userPassword] [nvarchar](100) NOT NULL,
	[roleID] [varchar](10) NOT NULL,
	[userName] [nvarchar](100) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblUser] ([email], [userPassword], [roleID], [userName], [status]) VALUES (N'admin', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'AD', N'Admin', 1)
INSERT [dbo].[tblUser] ([email], [userPassword], [roleID], [userName], [status]) VALUES (N'aladina@mail.com', N'd59eced1ded07f84c145592f65bdf854358e009c5cd705f5215bf18697fed103', N'US', N'40TenCuop', 1)
INSERT [dbo].[tblUser] ([email], [userPassword], [roleID], [userName], [status]) VALUES (N'anfoufr@mail.com', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'US', N'annnnn', 1)
INSERT [dbo].[tblUser] ([email], [userPassword], [roleID], [userName], [status]) VALUES (N'h13nIsZaBeTto@gmail.com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'US', N'H13n', 1)
INSERT [dbo].[tblUser] ([email], [userPassword], [roleID], [userName], [status]) VALUES (N'hien@gmail.com', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'US', N'Tran Phuoc Hien', 1)
INSERT [dbo].[tblUser] ([email], [userPassword], [roleID], [userName], [status]) VALUES (N'hienlu2010vn@gmail.com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'US', N'Phuoc Hien Tran', 1)
INSERT [dbo].[tblUser] ([email], [userPassword], [roleID], [userName], [status]) VALUES (N'testUser@mail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'US', N'tester', 1)
INSERT [dbo].[tblUser] ([email], [userPassword], [roleID], [userName], [status]) VALUES (N'userWhoCanDestroyZaWARUDO@mail.com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'US', N'Za Warudo', 1)
/****** Object:  Table [dbo].[tblQuestion]    Script Date: 03/25/2021 07:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblQuestion](
	[questID] [int] IDENTITY(1,1) NOT NULL,
	[questContent] [nvarchar](200) NOT NULL,
	[subjectID] [varchar](10) NOT NULL,
	[createDate] [date] NOT NULL,
	[status] [bit] NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[ans1] [nvarchar](200) NULL,
	[ans2] [nvarchar](200) NULL,
	[ans3] [nvarchar](200) NULL,
	[ans4] [nvarchar](200) NULL,
	[correctAns] [nvarchar](200) NULL,
	[checkTime] [datetime] NULL,
 CONSTRAINT [PK_tblQuestion] PRIMARY KEY CLUSTERED 
(
	[questID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblQuestion] ON
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (2, N'quest122', N'PRF', CAST(0x15420B00 AS Date), 0, N'admin', N'ans1', N'ans2', N'ans3', N'ans4', N'ans1', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (4, N'quest2', N'PRJ', CAST(0x15420B00 AS Date), 1, N'admin', N'ans1', N'ans2', N'ans3', N'ans4', N'ans1', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (5, N'quest3', N'PRJ', CAST(0x15420B00 AS Date), 1, N'admin', N'ans1', N'ans2', N'ans3', N'ans4', N'ans1', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (6, N'quest4', N'PRJ', CAST(0x15420B00 AS Date), 1, N'admin', N'ans1', N'ans2', N'ans3', N'ans4', N'ans1', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (7, N'quest5', N'PRN', CAST(0x15420B00 AS Date), 1, N'admin', N'ans1', N'ans2', N'ans3', N'ans4', N'ans1', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (8, N'quest6', N'PRJ', CAST(0x15420B00 AS Date), 1, N'admin', N'ans1', N'ans2', N'ans3', N'ans4', N'ans1', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (9, N'quest7', N'PRJ', CAST(0x15420B00 AS Date), 1, N'admin', N'ans1', N'ans2', N'ans3', N'ans4', N'ans1', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (10, N'quest8', N'PRJ', CAST(0x15420B00 AS Date), 1, N'admin', N'ans1', N'ans2', N'ans3', N'ans4', N'ans1', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (11, N'quest9', N'PRJ', CAST(0x15420B00 AS Date), 0, N'admin', N'ans1', N'ans2', N'ans3', N'ans4', N'ans1', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (12, N'quest1222', N'PRJ', CAST(0x15420B00 AS Date), 0, N'admin', N'ans1', N'ans2', N'ans3', N'ans4', N'ans1', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (13, N'quest1', N'PRF', CAST(0x15420B00 AS Date), 1, N'admin', N'ans1', N'ans2', N'ans3', N'ans4', N'ans1', CAST(0x0000ACF2015DCCCA AS DateTime))
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (14, N'quest2f', N'PRF', CAST(0x15420B00 AS Date), 1, N'admin', N'ans1', N'ans2', N'ans3', N'ans4', N'ans1', CAST(0x0000ACF2015DCCCB AS DateTime))
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (15, N'quest3f', N'PRF', CAST(0x15420B00 AS Date), 1, N'admin', N'ans1', N'ans2', N'ans3', N'ans4', N'ans1', CAST(0x0000ACF2015DCCCB AS DateTime))
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (16, N'quest4f', N'PRF', CAST(0x15420B00 AS Date), 1, N'admin', N'ans1', N'ans2', N'ans3', N'ans4', N'ans1', CAST(0x0000ACF2015DCCCB AS DateTime))
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (17, N'quest5f', N'PRF', CAST(0x15420B00 AS Date), 1, N'admin', N'ans1', N'ans2', N'ans3', N'ans4', N'ans1', CAST(0x0000ACF2015DCCCC AS DateTime))
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (18, N'quest6f', N'PRF', CAST(0x15420B00 AS Date), 1, N'admin', N'ans1', N'ans2', N'ans3', N'ans4', N'ans1', CAST(0x0000ACF2015DB0DB AS DateTime))
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (19, N'quest7f', N'PRF', CAST(0x15420B00 AS Date), 1, N'admin', N'ans1', N'ans2', N'ans3', N'ans4', N'ans1', CAST(0x0000ACF2015DB0DC AS DateTime))
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (20, N'quest8f', N'PRF', CAST(0x15420B00 AS Date), 1, N'admin', N'ans1', N'ans2', N'ans3', N'ans4', N'ans1', CAST(0x0000ACF2015DB0DC AS DateTime))
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (21, N'quest9f', N'PRF', CAST(0x15420B00 AS Date), 1, N'admin', N'ans1', N'ans2', N'ans3', N'ans4', N'ans1', CAST(0x0000ACF2015DB0DC AS DateTime))
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (22, N'quest1f', N'PRF', CAST(0x15420B00 AS Date), 1, N'admin', N'ans1', N'ans2', N'ans3', N'ans4', N'ans1', CAST(0x0000ACF2015DB0DD AS DateTime))
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (25, N'kiki', N'PRF', CAST(0x18420B00 AS Date), 1, N'admin', N'kaka', N'aa', N'baba', N'lala', N'ans1', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (26, N'mega', N'PRF', CAST(0x18420B00 AS Date), 1, N'admin', N'baga', N'saga', N'naga', N'kaga', N'ans1', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (27, N'mmmm', N'PRF', CAST(0x18420B00 AS Date), 1, N'admin', N'mm', N'mmm', N'mmmm', N'mmmmm', N'ans1', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (28, N'lego', N'PRF', CAST(0x18420B00 AS Date), 0, N'admin', N'bego', N'ego', N'nego', N'mego', N'ans1', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (29, N'mi xao la gi', N'SSG', CAST(0x18420B00 AS Date), 1, N'admin', N'mi chien', N'mi nuoc ', N'mi tron ', N'mi nuong', N'ans1', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (30, N'da cap', N'SSG', CAST(0x18420B00 AS Date), 0, N'admin', N'da vin cii', N'da da', N'da ka ra', N'da la qua khu', N'ans1', CAST(0x0000ACF2015DD1C8 AS DateTime))
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (31, N'alumalaaa', N'PRJ', CAST(0x18420B00 AS Date), 1, N'admin', N'me', N'mee', N'meee', N'meeee', N'ans1', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (32, N'toi la ai ?', N'SSG', CAST(0x18420B00 AS Date), 1, N'admin', N'ai', N'toi', N'la', N'?', N'ans1', CAST(0x0000ACF2015DD1C8 AS DateTime))
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (34, N'fly to the sky', N'PRN', CAST(0x18420B00 AS Date), 1, N'admin', N'sky', N'fly', N'to', N'the', N'ans1', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (35, N'power of god', N'PRN', CAST(0x18420B00 AS Date), 0, N'admin', N'power', N'of', N'god', N'?', N'ans1', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (36, N'ko ok', N'PRN', CAST(0x18420B00 AS Date), 1, N'admin', N'ok1', N'ok2', N'ok3', N'ok4', N'ans1', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (37, N'123', N'PRO', CAST(0x19420B00 AS Date), 1, N'admin', N'alo', N'10 ben', N'alola', N'rising', N'ans1', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (38, N'cau hoi 4', N'PRO', CAST(0x19420B00 AS Date), 1, N'admin', N'tra loi 1', N'tra loi 3', N'tra loi 2', N'tra loi 4', N'ans1', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (39, N'hay lam', N'SSG', CAST(0x19420B00 AS Date), 0, N'admin', N'ban oi', N'minh ', N'rat la', N'nguong mo ban', N'ans1', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (40, N'since we still suck', N'PRF', CAST(0x19420B00 AS Date), 0, N'admin', N'what?', N'nani?', N'cai gi?', N'wut?', N'ans1', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (41, N'this is me', N'PRJ321', CAST(0x19420B00 AS Date), 1, N'admin', N'no', N'not you', N'me', N'what', N'ans1', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (42, N'I can fly', N'SSG', CAST(0x1B420B00 AS Date), 1, N'admin', N'no', N'yes but no', N'no you suck', N'???', N'ans1', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (43, N'logic is not logic', N'SSG', CAST(0x1B420B00 AS Date), 1, N'admin', N'so it suck?', N'like you', N'yesssss', N'yes', N'ans1', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (44, N'LAZADA', N'PRN', CAST(0x1C420B00 AS Date), 1, N'admin', N'LA', N'ZA', N'DA', N'AAA', N'ans1', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (45, N'toi ten la hien', N'PRN', CAST(0x1D420B00 AS Date), 1, N'admin', N'hien la ai', N'hien la toi', N'thiet khong vay', N'yes', N'ans2', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (46, N'1234', N'PRF', CAST(0x1F420B00 AS Date), 1, N'admin', N'2133', N'23142341', N'324234', N'1212', N'ans1', NULL)
INSERT [dbo].[tblQuestion] ([questID], [questContent], [subjectID], [createDate], [status], [email], [ans1], [ans2], [ans3], [ans4], [correctAns], [checkTime]) VALUES (47, N'aaaaaaaaaaa', N'PRF', CAST(0x20420B00 AS Date), 1, N'admin', N'aaaaa', N'aaaaaa', N'aaaaaaaaa', N'aaaaaaaaaaaa', N'ans1', NULL)
SET IDENTITY_INSERT [dbo].[tblQuestion] OFF
/****** Object:  Table [dbo].[tblTest]    Script Date: 03/25/2021 07:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTest](
	[testID] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[createDate] [date] NOT NULL,
	[totalQuest] [int] NOT NULL,
	[subjectID] [varchar](10) NULL,
	[totalCorrect] [int] NULL,
 CONSTRAINT [PK_tblTest] PRIMARY KEY CLUSTERED 
(
	[testID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblTest] ON
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (36, N'hien@gmail.com', CAST(0x1D420B00 AS Date), 5, N'PRF', 4)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (37, N'hien@gmail.com', CAST(0x1D420B00 AS Date), 5, N'PRJ', 1)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (38, N'hien@gmail.com', CAST(0x1D420B00 AS Date), 5, N'PRF', 5)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (39, N'hien@gmail.com', CAST(0x1D420B00 AS Date), 5, N'PRN', 3)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (40, N'hien@gmail.com', CAST(0x1D420B00 AS Date), 5, N'PRF', 5)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (41, N'hien@gmail.com', CAST(0x1D420B00 AS Date), 5, N'PRN', 5)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (42, N'hien@gmail.com', CAST(0x1D420B00 AS Date), 5, N'PRF', 0)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (43, N'hien@gmail.com', CAST(0x1D420B00 AS Date), 5, N'PRJ', 2)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (44, N'hien@gmail.com', CAST(0x1D420B00 AS Date), 5, N'PRF', 1)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (45, N'hien@gmail.com', CAST(0x1D420B00 AS Date), 5, N'PRF', 0)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (46, N'hien@gmail.com', CAST(0x1D420B00 AS Date), 5, N'SSG', 5)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (47, N'hien@gmail.com', CAST(0x1D420B00 AS Date), 5, N'PRF', 0)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (48, N'hien@gmail.com', CAST(0x1D420B00 AS Date), 5, N'PRF', 0)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (49, N'hien@gmail.com', CAST(0x1D420B00 AS Date), 5, N'PRF', 3)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (50, N'hien@gmail.com', CAST(0x1D420B00 AS Date), 5, N'PRF', 0)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (51, N'hien@gmail.com', CAST(0x1D420B00 AS Date), 5, N'PRF', 5)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (52, N'hien@gmail.com', CAST(0x1D420B00 AS Date), 5, N'PRF', 1)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (53, N'hien@gmail.com', CAST(0x1E420B00 AS Date), 5, N'SSG', 5)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (54, N'hien@gmail.com', CAST(0x1E420B00 AS Date), 5, N'PRF', 1)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (55, N'hien@gmail.com', CAST(0x1E420B00 AS Date), 5, N'PRN', 4)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (56, N'anfoufr@mail.com', CAST(0x1E420B00 AS Date), 5, N'PRF', 4)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (57, N'hien@gmail.com', CAST(0x1E420B00 AS Date), 5, N'PRF', 5)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (58, N'hien@gmail.com', CAST(0x20420B00 AS Date), 5, N'PRJ', 5)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (59, N'hien@gmail.com', CAST(0x21420B00 AS Date), 5, N'PRJ', 1)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (60, N'hien@gmail.com', CAST(0x2A420B00 AS Date), 5, N'PRF', 5)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (61, N'hien@gmail.com', CAST(0x2A420B00 AS Date), 5, N'PRJ', 5)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (62, N'hien@gmail.com', CAST(0x2A420B00 AS Date), 5, N'PRF', 4)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (63, N'hien@gmail.com', CAST(0x3A420B00 AS Date), 5, N'PRF', 0)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (64, N'hien@gmail.com', CAST(0x3A420B00 AS Date), 5, N'PRF', 0)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (65, N'hienlu2010vn@gmail.com', CAST(0x4A420B00 AS Date), 5, N'PRF', 0)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (66, N'hienlu2010vn@gmail.com', CAST(0x4A420B00 AS Date), 5, N'PRF', 0)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (67, N'hienlu2010vn@gmail.com', CAST(0x4A420B00 AS Date), 5, N'PRF', 0)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (68, N'hienlu2010vn@gmail.com', CAST(0x4D420B00 AS Date), 5, N'PRF', 0)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (69, N'hienlu2010vn@gmail.com', CAST(0x4D420B00 AS Date), 5, N'PRF', 0)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (70, N'hienlu2010vn@gmail.com', CAST(0x4D420B00 AS Date), 5, N'PRF', 0)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (71, N'hienlu2010vn@gmail.com', CAST(0x4D420B00 AS Date), 5, N'PRF', 1)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (72, N'hienlu2010vn@gmail.com', CAST(0x4D420B00 AS Date), 5, N'PRJ', 1)
INSERT [dbo].[tblTest] ([testID], [email], [createDate], [totalQuest], [subjectID], [totalCorrect]) VALUES (73, N'hienlu2010vn@gmail.com', CAST(0x51420B00 AS Date), 5, N'PRJ', 0)
SET IDENTITY_INSERT [dbo].[tblTest] OFF
/****** Object:  Table [dbo].[tblTestDetail]    Script Date: 03/25/2021 07:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTestDetail](
	[testDetailID] [int] IDENTITY(1,1) NOT NULL,
	[testID] [int] NOT NULL,
	[questID] [int] NOT NULL,
	[correctAns] [nvarchar](200) NULL,
	[userAns] [nvarchar](200) NULL,
	[questContent] [nvarchar](200) NULL,
	[ans1] [nvarchar](200) NULL,
	[ans2] [nvarchar](200) NULL,
	[ans3] [nvarchar](200) NULL,
	[ans4] [nvarchar](200) NULL,
 CONSTRAINT [PK_tbltestDetail] PRIMARY KEY CLUSTERED 
(
	[testDetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblTestDetail] ON
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (173, 36, 26, N'ans1', N'ans2', N'mega', N'baga', N'saga', N'naga', N'kaga')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (174, 36, 28, N'ans1', N'ans1', N'lego', N'bego', N'ego', N'nego', N'mego')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (175, 36, 20, N'ans1', N'ans1', N'quest8f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (176, 36, 16, N'ans1', N'ans1', N'quest4f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (177, 36, 21, N'ans1', N'ans1', N'quest9f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (178, 37, 9, N'ans1', N'', N'quest7', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (179, 37, 11, N'ans1', N'ans2', N'quest9', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (180, 37, 4, N'ans1', N'ans3', N'quest2', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (181, 37, 8, N'ans1', N'ans1', N'quest6', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (182, 37, 31, N'ans1', N'ans3', N'alumalaaa', N'me', N'mee', N'meee', N'meeee')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (183, 38, 2, N'ans1', N'ans1', N'quest122', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (184, 38, 25, N'ans1', N'ans1', N'kiki', N'kaka', N'aa', N'baba', N'lala')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (185, 38, 13, N'ans1', N'ans1', N'quest1', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (186, 38, 28, N'ans1', N'ans1', N'lego', N'bego', N'ego', N'nego', N'mego')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (187, 38, 17, N'ans1', N'ans1', N'quest5f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (188, 39, 35, N'ans1', N'ans1', N'power of god', N'power', N'of', N'god', N'?')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (189, 39, 44, N'ans1', N'ans1', N'LAZADA', N'LA', N'ZA', N'DA', N'AAA')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (190, 39, 7, N'ans1', N'ans1', N'quest5', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (191, 39, 36, N'ans1', N'ans2', N'ko ok', N'ok1', N'ok2', N'ok3', N'ok4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (192, 39, 34, N'ans1', N'ans3', N'fly to the sky', N'sky', N'fly', N'to', N'the')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (193, 40, 28, N'ans1', N'ans1', N'lego', N'bego', N'ego', N'nego', N'mego')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (194, 40, 26, N'ans1', N'ans1', N'mega', N'baga', N'saga', N'naga', N'kaga')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (195, 40, 14, N'ans1', N'ans1', N'quest2f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (196, 40, 15, N'ans1', N'ans1', N'quest3f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (197, 40, 22, N'ans1', N'ans1', N'quest1f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (198, 41, 34, N'ans1', N'ans1', N'fly to the sky', N'sky', N'fly', N'to', N'the')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (199, 41, 35, N'ans1', N'ans1', N'power of god', N'power', N'of', N'god', N'?')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (200, 41, 44, N'ans1', N'ans1', N'LAZADA', N'LA', N'ZA', N'DA', N'AAA')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (201, 41, 7, N'ans1', N'ans1', N'quest5', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (202, 41, 36, N'ans1', N'ans1', N'ko ok', N'ok1', N'ok2', N'ok3', N'ok4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (203, 42, 28, N'ans1', N'', N'lego', N'bego', N'ego', N'nego', N'mego')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (204, 42, 40, N'ans1', N'', N'since we still suck', N'what?', N'nani?', N'cai gi?', N'wut?')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (205, 42, 14, N'ans1', N'', N'quest2f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (206, 42, 19, N'ans1', N'', N'quest7f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (207, 42, 25, N'ans1', N'', N'kiki', N'kaka', N'aa', N'baba', N'lala')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (208, 43, 9, N'ans1', N'', N'quest7', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (209, 43, 31, N'ans1', N'ans2', N'alumalaaa', N'me', N'mee', N'meee', N'meeee')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (210, 43, 4, N'ans1', N'ans1', N'quest2', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (211, 43, 8, N'ans1', N'ans1', N'quest6', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (212, 43, 11, N'ans1', N'', N'quest9', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (213, 44, 17, N'ans1', N'ans1', N'quest5f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (214, 44, 13, N'ans1', N'', N'quest1', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (215, 44, 19, N'ans1', N'', N'quest7f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (216, 44, 18, N'ans1', N'', N'quest6f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (217, 44, 40, N'ans1', N'', N'since we still suck', N'what?', N'nani?', N'cai gi?', N'wut?')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (218, 45, 20, N'ans1', N'', N'quest8f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (219, 45, 27, N'ans1', N'', N'mmmm', N'mm', N'mmm', N'mmmm', N'mmmmm')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (220, 45, 26, N'ans1', N'', N'mega', N'baga', N'saga', N'naga', N'kaga')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (221, 45, 16, N'ans1', N'', N'quest4f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (222, 45, 28, N'ans1', N'', N'lego', N'bego', N'ego', N'nego', N'mego')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (223, 46, 39, N'ans1', N'ans1', N'hay lam', N'ban oi', N'minh ', N'rat la', N'nguong mo ban')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (224, 46, 30, N'ans1', N'ans1', N'da cap', N'da vin cii', N'da da', N'da ka ra', N'da la qua khu')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (225, 46, 43, N'ans1', N'ans1', N'logic is not logic', N'so it suck?', N'like you', N'yesssss', N'yes')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (226, 46, 29, N'ans1', N'ans1', N'mi xao la gi', N'mi chien', N'mi nuoc ', N'mi tron ', N'mi nuong')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (227, 46, 42, N'ans1', N'ans1', N'I can fly', N'no', N'yes but no', N'no you suck', N'???')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (228, 47, 15, N'ans1', N'', N'quest3f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (229, 47, 21, N'ans1', N'', N'quest9f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (230, 47, 19, N'ans1', N'', N'quest7f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (231, 47, 27, N'ans1', N'', N'mmmm', N'mm', N'mmm', N'mmmm', N'mmmmm')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (232, 47, 18, N'ans1', N'', N'quest6f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (233, 48, 40, N'ans1', N'', N'since we still suck', N'what?', N'nani?', N'cai gi?', N'wut?')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (234, 48, 19, N'ans1', N'', N'quest7f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (235, 48, 22, N'ans1', N'', N'quest1f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (236, 48, 28, N'ans1', N'', N'lego', N'bego', N'ego', N'nego', N'mego')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (237, 48, 17, N'ans1', N'', N'quest5f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (238, 49, 22, N'ans1', N'ans1', N'quest1f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (239, 49, 27, N'ans1', N'ans1', N'mmmm', N'mm', N'mmm', N'mmmm', N'mmmmm')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (240, 49, 19, N'ans1', N'ans2', N'quest7f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (241, 49, 40, N'ans1', N'ans2', N'since we still suck', N'what?', N'nani?', N'cai gi?', N'wut?')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (242, 49, 17, N'ans1', N'ans1', N'quest5f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (243, 50, 19, N'ans1', N'', N'quest7f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (244, 50, 22, N'ans1', N'', N'quest1f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (245, 50, 27, N'ans1', N'', N'mmmm', N'mm', N'mmm', N'mmmm', N'mmmmm')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (246, 50, 26, N'ans1', N'', N'mega', N'baga', N'saga', N'naga', N'kaga')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (247, 50, 14, N'ans1', N'', N'quest2f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (248, 51, 21, N'ans1', N'ans1', N'quest9f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (249, 51, 17, N'ans1', N'ans1', N'quest5f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (250, 51, 14, N'ans1', N'ans1', N'quest2f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (251, 51, 20, N'ans1', N'ans1', N'quest8f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (252, 51, 26, N'ans1', N'ans1', N'mega', N'baga', N'saga', N'naga', N'kaga')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (253, 52, 28, N'ans1', N'ans1', N'lego', N'bego', N'ego', N'nego', N'mego')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (254, 52, 27, N'ans1', N'', N'mmmm', N'mm', N'mmm', N'mmmm', N'mmmmm')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (255, 52, 14, N'ans1', N'', N'quest2f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (256, 52, 26, N'ans1', N'', N'mega', N'baga', N'saga', N'naga', N'kaga')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (257, 52, 15, N'ans1', N'', N'quest3f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (258, 53, 39, N'ans1', N'ans1', N'hay lam', N'ban oi', N'minh ', N'rat la', N'nguong mo ban')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (259, 53, 42, N'ans1', N'ans1', N'I can fly', N'no', N'yes but no', N'no you suck', N'???')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (260, 53, 29, N'ans1', N'ans1', N'mi xao la gi', N'mi chien', N'mi nuoc ', N'mi tron ', N'mi nuong')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (261, 53, 43, N'ans1', N'ans1', N'logic is not logic', N'so it suck?', N'like you', N'yesssss', N'yes')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (262, 53, 30, N'ans1', N'ans1', N'da cap', N'da vin cii', N'da da', N'da ka ra', N'da la qua khu')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (263, 54, 27, N'ans1', N'ans2', N'mmmm', N'mm', N'mmm', N'mmmm', N'mmmmm')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (264, 54, 13, N'ans1', N'ans2', N'quest1', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (265, 54, 26, N'ans1', N'ans2', N'mega', N'baga', N'saga', N'naga', N'kaga')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (266, 54, 14, N'ans1', N'ans1', N'quest2f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (267, 54, 22, N'ans1', N'ans2', N'quest1f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (268, 55, 44, N'ans1', N'ans1', N'LAZADA', N'LA', N'ZA', N'DA', N'AAA')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (269, 55, 45, N'ans2', N'ans1', N'toi ten la hien', N'hien la ai', N'hien la toi', N'thiet khong vay', N'yes')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (270, 55, 35, N'ans1', N'ans1', N'power of god', N'power', N'of', N'god', N'?')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (271, 55, 7, N'ans1', N'ans1', N'quest5', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (272, 55, 34, N'ans1', N'ans1', N'fly to the sky', N'sky', N'fly', N'to', N'the')
GO
print 'Processed 100 total records'
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (273, 56, 13, N'ans1', N'ans1', N'quest1', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (274, 56, 21, N'ans1', N'ans1', N'quest9f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (275, 56, 17, N'ans1', N'ans1', N'quest5f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (276, 56, 15, N'ans1', N'ans1', N'quest3f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (277, 56, 22, N'ans1', N'ans4', N'quest1f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (278, 57, 26, N'ans1', N'ans1', N'mega', N'baga', N'saga', N'naga', N'kaga')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (279, 57, 2, N'ans1', N'ans1', N'quest122', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (280, 57, 14, N'ans1', N'ans1', N'quest2f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (281, 57, 16, N'ans1', N'ans1', N'quest4f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (282, 57, 20, N'ans1', N'ans1', N'quest8f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (283, 58, 10, N'ans1', N'ans1', N'quest8', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (284, 58, 6, N'ans1', N'ans1', N'quest4', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (285, 58, 11, N'ans1', N'ans1', N'quest9', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (286, 58, 8, N'ans1', N'ans1', N'quest6', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (287, 58, 5, N'ans1', N'ans1', N'quest3', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (288, 59, 9, N'ans1', N'ans2', N'quest7', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (289, 59, 31, N'ans1', N'ans2', N'alumalaaa', N'me', N'mee', N'meee', N'meeee')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (290, 59, 6, N'ans1', N'ans2', N'quest4', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (291, 59, 10, N'ans1', N'ans1', N'quest8', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (292, 59, 11, N'ans1', N'ans2', N'quest9', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (293, 60, 15, N'ans1', N'ans1', N'quest3f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (294, 60, 28, N'ans1', N'ans1', N'lego', N'bego', N'ego', N'nego', N'mego')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (295, 60, 21, N'ans1', N'ans1', N'quest9f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (296, 60, 22, N'ans1', N'ans1', N'quest1f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (297, 60, 19, N'ans1', N'ans1', N'quest7f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (298, 61, 6, N'ans1', N'ans1', N'quest4', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (299, 61, 11, N'ans1', N'ans1', N'quest9', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (300, 61, 5, N'ans1', N'ans1', N'quest3', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (301, 61, 12, N'ans1', N'ans1', N'quest1222', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (302, 61, 8, N'ans1', N'ans1', N'quest6', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (303, 62, 15, N'ans1', N'ans1', N'quest3f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (304, 62, 14, N'ans1', N'ans1', N'quest2f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (305, 62, 27, N'ans1', N'ans1', N'mmmm', N'mm', N'mmm', N'mmmm', N'mmmmm')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (306, 62, 19, N'ans1', N'ans1', N'quest7f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (307, 62, 28, N'ans1', N'', N'lego', N'bego', N'ego', N'nego', N'mego')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (308, 63, 21, N'ans1', N'', N'quest9f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (309, 63, 22, N'ans1', N'', N'quest1f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (310, 63, 27, N'ans1', N'', N'mmmm', N'mm', N'mmm', N'mmmm', N'mmmmm')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (311, 63, 16, N'ans1', N'', N'quest4f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (312, 63, 25, N'ans1', N'', N'kiki', N'kaka', N'aa', N'baba', N'lala')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (313, 64, 25, N'ans1', N'', N'kiki', N'kaka', N'aa', N'baba', N'lala')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (314, 64, 17, N'ans1', N'', N'quest5f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (315, 64, 28, N'ans1', N'', N'lego', N'bego', N'ego', N'nego', N'mego')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (316, 64, 14, N'ans1', N'', N'quest2f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (317, 64, 21, N'ans1', N'', N'quest9f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (318, 65, 14, N'ans1', N'', N'quest2f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (319, 65, 15, N'ans1', N'', N'quest3f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (320, 65, 22, N'ans1', N'', N'quest1f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (321, 65, 18, N'ans1', N'', N'quest6f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (322, 65, 25, N'ans1', N'', N'kiki', N'kaka', N'aa', N'baba', N'lala')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (323, 66, 25, N'ans1', N'', N'kiki', N'kaka', N'aa', N'baba', N'lala')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (324, 66, 26, N'ans1', N'', N'mega', N'baga', N'saga', N'naga', N'kaga')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (325, 66, 13, N'ans1', N'', N'quest1', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (326, 66, 46, N'ans1', N'', N'1234', N'2133', N'23142341', N'324234', N'1212')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (327, 66, 16, N'ans1', N'', N'quest4f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (328, 67, 19, N'ans1', N'', N'quest7f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (329, 67, 28, N'ans1', N'', N'lego', N'bego', N'ego', N'nego', N'mego')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (330, 67, 22, N'ans1', N'', N'quest1f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (331, 67, 20, N'ans1', N'', N'quest8f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (332, 67, 15, N'ans1', N'', N'quest3f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (333, 68, 28, N'ans1', N'', N'lego', N'bego', N'ego', N'nego', N'mego')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (334, 68, 27, N'ans1', N'', N'mmmm', N'mm', N'mmm', N'mmmm', N'mmmmm')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (335, 68, 20, N'ans1', N'', N'quest8f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (336, 68, 25, N'ans1', N'', N'kiki', N'kaka', N'aa', N'baba', N'lala')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (337, 68, 22, N'ans1', N'', N'quest1f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (338, 69, 17, N'ans1', N'', N'quest5f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (339, 69, 20, N'ans1', N'', N'quest8f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (340, 69, 22, N'ans1', N'', N'quest1f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (341, 69, 16, N'ans1', N'', N'quest4f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (342, 69, 15, N'ans1', N'', N'quest3f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (343, 70, 18, N'ans1', N'', N'quest6f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (344, 70, 19, N'ans1', N'', N'quest7f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (345, 70, 26, N'ans1', N'', N'mega', N'baga', N'saga', N'naga', N'kaga')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (346, 70, 27, N'ans1', N'', N'mmmm', N'mm', N'mmm', N'mmmm', N'mmmmm')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (347, 70, 13, N'ans1', N'', N'quest1', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (348, 71, 22, N'ans1', N'', N'quest1f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (349, 71, 17, N'ans1', N'', N'quest5f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (350, 71, 21, N'ans1', N'', N'quest9f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (351, 71, 20, N'ans1', N'', N'quest8f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (352, 71, 16, N'ans1', N'ans1', N'quest4f', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (353, 72, 6, N'ans1', N'ans1', N'quest4', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (354, 72, 4, N'ans1', N'', N'quest2', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (355, 72, 5, N'ans1', N'', N'quest3', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (356, 72, 31, N'ans1', N'', N'alumalaaa', N'me', N'mee', N'meee', N'meeee')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (357, 72, 9, N'ans1', N'', N'quest7', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (358, 73, 5, N'ans1', N'', N'quest3', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (359, 73, 4, N'ans1', N'', N'quest2', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (360, 73, 8, N'ans1', N'', N'quest6', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (361, 73, 10, N'ans1', N'', N'quest8', N'ans1', N'ans2', N'ans3', N'ans4')
INSERT [dbo].[tblTestDetail] ([testDetailID], [testID], [questID], [correctAns], [userAns], [questContent], [ans1], [ans2], [ans3], [ans4]) VALUES (362, 73, 6, N'ans1', N'', N'quest4', N'ans1', N'ans2', N'ans3', N'ans4')
SET IDENTITY_INSERT [dbo].[tblTestDetail] OFF
/****** Object:  Table [dbo].[tblHistory]    Script Date: 03/25/2021 07:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHistory](
	[historyID] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](100) NULL,
	[questionID] [int] NULL,
	[updateDate] [date] NULL,
	[updateContent] [nvarchar](500) NULL,
 CONSTRAINT [PK_tblHistorys] PRIMARY KEY CLUSTERED 
(
	[historyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblHistory] ON
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (1, N'admin', 37, CAST(0x1D420B00 AS Date), N'questID = 37 have been deleted')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (2, N'admin', 37, CAST(0x1D420B00 AS Date), N'questID = 37 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (3, N'admin', 45, CAST(0x1D420B00 AS Date), N'this questID = 45 have been created ')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (4, N'admin', 45, CAST(0x1D420B00 AS Date), N'questID = 45 have been updated: [subjectID from [PRN] to [PRN]] [questContent from [toi ten la hien] to [toi ten la hien]] [ans1 from [hien la ai] to [hien la ai]] [ans2 from [hien la toi] to [hien la toi]] [getAns3 from [thiet khong vay] to [thiet khong vay]] [getAns4 from [yes] to [yes]] ')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (5, N'admin', 37, CAST(0x1D420B00 AS Date), N'questID = 37 have been updated: [getCorrectAns from [ans1] to [ans2]] ')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (6, N'admin', 37, CAST(0x1D420B00 AS Date), N'questID = 37 have been updated: [getCorrectAns from [ans2] to [ans1]] ')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (7, N'admin', 37, CAST(0x1D420B00 AS Date), N'questID = 37 have been updated: [getCorrectAns from [ans1] to [ans2]] ')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (8, N'admin', 37, CAST(0x1D420B00 AS Date), N'questID = 37 have been updated: [getCorrectAns from [ans2] to [ans1]] ')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (9, N'admin', 37, CAST(0x1D420B00 AS Date), N'questID = 37 have been deleted')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (10, N'admin', 37, CAST(0x1D420B00 AS Date), N'questID = 37 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (11, N'admin', 37, CAST(0x1D420B00 AS Date), N'questID = 37 have been deleted')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (12, N'admin', 37, CAST(0x1D420B00 AS Date), N'questID = 37 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (13, N'admin', 37, CAST(0x1E420B00 AS Date), N'questID = 37 have been deleted')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (14, N'admin', 37, CAST(0x1E420B00 AS Date), N'questID = 37 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (15, N'admin', 13, CAST(0x1E420B00 AS Date), N'questID = 13 have been deleted')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (16, N'admin', 9, CAST(0x1E420B00 AS Date), N'questID = 9 have been deleted')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (17, N'admin', 35, CAST(0x1E420B00 AS Date), N'questID = 35 have been deleted')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (18, N'admin', 42, CAST(0x1E420B00 AS Date), N'questID = 42 have been deleted')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (19, N'admin', 32, CAST(0x1F420B00 AS Date), N'questID = 32 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (20, N'admin', 30, CAST(0x1F420B00 AS Date), N'questID = 30 have been deleted')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (21, N'admin', 39, CAST(0x1F420B00 AS Date), N'questID = 39 have been deleted')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (22, N'admin', 16, CAST(0x1F420B00 AS Date), N'questID = 16 have been deleted')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (23, N'admin', 16, CAST(0x1F420B00 AS Date), N'questID = 16 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (24, N'admin', 9, CAST(0x1F420B00 AS Date), N'questID = 9 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (25, N'admin', 46, CAST(0x1F420B00 AS Date), N'this questID = 46 have been created ')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (26, N'admin', 47, CAST(0x20420B00 AS Date), N'this questID = 47 have been created ')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (27, N'admin', 40, CAST(0x21420B00 AS Date), N'questID = 40 have been deleted')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (28, N'admin', 42, CAST(0x21420B00 AS Date), N'questID = 42 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (29, N'admin', 2, CAST(0x21420B00 AS Date), N'questID = 2 have been deleted')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (30, N'admin', 30, CAST(0x21420B00 AS Date), N'questID = 30 have been updated: [getCorrectAns from [ans1] to [ans2]] ')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (31, N'admin', 30, CAST(0x21420B00 AS Date), N'questID = 30 have been updated: [getCorrectAns from [ans2] to [ans1]] ')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (32, N'admin', 13, CAST(0x41420B00 AS Date), N'questID = 13 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (33, N'admin', 13, CAST(0x41420B00 AS Date), N'questID = 13 have been deleted')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (34, N'admin', 13, CAST(0x41420B00 AS Date), N'questID = 13 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (35, N'admin', 47, CAST(0x45420B00 AS Date), N'questID = 47 have been updated: [subjectID from [DBI] to [PRF]] ')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (36, N'admin', 46, CAST(0x45420B00 AS Date), N'questID = 46 have been updated: [subjectID from [DBI] to [PRF]] ')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (37, N'admin', 11, CAST(0x4A420B00 AS Date), N'questID = 11 have been deleted')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (38, N'admin', 12, CAST(0x4A420B00 AS Date), N'questID = 12 have been deleted')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (39, N'admin', 28, CAST(0x4D420B00 AS Date), N'questID = 28 have been deleted')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (40, N'admin', 41, CAST(0x4D420B00 AS Date), N'questID = 41 have been deleted')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (41, N'admin', 41, CAST(0x4D420B00 AS Date), N'questID = 41 have been restored')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (42, N'admin', 41, CAST(0x4D420B00 AS Date), N'questID = 41 have been deleted')
INSERT [dbo].[tblHistory] ([historyID], [email], [questionID], [updateDate], [updateContent]) VALUES (43, N'admin', 41, CAST(0x4D420B00 AS Date), N'questID = 41 have been restored')
SET IDENTITY_INSERT [dbo].[tblHistory] OFF
/****** Object:  ForeignKey [FK_tblUser_tblRole]    Script Date: 03/25/2021 07:31:32 ******/
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblRole] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRole] ([roleID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblRole]
GO
/****** Object:  ForeignKey [FK_tblQuestion_tblSubject]    Script Date: 03/25/2021 07:31:32 ******/
ALTER TABLE [dbo].[tblQuestion]  WITH CHECK ADD  CONSTRAINT [FK_tblQuestion_tblSubject] FOREIGN KEY([subjectID])
REFERENCES [dbo].[tblSubject] ([subjectID])
GO
ALTER TABLE [dbo].[tblQuestion] CHECK CONSTRAINT [FK_tblQuestion_tblSubject]
GO
/****** Object:  ForeignKey [FK_tblQuestion_tblUser]    Script Date: 03/25/2021 07:31:32 ******/
ALTER TABLE [dbo].[tblQuestion]  WITH CHECK ADD  CONSTRAINT [FK_tblQuestion_tblUser] FOREIGN KEY([email])
REFERENCES [dbo].[tblUser] ([email])
GO
ALTER TABLE [dbo].[tblQuestion] CHECK CONSTRAINT [FK_tblQuestion_tblUser]
GO
/****** Object:  ForeignKey [FK_tblTest_tblSubject]    Script Date: 03/25/2021 07:31:32 ******/
ALTER TABLE [dbo].[tblTest]  WITH CHECK ADD  CONSTRAINT [FK_tblTest_tblSubject] FOREIGN KEY([subjectID])
REFERENCES [dbo].[tblSubject] ([subjectID])
GO
ALTER TABLE [dbo].[tblTest] CHECK CONSTRAINT [FK_tblTest_tblSubject]
GO
/****** Object:  ForeignKey [FK_tblTest_tblUser]    Script Date: 03/25/2021 07:31:32 ******/
ALTER TABLE [dbo].[tblTest]  WITH CHECK ADD  CONSTRAINT [FK_tblTest_tblUser] FOREIGN KEY([email])
REFERENCES [dbo].[tblUser] ([email])
GO
ALTER TABLE [dbo].[tblTest] CHECK CONSTRAINT [FK_tblTest_tblUser]
GO
/****** Object:  ForeignKey [FK_tbltestDetail_tblQuestion]    Script Date: 03/25/2021 07:31:32 ******/
ALTER TABLE [dbo].[tblTestDetail]  WITH CHECK ADD  CONSTRAINT [FK_tbltestDetail_tblQuestion] FOREIGN KEY([questID])
REFERENCES [dbo].[tblQuestion] ([questID])
GO
ALTER TABLE [dbo].[tblTestDetail] CHECK CONSTRAINT [FK_tbltestDetail_tblQuestion]
GO
/****** Object:  ForeignKey [FK_tbltestDetail_tblTest]    Script Date: 03/25/2021 07:31:32 ******/
ALTER TABLE [dbo].[tblTestDetail]  WITH CHECK ADD  CONSTRAINT [FK_tbltestDetail_tblTest] FOREIGN KEY([testID])
REFERENCES [dbo].[tblTest] ([testID])
GO
ALTER TABLE [dbo].[tblTestDetail] CHECK CONSTRAINT [FK_tbltestDetail_tblTest]
GO
/****** Object:  ForeignKey [FK_tblHistory_tblQuestion]    Script Date: 03/25/2021 07:31:32 ******/
ALTER TABLE [dbo].[tblHistory]  WITH CHECK ADD  CONSTRAINT [FK_tblHistory_tblQuestion] FOREIGN KEY([questionID])
REFERENCES [dbo].[tblQuestion] ([questID])
GO
ALTER TABLE [dbo].[tblHistory] CHECK CONSTRAINT [FK_tblHistory_tblQuestion]
GO
/****** Object:  ForeignKey [FK_tblHistory_tblUser]    Script Date: 03/25/2021 07:31:32 ******/
ALTER TABLE [dbo].[tblHistory]  WITH CHECK ADD  CONSTRAINT [FK_tblHistory_tblUser] FOREIGN KEY([email])
REFERENCES [dbo].[tblUser] ([email])
GO
ALTER TABLE [dbo].[tblHistory] CHECK CONSTRAINT [FK_tblHistory_tblUser]
GO
