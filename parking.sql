USE [ParkingBase]
GO
/****** Object:  Table [dbo].[Archive]    Script Date: 19.02.2022 19:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Archive](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [nvarchar](100) NOT NULL,
	[IDBike] [int] NOT NULL,
	[WriteOffDate] [date] NOT NULL,
 CONSTRAINT [PK_Archive] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bike]    Script Date: 19.02.2022 19:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bike](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[IDClient] [int] NOT NULL,
	[IDStatus] [int] NOT NULL,
	[IDType] [int] NOT NULL,
	[RecordingDate] [date] NOT NULL,
 CONSTRAINT [PK_Bike] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 19.02.2022 19:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Phone] [nchar](30) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 19.02.2022 19:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 19.02.2022 19:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bike] ON 

INSERT [dbo].[Bike] ([ID], [Title], [IDClient], [IDStatus], [IDType], [RecordingDate]) VALUES (1, N'Sportik', 1, 1, 1, CAST(N'2001-12-11' AS Date))
INSERT [dbo].[Bike] ([ID], [Title], [IDClient], [IDStatus], [IDType], [RecordingDate]) VALUES (3, N'tect', 2, 1, 1, CAST(N'0001-01-01' AS Date))
INSERT [dbo].[Bike] ([ID], [Title], [IDClient], [IDStatus], [IDType], [RecordingDate]) VALUES (4, N'ыыы', 2, 2, 2, CAST(N'0001-01-01' AS Date))
INSERT [dbo].[Bike] ([ID], [Title], [IDClient], [IDStatus], [IDType], [RecordingDate]) VALUES (2004, N'jyfgkuyk', 2, 1, 2, CAST(N'0001-01-03' AS Date))
SET IDENTITY_INSERT [dbo].[Bike] OFF
GO
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Phone]) VALUES (1, N'Путин', N'Владимир', N'+79896542545                  ')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Phone]) VALUES (2, N'Наталья', N'Петровна', N'+79896450256                  ')
GO
INSERT [dbo].[Status] ([ID], [Title]) VALUES (1, N'На парковке')
INSERT [dbo].[Status] ([ID], [Title]) VALUES (2, N'Списан')
GO
INSERT [dbo].[Type] ([ID], [Title]) VALUES (1, N'Спортивный')
INSERT [dbo].[Type] ([ID], [Title]) VALUES (2, N'Обычный')
GO
ALTER TABLE [dbo].[Archive]  WITH CHECK ADD  CONSTRAINT [FK_Archive_Bike] FOREIGN KEY([IDBike])
REFERENCES [dbo].[Bike] ([ID])
GO
ALTER TABLE [dbo].[Archive] CHECK CONSTRAINT [FK_Archive_Bike]
GO
ALTER TABLE [dbo].[Bike]  WITH CHECK ADD  CONSTRAINT [FK_Bike_Client] FOREIGN KEY([IDClient])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Bike] CHECK CONSTRAINT [FK_Bike_Client]
GO
ALTER TABLE [dbo].[Bike]  WITH CHECK ADD  CONSTRAINT [FK_Bike_Status] FOREIGN KEY([IDStatus])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[Bike] CHECK CONSTRAINT [FK_Bike_Status]
GO
ALTER TABLE [dbo].[Bike]  WITH CHECK ADD  CONSTRAINT [FK_Bike_Type] FOREIGN KEY([IDType])
REFERENCES [dbo].[Type] ([ID])
GO
ALTER TABLE [dbo].[Bike] CHECK CONSTRAINT [FK_Bike_Type]
GO
