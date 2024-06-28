--Create database YuukiFood
--Use YuukiFood
Create Table Users(
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/23/2024 3:09:18 PM ******/
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
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
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
INSERT INTO dbo.Users(user_name,email,password,address,gender,phone,role_id) VALUES('Yuuki','Yuukicoder@gmail.com',123456,'hoalac',0,9876543210 ,2)
INSERT INTO dbo.Users(user_name,email,password,address,gender,phone,role_id) VALUES('Thuy','thuycute123@gmail.com',654321,'hoalac',0,12312132312 ,1)
INSERT INTO dbo.Category(category_name) VALUES('Starters')
INSERT INTO dbo.Category(category_name) VALUES('Breakfast')
INSERT INTO dbo.Category(category_name) VALUES('Lunch')
INSERT INTO dbo.Category(category_name) VALUES('Dinner')
INSERT INTO dbo.Product(product_name,price,stock,category_id,img,description,create_date) VALUES('Magnam Tiste',5.95,100,1,'assets/img/menu/menu-item-1.png',' Lorem, deren, trataro, filede, nerada','2022-01-06')
INSERT INTO dbo.Product(product_name,price,stock,category_id,img,description,create_date) VALUES('Aut Luia',14.95,100,1,'assets/img/menu/menu-item-2.png',' Lorem, deren, trataro, filede, nerada','2022-01-06')
INSERT INTO dbo.Product(product_name,price,stock,category_id,img,description,create_date) VALUES('Est Eligendi',8.95,100,1,'assets/img/menu/menu-item-3.png',' Lorem, deren, trataro, filede, nerada','2022-01-06')
INSERT INTO dbo.Product(product_name,price,stock,category_id,img,description,create_date) VALUES('Eos Luibusdam',12.95,100,2,'assets/img/menu/menu-item-4.png',' Lorem, deren, trataro, filede, nerada','2022-01-06')

INSERT INTO dbo.Product(product_name,price,stock,category_id,img,description,create_date) VALUES('Yuuki coder',12.95,100,2,'assets/img/menu/menu-item-5.png',' Lorem, deren, trataro, filede, nerada','2022-01-06')


INSERT INTO dbo.Product(product_name,price,stock,category_id,img,description,create_date) VALUES('NuocCam',5.95,100,3,'assets/img/menu/menu-item-1.png',' Lorem, deren, trataro, filede, nerada','2022-01-06')
INSERT INTO dbo.Product(product_name,price,stock,category_id,img,description,create_date) VALUES('Pizza',14.95,100,3,'assets/img/menu/menu-item-2.png',' Lorem, deren, trataro, filede, nerada','2022-01-06')
INSERT INTO dbo.Product(product_name,price,stock,category_id,img,description,create_date) VALUES('MatchaDaXay',8.95,100,3,'assets/img/menu/menu-item-3.png',' Lorem, deren, trataro, filede, nerada','2022-01-06')
INSERT INTO dbo.Product(product_name,price,stock,category_id,img,description,create_date) VALUES('BaoBinh',15.2,100,1,'assets/img/menu/menu-item-4.png',' Lorem, deren, trataro, filede, nerada','2022-01-06')

INSERT INTO dbo.Product(product_name,price,stock,category_id,img,description,create_date) VALUES('Yuuki coder',16.1,100,1,'assets/img/menu/menu-item-5.png',' Lorem, deren, trataro, filede, nerada','2022-01-06')