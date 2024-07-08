USE [master]
GO
/****** Object:  Database [YuukiFood]    Script Date: 7/3/2024 12:15:12 AM ******/
CREATE DATABASE [YuukiFood]
-- CONTAINMENT = NONE
-- ON  PRIMARY 
--( NAME = N'YuukiFood', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\YuukiFood.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
-- LOG ON 
--( NAME = N'YuukiFood_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\YuukiFood_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
-- WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [YuukiFood] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [YuukiFood].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [YuukiFood] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [YuukiFood] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [YuukiFood] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [YuukiFood] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [YuukiFood] SET ARITHABORT OFF 
GO
ALTER DATABASE [YuukiFood] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [YuukiFood] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [YuukiFood] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [YuukiFood] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [YuukiFood] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [YuukiFood] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [YuukiFood] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [YuukiFood] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [YuukiFood] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [YuukiFood] SET  ENABLE_BROKER 
GO
ALTER DATABASE [YuukiFood] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [YuukiFood] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [YuukiFood] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [YuukiFood] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [YuukiFood] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [YuukiFood] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [YuukiFood] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [YuukiFood] SET RECOVERY FULL 
GO
ALTER DATABASE [YuukiFood] SET  MULTI_USER 
GO
ALTER DATABASE [YuukiFood] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [YuukiFood] SET DB_CHAINING OFF 
GO
ALTER DATABASE [YuukiFood] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [YuukiFood] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [YuukiFood] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [YuukiFood] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'YuukiFood', N'ON'
GO
ALTER DATABASE [YuukiFood] SET QUERY_STORE = OFF
GO
USE [YuukiFood]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/3/2024 12:15:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/3/2024 12:15:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[order_date] [date] NULL,
	[total] [float] NULL,
	[notes] [nvarchar](200) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/3/2024 12:15:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[detail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[status_id] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/3/2024 12:15:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](50) NULL,
	[price] [float] NULL,
	[stock] [int] NULL,
	[category_id] [int] NULL,
	[img] [ntext] NULL,
	[description] [nvarchar](1000) NULL,
	[create_date] [date] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/3/2024 12:15:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/3/2024 12:15:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NULL,
	[gender] [bit] NULL,
	[phone] [nchar](11) NULL,
	[role_id] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (1, N'Starters')
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (2, N'Breakfast')
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (3, N'Lunch')
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (4, N'Dinner')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (1, N'bún bò huế', 30000, 100, 1, N'assets/img/menu/bún bò huế.png', N'Lorem, deren, trataro, filede, nerada', CAST(N'2022-01-06' AS Date))
GO
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (2, N'nem rán', 20000, 100, 1, N'assets/img/menu/nem rán.png', N'Lorem, deren, trataro, filede, nerada', CAST(N'2022-01-06' AS Date))
GO
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (3, N'mỳ quảng', 25000, 100, 1, N'assets/img/menu/mỳ quảng.png', N'Lorem, deren, trataro, filede, nerada', CAST(N'2022-01-06' AS Date))
GO
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (4, N'gỏi cuốn', 20000, 100, 2, N'assets/img/menu/gỏi cuốn.png', N'Lorem, deren, trataro, filede, nerada', CAST(N'2022-01-06' AS Date))
GO
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (5, N'cơm tấm', 30000, 100, 2, N'assets/img/menu/cơm tấm1.png', N'Lorem, deren, trataro, filede, nerada', CAST(N'2022-01-06' AS Date))
GO
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (6, N'chả giò', 25000, 100, 3, N'assets/img/menu/chả giò vn.png', N'Lorem, deren, trataro, filede, nerada', CAST(N'2022-01-06' AS Date))
GO
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (7, N'gà luộc', 40000, 100, 3, N'assets/img/menu/gà luộc.png', N'Lorem, deren, trataro, filede, nerada', CAST(N'2022-01-06' AS Date))
GO
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (8, N'phở bò', 30000, 100, 3, N'assets/img/menu/phở bò.png', N'Lorem, deren, trataro, filede, nerada', CAST(N'2022-01-06' AS Date))
GO
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (9, N'bún chả', 30000, 100, 1, N'assets/img/menu/bún chả.png', N'Lorem, deren, trataro, filede, nerada', CAST(N'2022-01-06' AS Date))
GO
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (10, N'hủ tiếu', 30000, 100, 1, N'assets/img/menu/hủ tiếu.png', N'Lorem, deren, trataro, filede, nerada', CAST(N'2022-01-06' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (2, N'admin')
GO
INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (1, N'user')
GO
INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (3, N'staff')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([user_id], [user_name], [email], [password], [address], [gender], [phone], [role_id]) VALUES (1, N'Yuuki', N'Yuukicoder@gmail.com', N'123456', N'hoalac', 0, N'9876543210 ', 2)
GO
INSERT [dbo].[Users] ([user_id], [user_name], [email], [password], [address], [gender], [phone], [role_id]) VALUES (2, N'Thuy', N'thuycute123@gmail.com', N'654321', N'hoalac', 0, N'12312132312', 1)
GO
INSERT [dbo].[Users] ([user_id], [user_name], [email], [password], [address], [gender], [phone], [role_id]) VALUES (3, N'Hai', N'hai123@gmail.com', N'123456', N'hoalac', 1, N'12312132312', 1)
GO
INSERT [dbo].[Users] ([user_id], [user_name], [email], [password], [address], [gender], [phone], [role_id]) VALUES (4, N'Tuan', N'tuan123@gmail.com', N'123456', N'hoalac', 1, N'12312132312', 1)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
USE [master]
GO
ALTER DATABASE [YuukiFood] SET  READ_WRITE 
GO
USE [YuukiFood]
GO

/****** Object:  Table [dbo].[Status]    Script Date: 7/3/2024 12:35:24 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Table [dbo].[Statistics]    Script Date: 7/3/2024 12:15:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statistics](
	[statistic_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_[Statistics] PRIMARY KEY CLUSTERED 
(
	[statistic_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

	   	   INSERT INTO [YuukiFood].[dbo].[Statistics] (order_id, product_id, price, quantity)
VALUES (1, 3, 25000, 1),
       (2, 4, 20000, 1),
	   (2, 3, 25000, 1),
	   (2, 1, 30000, 1);

CREATE TABLE [dbo].[Status](
	[status_id] [int] NULL,
	[status] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT INTO [YuukiFood].[dbo].[Order] (user_id, order_date, total, notes)
VALUES (3, '2023-06-15', 25000, null),
       (4, '2023-06-20', 75000, null);

	   	   INSERT INTO [YuukiFood].[dbo].[OrderDetail] (order_id, product_id, price, quantity, status_id)
VALUES (1, 3, 25000, 1,2),
       (2, 4, 20000, 1,2),
	   (2, 3, 25000, 1,2),
	   (2, 1, 30000, 1,2);

	   INSERT INTO [YuukiFood].[dbo].[Status] (status_id, status)
VALUES (1, 'Preparing'),
       (2, 'Done'),
	   (3, 'Cancelled');
UPDATE [YuukiFood].[dbo].[Product]
SET [description] = CASE
 WHEN [product_id] = 1 THEN 'Hue beef noodle soup is one of the specialties of Thua Thien Hue province, although this noodle dish is popular in all three regions of Vietnam and among overseas Vietnamese. In Thua Thien Hue, this dish is simply called "beef noodle soup" or more specifically "beef noodle soup".'
 WHEN [product_id] = 2 THEN 'Fried spring rolls or spring rolls, ram rolls or spring rolls is the name of a famous Vietnamese dish, they are also called spring rolls in common in the North. In the Central region, this dish is often called ram, and in the South, it is called spring rolls.'
  WHEN [product_id] = 3 THEN 'Quang noodles (ie Quang noodles) is a dish of origin and also a specialty of Quang Nam province. Mi Quang is a type of noodle, usually made from finely ground rice flour with water from gardenia seeds and eggs to make it yellow and coated into thin layers of cake.'
  WHEN [product_id] = 4 THEN 'Goi cuon, also known as spring rolls, is a quite popular dish in Vietnam. Goi cuon originates from Southern Vietnam and is called goi cuon - made from ingredients including lettuce, basil, perilla, dried shrimp, herbs, boiled meat, fresh shrimp... all rolled in rice paper crust.'
  WHEN [product_id] = 5 THEN 'Broken rice, or Saigon broken rice, is a Vietnamese dish whose main ingredients are broken rice. Although there are many names in different regions, the ingredients and preparation method of the above dish are almost the same.'
 WHEN [product_id] = 6 THEN 'Fried spring rolls or spring rolls, ram rolls or spring rolls is the name of a famous Vietnamese dish, they are also called spring rolls in common in the North. In the Central region, this dish is often called ram, and in the South, it is called spring rolls.'
  WHEN [product_id] = 7 THEN 'Boiled chicken is a popular dish made from chicken by the boiling method, the chicken is placed in a pot and completely cooked in hot water or chicken broth.'
 WHEN [product_id] = 8 THEN 'Pho is a traditional Vietnamese dish originating from Nam Dinh. Pho is considered one of the typical dishes of Vietnamese cuisine. The main ingredients of pho are rice noodles and broth along with thinly sliced ​​beef or chicken. The most suitable beef for cooking pho is meat and bones from our cattle breeds.'
  WHEN [product_id] = 9 THEN 'Bun cha is a Vietnamese dish, including vermicelli noodles, pork patties grilled over charcoal and a bowl of sweet and sour, spicy and salty fish sauce. The dish originates from Northern Vietnam and is the most enduring gift of Hanoi, so it can be considered one of the typical specialties of Hanoi cuisine.'
 WHEN [product_id] = 10 THEN 'Hú tieu, also written as noodle soup, is a dish using fibrous rice products of the Chaozhou and Minnan people, with many similarities to the sa ha chalk of the Guangdong and Minnan people. The dish of the Hakka people was introduced to many regions inside and outside China, becoming a common dish in the South China region...'
 END
WHERE [product_id] IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
