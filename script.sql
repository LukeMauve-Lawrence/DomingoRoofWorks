USE [ReportServer$SQLEXPRESS]
GO
/****** Object:  Table [dbo].[ADDRESS_INFO]    Script Date: 2020/07/12 4:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ADDRESS_INFO](
	[Address_ID] [char](5) NOT NULL,
	[Street_Address] [varchar](255) NOT NULL,
	[Suburb] [varchar](255) NOT NULL,
	[City] [varchar](255) NOT NULL,
	[Postal_Code] [varchar](10) NOT NULL,
 CONSTRAINT [PK_ADDRESS_INFO] PRIMARY KEY CLUSTERED 
(
	[Address_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 2020/07/12 4:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[Customer_ID] [char](5) NOT NULL,
	[First_Name] [varchar](255) NOT NULL,
	[Last_Name] [varchar](255) NOT NULL,
	[Address_ID] [char](5) NULL,
	[Email] [varchar](255) NOT NULL,
	[Phone_Number] [char](10) NOT NULL,
 CONSTRAINT [PK_CUSTOMER] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EMPLOYEE]    Script Date: 2020/07/12 4:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMPLOYEE](
	[Employee_No] [char](6) NOT NULL,
	[First_Name] [varchar](255) NOT NULL,
	[Last_Name] [varchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Phone_Number] [char](10) NOT NULL,
	[Address_ID] [char](5) NULL,
 CONSTRAINT [PK_EMPLOYEE] PRIMARY KEY CLUSTERED 
(
	[Employee_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EQUIPMENT]    Script Date: 2020/07/12 4:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EQUIPMENT](
	[Equipment_ID] [char](5) NOT NULL,
	[Equipment_Name] [varchar](255) NOT NULL,
	[Equipment_Description] [varchar](255) NOT NULL,
	[Equipment_Price] [decimal](9, 2) NOT NULL,
	[Supplier_ID] [char](5) NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[Equipment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EQUIPMENT_USED]    Script Date: 2020/07/12 4:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EQUIPMENT_USED](
	[Equipment_ID] [char](5) NOT NULL,
	[Job_Card_No] [char](5) NOT NULL,
	[Amount_Used] [int] NOT NULL,
 CONSTRAINT [PK_EQUIPMENT_USED] PRIMARY KEY CLUSTERED 
(
	[Equipment_ID] ASC,
	[Job_Card_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[INVOICE]    Script Date: 2020/07/12 4:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[INVOICE](
	[Invoice_ID] [char](5) NOT NULL,
	[Job_Card_No] [char](5) NULL,
	[Customer_ID] [char](5) NULL,
	[Price] [decimal](9, 2) NOT NULL,
 CONSTRAINT [PK_INVOICE] PRIMARY KEY CLUSTERED 
(
	[Invoice_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JOB_TYPE]    Script Date: 2020/07/12 4:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JOB_TYPE](
	[Job_Type_ID] [char](5) NOT NULL,
	[Job_Type] [varchar](255) NOT NULL,
	[Daily_Rate] [decimal](9, 2) NOT NULL,
 CONSTRAINT [PK_JOB_TYPE] PRIMARY KEY CLUSTERED 
(
	[Job_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JOBCARD]    Script Date: 2020/07/12 4:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JOBCARD](
	[Job_Card_No] [char](5) NOT NULL,
	[No_of_Days] [int] NOT NULL,
	[Orders_ID] [char](5) NULL,
 CONSTRAINT [PK_JOBCARD] PRIMARY KEY CLUSTERED 
(
	[Job_Card_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JOBCARD_EMPLOYEE]    Script Date: 2020/07/12 4:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JOBCARD_EMPLOYEE](
	[Job_Card_No] [char](5) NOT NULL,
	[Employee_No] [char](6) NOT NULL,
 CONSTRAINT [PK_JOBCARD_EMPLOYEE] PRIMARY KEY CLUSTERED 
(
	[Job_Card_No] ASC,
	[Employee_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MATERIAL]    Script Date: 2020/07/12 4:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MATERIAL](
	[Material_ID] [char](5) NOT NULL,
	[Material_Name] [varchar](255) NOT NULL,
	[Material_Description] [varchar](255) NOT NULL,
	[Material_Price] [decimal](9, 2) NOT NULL,
	[Supplier_ID] [char](5) NULL,
 CONSTRAINT [PK_MATERIAL] PRIMARY KEY CLUSTERED 
(
	[Material_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MATERIALS_USED]    Script Date: 2020/07/12 4:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MATERIALS_USED](
	[Material_ID] [char](5) NOT NULL,
	[Job_Card_No] [char](5) NOT NULL,
	[Amount_Used] [int] NOT NULL,
 CONSTRAINT [PK_MATERIALS_USED] PRIMARY KEY CLUSTERED 
(
	[Material_ID] ASC,
	[Job_Card_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ORDERS]    Script Date: 2020/07/12 4:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ORDERS](
	[Orders_ID] [char](5) NOT NULL,
	[Quotation_No] [char](5) NULL,
	[Job_Type_ID] [char](5) NULL,
 CONSTRAINT [PK_ORDERS] PRIMARY KEY CLUSTERED 
(
	[Orders_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QUOTATION]    Script Date: 2020/07/12 4:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QUOTATION](
	[Quotation_No] [char](5) NOT NULL,
	[Customer_ID] [char](5) NULL,
	[Job_Type_ID] [char](5) NULL,
	[Estimated_Price] [int] NOT NULL,
	[Estimated_No_of_Days] [int] NOT NULL,
 CONSTRAINT [PK_QUOTATION] PRIMARY KEY CLUSTERED 
(
	[Quotation_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SUPPLIER]    Script Date: 2020/07/12 4:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SUPPLIER](
	[Supplier_ID] [char](5) NOT NULL,
	[Supplier_Name] [varchar](255) NOT NULL,
	[Address_ID] [char](5) NULL,
	[Email] [varchar](255) NOT NULL,
	[Phone_Number] [char](10) NOT NULL,
 CONSTRAINT [PK_SUPPLIER] PRIMARY KEY CLUSTERED 
(
	[Supplier_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ADDRESS_INFO] ([Address_ID], [Street_Address], [Suburb], [City], [Postal_Code]) VALUES (N'A001 ', N'3 Leos Place', N'457 Church Str', N'PRETORIA', N'0002')
INSERT [dbo].[ADDRESS_INFO] ([Address_ID], [Street_Address], [Suburb], [City], [Postal_Code]) VALUES (N'A002 ', N'408 Oubos', N'368 Prinsloo Street', N'PRETORIA', N'0001')
INSERT [dbo].[ADDRESS_INFO] ([Address_ID], [Street_Address], [Suburb], [City], [Postal_Code]) VALUES (N'A003 ', N'206 Albertros', N'269 Stead Avenue', N'PRETORIA', N'0186')
INSERT [dbo].[ADDRESS_INFO] ([Address_ID], [Street_Address], [Suburb], [City], [Postal_Code]) VALUES (N'A004 ', N'A201 Ocerton', N'269 Debouvlrde Str', N'PRETORIA', N'0002')
INSERT [dbo].[ADDRESS_INFO] ([Address_ID], [Street_Address], [Suburb], [City], [Postal_Code]) VALUES (N'A005 ', N'11 Luttig Court 289', N'MALTZAN Str', N'PRETORIA', N'0001')
INSERT [dbo].[ADDRESS_INFO] ([Address_ID], [Street_Address], [Suburb], [City], [Postal_Code]) VALUES (N'A006 ', N'876 Silverstone', N'1182 CEBINIA Str', N'PRETORIA', N'0082')
INSERT [dbo].[ADDRESS_INFO] ([Address_ID], [Street_Address], [Suburb], [City], [Postal_Code]) VALUES (N'A007 ', N'503 Hamilton Gardens', N'337 Visagie Str', N'PRETORIA', N'0001')
INSERT [dbo].[ADDRESS_INFO] ([Address_ID], [Street_Address], [Suburb], [City], [Postal_Code]) VALUES (N'A008 ', N'10 Silville', N'614 Jasmyn Str', N'PRETORIA', N'0184')
INSERT [dbo].[ADDRESS_INFO] ([Address_ID], [Street_Address], [Suburb], [City], [Postal_Code]) VALUES (N'A009 ', N'34 Northberg', N'307 FEORA East', N'PRETORIA-WEST', N'0183')
INSERT [dbo].[ADDRESS_INFO] ([Address_ID], [Street_Address], [Suburb], [City], [Postal_Code]) VALUES (N'A010 ', N'701 Monticchico Flat', N'251 Jacob Mare Str', N'PRETORIA', N'0002')
INSERT [dbo].[ADDRESS_INFO] ([Address_ID], [Street_Address], [Suburb], [City], [Postal_Code]) VALUES (N'A011 ', N'7 Fish Eagle Park', N'Noordhoek', N'CAPE TOWN', N'7975')
INSERT [dbo].[ADDRESS_INFO] ([Address_ID], [Street_Address], [Suburb], [City], [Postal_Code]) VALUES (N'A012 ', N'13 Yellow Wood Road', N'Rondebosch', N'CAPE TOWN', N'7975')
INSERT [dbo].[ADDRESS_INFO] ([Address_ID], [Street_Address], [Suburb], [City], [Postal_Code]) VALUES (N'A013 ', N'76 Whale Road', N'Sandton', N'JOHANNESBURG', N'8800')
INSERT [dbo].[ADDRESS_INFO] ([Address_ID], [Street_Address], [Suburb], [City], [Postal_Code]) VALUES (N'A014 ', N'83 Panorama Rd', N'Rooihuiskraal', N'PRETORIA', N'0514')
INSERT [dbo].[ADDRESS_INFO] ([Address_ID], [Street_Address], [Suburb], [City], [Postal_Code]) VALUES (N'A015 ', N'8 Kalksteen Ave', N'Zwartkop', N'PRETORIA', N'0523')
INSERT [dbo].[ADDRESS_INFO] ([Address_ID], [Street_Address], [Suburb], [City], [Postal_Code]) VALUES (N'A016 ', N'2 Aspen Cres', N'Centurion Central', N'PRETORIA', N'0651')
INSERT [dbo].[ADDRESS_INFO] ([Address_ID], [Street_Address], [Suburb], [City], [Postal_Code]) VALUES (N'A017 ', N'7 Johannes Dr', N'Hennopspark', N'PRETORIA', N'0221')
INSERT [dbo].[ADDRESS_INFO] ([Address_ID], [Street_Address], [Suburb], [City], [Postal_Code]) VALUES (N'A018 ', N'99 Fontein Rd', N'Rooihuiskraal', N'PRETORIA', N'0124')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [First_Name], [Last_Name], [Address_ID], [Email], [Phone_Number]) VALUES (N'C001 ', N'Tendai', N'Ndoro', N'A001 ', N'tendaindoro@gmail.com', N'0835556666')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [First_Name], [Last_Name], [Address_ID], [Email], [Phone_Number]) VALUES (N'C002 ', N'Donald', N'Puttingh', N'A002 ', N'donaldputtingh@gmail.com', N'0724352526')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [First_Name], [Last_Name], [Address_ID], [Email], [Phone_Number]) VALUES (N'C003 ', N'Tracy', N'Samson', N'A003 ', N'tracysamson@gmail.com', N'0627778888')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [First_Name], [Last_Name], [Address_ID], [Email], [Phone_Number]) VALUES (N'C004 ', N'Jacob', N'Smith', N'A004 ', N'jacobsmith85@yahoo.com', N'0835656544')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [First_Name], [Last_Name], [Address_ID], [Email], [Phone_Number]) VALUES (N'C005 ', N'Thato', N'Molepo', N'A005 ', N'thatomolepo@yahoo.com', N'0728138813')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [First_Name], [Last_Name], [Address_ID], [Email], [Phone_Number]) VALUES (N'C006 ', N'Dakalo', N'Mudau', N'A006 ', N'dakalomudau@gmail.com', N'0641415162')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [First_Name], [Last_Name], [Address_ID], [Email], [Phone_Number]) VALUES (N'C007 ', N'Sfiso', N'Myeni', N'A007 ', N'sfisomyeni@gmail.com', N'0723252345')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [First_Name], [Last_Name], [Address_ID], [Email], [Phone_Number]) VALUES (N'C008 ', N'Ricardo', N'Keyl', N'A008 ', N'ricardokeyl@yahoo.com', N'0631235344')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [First_Name], [Last_Name], [Address_ID], [Email], [Phone_Number]) VALUES (N'C009 ', N'Smallboy', N'Mtshali', N'A009 ', N'smallboymtshali@gmail.com', N'0541521542')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [First_Name], [Last_Name], [Address_ID], [Email], [Phone_Number]) VALUES (N'C010 ', N'Wilson', N'Jansen', N'A010 ', N'wilsonjansen@gmail.com', N'0821781187')
INSERT [dbo].[EMPLOYEE] ([Employee_No], [First_Name], [Last_Name], [Email], [Phone_Number], [Address_ID]) VALUES (N'EMP010', N'John', N'Hendriks', N'johnhen@gmail.com', N'0631532432', N'A016 ')
INSERT [dbo].[EMPLOYEE] ([Employee_No], [First_Name], [Last_Name], [Email], [Phone_Number], [Address_ID]) VALUES (N'EMP100', N'Albert', N'Malose', N'am@gmail.com', N'0834525435', N'A014 ')
INSERT [dbo].[EMPLOYEE] ([Employee_No], [First_Name], [Last_Name], [Email], [Phone_Number], [Address_ID]) VALUES (N'EMP681', N'Stanley', N'Jacobs', N'stantheman@gmail.com', N'0511325340', N'A018 ')
INSERT [dbo].[EMPLOYEE] ([Employee_No], [First_Name], [Last_Name], [Email], [Phone_Number], [Address_ID]) VALUES (N'EMP771', N'Smallboy', N'Modipa', N'smallboy95@yahoo.com', N'0741234632', N'A017 ')
INSERT [dbo].[EMPLOYEE] ([Employee_No], [First_Name], [Last_Name], [Email], [Phone_Number], [Address_ID]) VALUES (N'EMP920', N'Chris', N'Byne', N'cb@yahoo.com', N'0721523346', N'A015 ')
INSERT [dbo].[EQUIPMENT] ([Equipment_ID], [Equipment_Name], [Equipment_Description], [Equipment_Price], [Supplier_ID]) VALUES (N'EQ001', N'Drill', N'Tool used for making round holes or driving fasteners', CAST(1999.00 AS Decimal(9, 2)), N'S003 ')
INSERT [dbo].[EQUIPMENT] ([Equipment_ID], [Equipment_Name], [Equipment_Description], [Equipment_Price], [Supplier_ID]) VALUES (N'EQ002', N'Hammer', N'Tool swung to deliver impact to a small area', CAST(69.99 AS Decimal(9, 2)), N'S001 ')
INSERT [dbo].[EQUIPMENT] ([Equipment_ID], [Equipment_Name], [Equipment_Description], [Equipment_Price], [Supplier_ID]) VALUES (N'EQ003', N'Screwdriver', N'Tool used for screwing and unscrewing screws', CAST(32.40 AS Decimal(9, 2)), N'S002 ')
INSERT [dbo].[EQUIPMENT] ([Equipment_ID], [Equipment_Name], [Equipment_Description], [Equipment_Price], [Supplier_ID]) VALUES (N'EQ004', N'Paintbrush', N'Tool used to paint objects', CAST(49.99 AS Decimal(9, 2)), N'S001 ')
INSERT [dbo].[EQUIPMENT_USED] ([Equipment_ID], [Job_Card_No], [Amount_Used]) VALUES (N'EQ001', N'10102', 1)
INSERT [dbo].[EQUIPMENT_USED] ([Equipment_ID], [Job_Card_No], [Amount_Used]) VALUES (N'EQ001', N'10471', 1)
INSERT [dbo].[EQUIPMENT_USED] ([Equipment_ID], [Job_Card_No], [Amount_Used]) VALUES (N'EQ001', N'10478', 2)
INSERT [dbo].[EQUIPMENT_USED] ([Equipment_ID], [Job_Card_No], [Amount_Used]) VALUES (N'EQ001', N'11000', 1)
INSERT [dbo].[EQUIPMENT_USED] ([Equipment_ID], [Job_Card_No], [Amount_Used]) VALUES (N'EQ001', N'11258', 1)
INSERT [dbo].[EQUIPMENT_USED] ([Equipment_ID], [Job_Card_No], [Amount_Used]) VALUES (N'EQ001', N'12058', 1)
INSERT [dbo].[EQUIPMENT_USED] ([Equipment_ID], [Job_Card_No], [Amount_Used]) VALUES (N'EQ001', N'13521', 1)
INSERT [dbo].[EQUIPMENT_USED] ([Equipment_ID], [Job_Card_No], [Amount_Used]) VALUES (N'EQ002', N'10211', 3)
INSERT [dbo].[EQUIPMENT_USED] ([Equipment_ID], [Job_Card_No], [Amount_Used]) VALUES (N'EQ002', N'10478', 4)
INSERT [dbo].[EQUIPMENT_USED] ([Equipment_ID], [Job_Card_No], [Amount_Used]) VALUES (N'EQ002', N'11000', 3)
INSERT [dbo].[EQUIPMENT_USED] ([Equipment_ID], [Job_Card_No], [Amount_Used]) VALUES (N'EQ002', N'11258', 5)
INSERT [dbo].[EQUIPMENT_USED] ([Equipment_ID], [Job_Card_No], [Amount_Used]) VALUES (N'EQ002', N'13697', 2)
INSERT [dbo].[EQUIPMENT_USED] ([Equipment_ID], [Job_Card_No], [Amount_Used]) VALUES (N'EQ002', N'14253', 3)
INSERT [dbo].[EQUIPMENT_USED] ([Equipment_ID], [Job_Card_No], [Amount_Used]) VALUES (N'EQ003', N'10478', 7)
INSERT [dbo].[EQUIPMENT_USED] ([Equipment_ID], [Job_Card_No], [Amount_Used]) VALUES (N'EQ003', N'11000', 3)
INSERT [dbo].[EQUIPMENT_USED] ([Equipment_ID], [Job_Card_No], [Amount_Used]) VALUES (N'EQ003', N'13697', 1)
INSERT [dbo].[INVOICE] ([Invoice_ID], [Job_Card_No], [Customer_ID], [Price]) VALUES (N'IN001', N'11000', N'C001 ', CAST(8400.00 AS Decimal(9, 2)))
INSERT [dbo].[INVOICE] ([Invoice_ID], [Job_Card_No], [Customer_ID], [Price]) VALUES (N'IN002', N'10478', N'C002 ', CAST(2160.00 AS Decimal(9, 2)))
INSERT [dbo].[INVOICE] ([Invoice_ID], [Job_Card_No], [Customer_ID], [Price]) VALUES (N'IN003', N'14253', N'C003 ', CAST(1800.00 AS Decimal(9, 2)))
INSERT [dbo].[INVOICE] ([Invoice_ID], [Job_Card_No], [Customer_ID], [Price]) VALUES (N'IN004', N'11258', N'C004 ', CAST(9600.00 AS Decimal(9, 2)))
INSERT [dbo].[INVOICE] ([Invoice_ID], [Job_Card_No], [Customer_ID], [Price]) VALUES (N'IN005', N'12058', N'C005 ', CAST(3240.00 AS Decimal(9, 2)))
INSERT [dbo].[INVOICE] ([Invoice_ID], [Job_Card_No], [Customer_ID], [Price]) VALUES (N'IN006', N'13697', N'C006 ', CAST(8400.00 AS Decimal(9, 2)))
INSERT [dbo].[INVOICE] ([Invoice_ID], [Job_Card_No], [Customer_ID], [Price]) VALUES (N'IN007', N'10211', N'C007 ', CAST(8400.00 AS Decimal(9, 2)))
INSERT [dbo].[INVOICE] ([Invoice_ID], [Job_Card_No], [Customer_ID], [Price]) VALUES (N'IN008', N'10471', N'C008 ', CAST(2160.00 AS Decimal(9, 2)))
INSERT [dbo].[INVOICE] ([Invoice_ID], [Job_Card_No], [Customer_ID], [Price]) VALUES (N'IN009', N'13521', N'C009 ', CAST(3240.00 AS Decimal(9, 2)))
INSERT [dbo].[INVOICE] ([Invoice_ID], [Job_Card_No], [Customer_ID], [Price]) VALUES (N'IN010', N'10102', N'C010 ', CAST(1800.00 AS Decimal(9, 2)))
INSERT [dbo].[JOB_TYPE] ([Job_Type_ID], [Job_Type], [Daily_Rate]) VALUES (N'JT001', N'Full Conversion', CAST(1440.00 AS Decimal(9, 2)))
INSERT [dbo].[JOB_TYPE] ([Job_Type_ID], [Job_Type], [Daily_Rate]) VALUES (N'JT002', N'Semi Conversion', CAST(1080.00 AS Decimal(9, 2)))
INSERT [dbo].[JOB_TYPE] ([Job_Type_ID], [Job_Type], [Daily_Rate]) VALUES (N'JT003', N'Floor Boarding', CAST(900.00 AS Decimal(9, 2)))
INSERT [dbo].[JOBCARD] ([Job_Card_No], [No_of_Days], [Orders_ID]) VALUES (N'10102', 2, N'OD010')
INSERT [dbo].[JOBCARD] ([Job_Card_No], [No_of_Days], [Orders_ID]) VALUES (N'10211', 7, N'OD007')
INSERT [dbo].[JOBCARD] ([Job_Card_No], [No_of_Days], [Orders_ID]) VALUES (N'10471', 2, N'OD008')
INSERT [dbo].[JOBCARD] ([Job_Card_No], [No_of_Days], [Orders_ID]) VALUES (N'10478', 2, N'OD002')
INSERT [dbo].[JOBCARD] ([Job_Card_No], [No_of_Days], [Orders_ID]) VALUES (N'11000', 7, N'OD001')
INSERT [dbo].[JOBCARD] ([Job_Card_No], [No_of_Days], [Orders_ID]) VALUES (N'11258', 8, N'OD004')
INSERT [dbo].[JOBCARD] ([Job_Card_No], [No_of_Days], [Orders_ID]) VALUES (N'12058', 3, N'OD005')
INSERT [dbo].[JOBCARD] ([Job_Card_No], [No_of_Days], [Orders_ID]) VALUES (N'13521', 3, N'OD009')
INSERT [dbo].[JOBCARD] ([Job_Card_No], [No_of_Days], [Orders_ID]) VALUES (N'13697', 7, N'OD006')
INSERT [dbo].[JOBCARD] ([Job_Card_No], [No_of_Days], [Orders_ID]) VALUES (N'14253', 2, N'OD003')
INSERT [dbo].[JOBCARD_EMPLOYEE] ([Job_Card_No], [Employee_No]) VALUES (N'10478', N'EMP920')
INSERT [dbo].[JOBCARD_EMPLOYEE] ([Job_Card_No], [Employee_No]) VALUES (N'11000', N'EMP010')
INSERT [dbo].[JOBCARD_EMPLOYEE] ([Job_Card_No], [Employee_No]) VALUES (N'11000', N'EMP100')
INSERT [dbo].[JOBCARD_EMPLOYEE] ([Job_Card_No], [Employee_No]) VALUES (N'11000', N'EMP920')
INSERT [dbo].[JOBCARD_EMPLOYEE] ([Job_Card_No], [Employee_No]) VALUES (N'11258', N'EMP010')
INSERT [dbo].[JOBCARD_EMPLOYEE] ([Job_Card_No], [Employee_No]) VALUES (N'11258', N'EMP681')
INSERT [dbo].[JOBCARD_EMPLOYEE] ([Job_Card_No], [Employee_No]) VALUES (N'11258', N'EMP771')
INSERT [dbo].[JOBCARD_EMPLOYEE] ([Job_Card_No], [Employee_No]) VALUES (N'12058', N'EMP681')
INSERT [dbo].[JOBCARD_EMPLOYEE] ([Job_Card_No], [Employee_No]) VALUES (N'14253', N'EMP771')
INSERT [dbo].[MATERIAL] ([Material_ID], [Material_Name], [Material_Description], [Material_Price], [Supplier_ID]) VALUES (N'M001 ', N'Standard floor boards', N'Wooden panels for flooring solutions', CAST(159.90 AS Decimal(9, 2)), N'S002 ')
INSERT [dbo].[MATERIAL] ([Material_ID], [Material_Name], [Material_Description], [Material_Price], [Supplier_ID]) VALUES (N'M002 ', N'Power points', N'Electrical outlets to give access to power', CAST(49.99 AS Decimal(9, 2)), N'S001 ')
INSERT [dbo].[MATERIAL] ([Material_ID], [Material_Name], [Material_Description], [Material_Price], [Supplier_ID]) VALUES (N'M003 ', N'Metres of standard electrical wiring', N'Copper wiring used to transport power', CAST(25.00 AS Decimal(9, 2)), N'S003 ')
INSERT [dbo].[MATERIAL] ([Material_ID], [Material_Name], [Material_Description], [Material_Price], [Supplier_ID]) VALUES (N'M004 ', N'Standard stairs pack', N'Pack used to create staircase', CAST(399.90 AS Decimal(9, 2)), N'S002 ')
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M001 ', N'10102', 70)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M001 ', N'10211', 100)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M001 ', N'10471', 40)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M001 ', N'10478', 50)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M001 ', N'11000', 90)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M001 ', N'11258', 80)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M001 ', N'12058', 60)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M001 ', N'13521', 65)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M001 ', N'13697', 80)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M001 ', N'14253', 40)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M002 ', N'10211', 5)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M002 ', N'10471', 1)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M002 ', N'10478', 1)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M002 ', N'11000', 3)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M002 ', N'11258', 3)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M002 ', N'12058', 2)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M002 ', N'13521', 3)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M002 ', N'13697', 4)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M003 ', N'10211', 30)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M003 ', N'10471', 8)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M003 ', N'10478', 10)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M003 ', N'11000', 20)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M003 ', N'11258', 20)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M003 ', N'12058', 15)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M003 ', N'13521', 18)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M003 ', N'13697', 40)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M004 ', N'10211', 1)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M004 ', N'11000', 1)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M004 ', N'11258', 1)
INSERT [dbo].[MATERIALS_USED] ([Material_ID], [Job_Card_No], [Amount_Used]) VALUES (N'M004 ', N'13697', 1)
INSERT [dbo].[ORDERS] ([Orders_ID], [Quotation_No], [Job_Type_ID]) VALUES (N'OD001', N'Q001 ', N'JT001')
INSERT [dbo].[ORDERS] ([Orders_ID], [Quotation_No], [Job_Type_ID]) VALUES (N'OD002', N'Q002 ', N'JT002')
INSERT [dbo].[ORDERS] ([Orders_ID], [Quotation_No], [Job_Type_ID]) VALUES (N'OD003', N'Q003 ', N'JT003')
INSERT [dbo].[ORDERS] ([Orders_ID], [Quotation_No], [Job_Type_ID]) VALUES (N'OD004', N'Q004 ', N'JT001')
INSERT [dbo].[ORDERS] ([Orders_ID], [Quotation_No], [Job_Type_ID]) VALUES (N'OD005', N'Q005 ', N'JT002')
INSERT [dbo].[ORDERS] ([Orders_ID], [Quotation_No], [Job_Type_ID]) VALUES (N'OD006', N'Q006 ', N'JT001')
INSERT [dbo].[ORDERS] ([Orders_ID], [Quotation_No], [Job_Type_ID]) VALUES (N'OD007', N'Q007 ', N'JT001')
INSERT [dbo].[ORDERS] ([Orders_ID], [Quotation_No], [Job_Type_ID]) VALUES (N'OD008', N'Q008 ', N'JT002')
INSERT [dbo].[ORDERS] ([Orders_ID], [Quotation_No], [Job_Type_ID]) VALUES (N'OD009', N'Q009 ', N'JT002')
INSERT [dbo].[ORDERS] ([Orders_ID], [Quotation_No], [Job_Type_ID]) VALUES (N'OD010', N'Q010 ', N'JT003')
INSERT [dbo].[QUOTATION] ([Quotation_No], [Customer_ID], [Job_Type_ID], [Estimated_Price], [Estimated_No_of_Days]) VALUES (N'Q001 ', N'C001 ', N'JT001', 7200, 6)
INSERT [dbo].[QUOTATION] ([Quotation_No], [Customer_ID], [Job_Type_ID], [Estimated_Price], [Estimated_No_of_Days]) VALUES (N'Q002 ', N'C002 ', N'JT002', 2160, 2)
INSERT [dbo].[QUOTATION] ([Quotation_No], [Customer_ID], [Job_Type_ID], [Estimated_Price], [Estimated_No_of_Days]) VALUES (N'Q003 ', N'C003 ', N'JT003', 900, 1)
INSERT [dbo].[QUOTATION] ([Quotation_No], [Customer_ID], [Job_Type_ID], [Estimated_Price], [Estimated_No_of_Days]) VALUES (N'Q004 ', N'C004 ', N'JT001', 8400, 7)
INSERT [dbo].[QUOTATION] ([Quotation_No], [Customer_ID], [Job_Type_ID], [Estimated_Price], [Estimated_No_of_Days]) VALUES (N'Q005 ', N'C005 ', N'JT002', 3240, 3)
INSERT [dbo].[QUOTATION] ([Quotation_No], [Customer_ID], [Job_Type_ID], [Estimated_Price], [Estimated_No_of_Days]) VALUES (N'Q006 ', N'C006 ', N'JT001', 8400, 7)
INSERT [dbo].[QUOTATION] ([Quotation_No], [Customer_ID], [Job_Type_ID], [Estimated_Price], [Estimated_No_of_Days]) VALUES (N'Q007 ', N'C007 ', N'JT001', 8400, 7)
INSERT [dbo].[QUOTATION] ([Quotation_No], [Customer_ID], [Job_Type_ID], [Estimated_Price], [Estimated_No_of_Days]) VALUES (N'Q008 ', N'C008 ', N'JT002', 1080, 1)
INSERT [dbo].[QUOTATION] ([Quotation_No], [Customer_ID], [Job_Type_ID], [Estimated_Price], [Estimated_No_of_Days]) VALUES (N'Q009 ', N'C009 ', N'JT002', 2160, 2)
INSERT [dbo].[QUOTATION] ([Quotation_No], [Customer_ID], [Job_Type_ID], [Estimated_Price], [Estimated_No_of_Days]) VALUES (N'Q010 ', N'C010 ', N'JT003', 1800, 2)
INSERT [dbo].[SUPPLIER] ([Supplier_ID], [Supplier_Name], [Address_ID], [Email], [Phone_Number]) VALUES (N'S001 ', N'Builders Warehouse', N'A011 ', N'manager@builderswarehouse.com', N'0217860099')
INSERT [dbo].[SUPPLIER] ([Supplier_ID], [Supplier_Name], [Address_ID], [Email], [Phone_Number]) VALUES (N'S002 ', N'BUCO', N'A012 ', N'manager@buco.com', N'0218889999')
INSERT [dbo].[SUPPLIER] ([Supplier_ID], [Supplier_Name], [Address_ID], [Email], [Phone_Number]) VALUES (N'S003 ', N'Penny Pinchers', N'A013 ', N'manager@pennypinchers.com', N'0217778888')
ALTER TABLE [dbo].[CUSTOMER]  WITH CHECK ADD  CONSTRAINT [FK_CUSTOMER_ADDRESS_INFO] FOREIGN KEY([Address_ID])
REFERENCES [dbo].[ADDRESS_INFO] ([Address_ID])
GO
ALTER TABLE [dbo].[CUSTOMER] CHECK CONSTRAINT [FK_CUSTOMER_ADDRESS_INFO]
GO
ALTER TABLE [dbo].[EMPLOYEE]  WITH CHECK ADD  CONSTRAINT [FK_EMPLOYEE_ADDRESS_INFO] FOREIGN KEY([Address_ID])
REFERENCES [dbo].[ADDRESS_INFO] ([Address_ID])
GO
ALTER TABLE [dbo].[EMPLOYEE] CHECK CONSTRAINT [FK_EMPLOYEE_ADDRESS_INFO]
GO
ALTER TABLE [dbo].[EQUIPMENT]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_SUPPLIER] FOREIGN KEY([Supplier_ID])
REFERENCES [dbo].[SUPPLIER] ([Supplier_ID])
GO
ALTER TABLE [dbo].[EQUIPMENT] CHECK CONSTRAINT [FK_Equipment_SUPPLIER]
GO
ALTER TABLE [dbo].[EQUIPMENT_USED]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPMENT_USED_EQUIPMENT] FOREIGN KEY([Equipment_ID])
REFERENCES [dbo].[EQUIPMENT] ([Equipment_ID])
GO
ALTER TABLE [dbo].[EQUIPMENT_USED] CHECK CONSTRAINT [FK_EQUIPMENT_USED_EQUIPMENT]
GO
ALTER TABLE [dbo].[EQUIPMENT_USED]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPMENT_USED_JOBCARD] FOREIGN KEY([Job_Card_No])
REFERENCES [dbo].[JOBCARD] ([Job_Card_No])
GO
ALTER TABLE [dbo].[EQUIPMENT_USED] CHECK CONSTRAINT [FK_EQUIPMENT_USED_JOBCARD]
GO
ALTER TABLE [dbo].[INVOICE]  WITH CHECK ADD  CONSTRAINT [FK_INVOICE_CUSTOMER] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[CUSTOMER] ([Customer_ID])
GO
ALTER TABLE [dbo].[INVOICE] CHECK CONSTRAINT [FK_INVOICE_CUSTOMER]
GO
ALTER TABLE [dbo].[INVOICE]  WITH CHECK ADD  CONSTRAINT [FK_INVOICE_JOBCARD] FOREIGN KEY([Job_Card_No])
REFERENCES [dbo].[JOBCARD] ([Job_Card_No])
GO
ALTER TABLE [dbo].[INVOICE] CHECK CONSTRAINT [FK_INVOICE_JOBCARD]
GO
ALTER TABLE [dbo].[JOBCARD]  WITH CHECK ADD  CONSTRAINT [FK_JOBCARD_ORDERS] FOREIGN KEY([Orders_ID])
REFERENCES [dbo].[ORDERS] ([Orders_ID])
GO
ALTER TABLE [dbo].[JOBCARD] CHECK CONSTRAINT [FK_JOBCARD_ORDERS]
GO
ALTER TABLE [dbo].[JOBCARD_EMPLOYEE]  WITH CHECK ADD  CONSTRAINT [FK_JOBCARD_EMPLOYEE_EMPLOYEE] FOREIGN KEY([Employee_No])
REFERENCES [dbo].[EMPLOYEE] ([Employee_No])
GO
ALTER TABLE [dbo].[JOBCARD_EMPLOYEE] CHECK CONSTRAINT [FK_JOBCARD_EMPLOYEE_EMPLOYEE]
GO
ALTER TABLE [dbo].[JOBCARD_EMPLOYEE]  WITH CHECK ADD  CONSTRAINT [FK_JOBCARD_EMPLOYEE_JOBCARD] FOREIGN KEY([Job_Card_No])
REFERENCES [dbo].[JOBCARD] ([Job_Card_No])
GO
ALTER TABLE [dbo].[JOBCARD_EMPLOYEE] CHECK CONSTRAINT [FK_JOBCARD_EMPLOYEE_JOBCARD]
GO
ALTER TABLE [dbo].[MATERIAL]  WITH CHECK ADD  CONSTRAINT [FK_MATERIAL_SUPPLIER] FOREIGN KEY([Supplier_ID])
REFERENCES [dbo].[SUPPLIER] ([Supplier_ID])
GO
ALTER TABLE [dbo].[MATERIAL] CHECK CONSTRAINT [FK_MATERIAL_SUPPLIER]
GO
ALTER TABLE [dbo].[MATERIALS_USED]  WITH CHECK ADD  CONSTRAINT [FK_MATERIALS_USED_JOBCARD] FOREIGN KEY([Job_Card_No])
REFERENCES [dbo].[JOBCARD] ([Job_Card_No])
GO
ALTER TABLE [dbo].[MATERIALS_USED] CHECK CONSTRAINT [FK_MATERIALS_USED_JOBCARD]
GO
ALTER TABLE [dbo].[MATERIALS_USED]  WITH CHECK ADD  CONSTRAINT [FK_MATERIALS_USED_MATERIAL] FOREIGN KEY([Material_ID])
REFERENCES [dbo].[MATERIAL] ([Material_ID])
GO
ALTER TABLE [dbo].[MATERIALS_USED] CHECK CONSTRAINT [FK_MATERIALS_USED_MATERIAL]
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD  CONSTRAINT [FK_ORDERS_JOB_TYPE] FOREIGN KEY([Job_Type_ID])
REFERENCES [dbo].[JOB_TYPE] ([Job_Type_ID])
GO
ALTER TABLE [dbo].[ORDERS] CHECK CONSTRAINT [FK_ORDERS_JOB_TYPE]
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD  CONSTRAINT [FK_ORDERS_QUOTATION] FOREIGN KEY([Quotation_No])
REFERENCES [dbo].[QUOTATION] ([Quotation_No])
GO
ALTER TABLE [dbo].[ORDERS] CHECK CONSTRAINT [FK_ORDERS_QUOTATION]
GO
ALTER TABLE [dbo].[QUOTATION]  WITH CHECK ADD  CONSTRAINT [FK_QUOTATION_CUSTOMER] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[CUSTOMER] ([Customer_ID])
GO
ALTER TABLE [dbo].[QUOTATION] CHECK CONSTRAINT [FK_QUOTATION_CUSTOMER]
GO
ALTER TABLE [dbo].[QUOTATION]  WITH CHECK ADD  CONSTRAINT [FK_QUOTATION_JOB_TYPE] FOREIGN KEY([Job_Type_ID])
REFERENCES [dbo].[JOB_TYPE] ([Job_Type_ID])
GO
ALTER TABLE [dbo].[QUOTATION] CHECK CONSTRAINT [FK_QUOTATION_JOB_TYPE]
GO
ALTER TABLE [dbo].[SUPPLIER]  WITH CHECK ADD  CONSTRAINT [FK_SUPPLIER_ADDRESS_INFO] FOREIGN KEY([Address_ID])
REFERENCES [dbo].[ADDRESS_INFO] ([Address_ID])
GO
ALTER TABLE [dbo].[SUPPLIER] CHECK CONSTRAINT [FK_SUPPLIER_ADDRESS_INFO]
GO
