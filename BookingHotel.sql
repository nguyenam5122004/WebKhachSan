USE [BookingHotel]
GO
/****** Object:  Table [dbo].[Amenities]    Script Date: 5/01/2025 4:37:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amenities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Icon] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Amenities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 5/01/2025 4:37:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/01/2025 4:37:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/01/2025 4:37:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/01/2025 4:37:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/01/2025 4:37:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/01/2025 4:37:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 5/01/2025 4:37:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 5/01/2025 4:37:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CheckInDate] [datetime2](7) NOT NULL,
	[CheckOutDate] [datetime2](7) NOT NULL,
	[NumberOfGuests] [int] NOT NULL,
	[TotalPrice] [decimal](18, 2) NOT NULL,
	[Status] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[EmailVerificationToken] [nvarchar](max) NOT NULL,
	[IsEmailVerified] [bit] NOT NULL,
	[ApplicationUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_Bookings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomAmenities]    Script Date: 5/01/2025 4:37:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomAmenities](
	[RoomId] [int] NOT NULL,
	[AmenityId] [int] NOT NULL,
 CONSTRAINT [PK_RoomAmenities] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC,
	[AmenityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 5/01/2025 4:37:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[RoomType] [nvarchar](max) NOT NULL,
	[PricePerNight] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Capacity] [int] NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[BedType] [nvarchar](max) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Size] [int] NOT NULL,
	[View] [nvarchar](max) NOT NULL,
	[AvailableRooms] [int] NOT NULL,
	[IsAvailable] [bit] NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Amenities] ON 

INSERT [dbo].[Amenities] ([Id], [Name], [Icon]) VALUES (1, N'Wi-Fi', N'wifi')
INSERT [dbo].[Amenities] ([Id], [Name], [Icon]) VALUES (2, N'Điều hòa', N'air-conditioner')
INSERT [dbo].[Amenities] ([Id], [Name], [Icon]) VALUES (3, N'TV', N'tv')
INSERT [dbo].[Amenities] ([Id], [Name], [Icon]) VALUES (4, N'Tủ lạnh', N'fridge')
INSERT [dbo].[Amenities] ([Id], [Name], [Icon]) VALUES (5, N'Két an toàn', N'safe')
INSERT [dbo].[Amenities] ([Id], [Name], [Icon]) VALUES (6, N'Minibar', N'minibar')
INSERT [dbo].[Amenities] ([Id], [Name], [Icon]) VALUES (7, N'Bồn tắm', N'bathtub')
INSERT [dbo].[Amenities] ([Id], [Name], [Icon]) VALUES (8, N'Máy sấy tóc', N'hair-dryer')
INSERT [dbo].[Amenities] ([Id], [Name], [Icon]) VALUES (9, N'Bàn làm việc', N'desk')
INSERT [dbo].[Amenities] ([Id], [Name], [Icon]) VALUES (10, N'Bể bơi riêng', N'private-pool')
SET IDENTITY_INSERT [dbo].[Amenities] OFF
GO
SET IDENTITY_INSERT [dbo].[AspNetRoleClaims] ON 

INSERT [dbo].[AspNetRoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2, N'6896A31F-F0E4-4725-B6B4-25DC84BB2BF9', N'Permission ', N'FullAccess')
SET IDENTITY_INSERT [dbo].[AspNetRoleClaims] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'6896A31F-F0E4-4725-B6B4-25DC84BB2BF9', N'Admin', N'ADMIN', N'CF59D4A0-F9F9-4E63-83D6-8A671904B1E7')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'50b52756-e73e-4db1-ae2c-64b58daf8043', N'6896A31F-F0E4-4725-B6B4-25DC84BB2BF9')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'41d2d30d-9310-48e9-af13-d80301b2f067', N'Bui', N'Minh Tan', N'Bui Minh Tan', N'minhtan123@gmail.com', N'MINHTAN123@GMAIL.COM', N'minhtan123@gmail.com', N'MINHTAN123@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEH5wp57NGP3sCzQEQEqLIrGagoO17e/TSTBA+2vqmnYwXv6c+cM7v9Qw2X1V8Ty40w==', N'NCYMRAQ5PEVJMAGMGNPUH35EW3XKLBQH', N'7b769b24-cd9d-4796-aca2-62f43765975c', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'50b52756-e73e-4db1-ae2c-64b58daf8043', N'Admin', N'User', N'Admin User', N'admin123@gmail.com', N'ADMIN123@GMAIL.COM', N'admin123@gmail.com', N'ADMIN123@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEHu79N+u/06wMh9aDW8pITIyST7nWUVbW2HRizbiLsrPuwpG48zzDHDRGFKzG4Kt1g==', N'TXXPOOHQW4MCNDZY7MNFOOWLZEQHKSWT', N'28f638a4-b44b-4e10-8323-ce56d918d1cf', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'6d5c2cfa-3d8b-4a27-9144-a030c0d5e409', N'nguyen', N'nam', N'nguyen nam', N'darkknightpro123@gmail.com', N'DARKKNIGHTPRO123@GMAIL.COM', N'darkknightpro123@gmail.com', N'DARKKNIGHTPRO123@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEI3ffZSvi/KZWg0ISXKnBo+u3/7k28Vp5fBhJzRfGPuDCHDefuqAHEXCMiFSnbW3Xw==', N'FOVUB7HR7WRXAJ5DAROZOZ67C4RCHUBD', N'913d7639-3a9e-4c40-b601-9f8d19a21fa3', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Bookings] ON 

INSERT [dbo].[Bookings] ([Id], [CheckInDate], [CheckOutDate], [NumberOfGuests], [TotalPrice], [Status], [RoomId], [Email], [EmailVerificationToken], [IsEmailVerified], [ApplicationUserId]) VALUES (1, CAST(N'2025-01-07T08:28:28.5300000' AS DateTime2), CAST(N'2025-01-10T08:28:28.5300000' AS DateTime2), 2, CAST(3000000.00 AS Decimal(18, 2)), 1, 1, N'', N'', 0, NULL)
INSERT [dbo].[Bookings] ([Id], [CheckInDate], [CheckOutDate], [NumberOfGuests], [TotalPrice], [Status], [RoomId], [Email], [EmailVerificationToken], [IsEmailVerified], [ApplicationUserId]) VALUES (2, CAST(N'2025-01-14T08:28:28.5300000' AS DateTime2), CAST(N'2025-01-21T08:28:28.5300000' AS DateTime2), 3, CAST(14000000.00 AS Decimal(18, 2)), 1, 2, N'', N'', 0, NULL)
INSERT [dbo].[Bookings] ([Id], [CheckInDate], [CheckOutDate], [NumberOfGuests], [TotalPrice], [Status], [RoomId], [Email], [EmailVerificationToken], [IsEmailVerified], [ApplicationUserId]) VALUES (3, CAST(N'2025-01-01T08:28:28.5300000' AS DateTime2), CAST(N'2025-01-05T08:28:28.5300000' AS DateTime2), 4, CAST(6000000.00 AS Decimal(18, 2)), 1, 3, N'', N'', 0, NULL)
SET IDENTITY_INSERT [dbo].[Bookings] OFF
GO
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (1, 1)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (2, 1)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (3, 1)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (4, 1)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (5, 1)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (6, 1)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (7, 1)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (8, 1)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (9, 1)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (10, 1)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (1, 2)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (2, 2)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (3, 2)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (4, 2)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (5, 2)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (6, 2)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (7, 2)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (8, 2)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (9, 2)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (10, 2)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (1, 3)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (2, 3)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (3, 3)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (4, 3)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (5, 3)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (6, 3)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (7, 3)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (8, 3)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (9, 3)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (10, 3)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (1, 4)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (2, 4)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (3, 4)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (4, 4)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (5, 4)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (6, 4)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (7, 4)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (8, 4)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (9, 4)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (10, 4)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (1, 5)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (2, 5)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (3, 5)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (4, 5)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (5, 5)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (6, 5)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (7, 5)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (8, 5)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (9, 5)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (10, 5)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (1, 6)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (2, 6)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (3, 6)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (4, 6)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (5, 6)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (6, 6)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (7, 6)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (8, 6)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (9, 6)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (10, 6)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (1, 7)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (2, 7)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (3, 7)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (4, 7)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (5, 7)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (6, 7)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (7, 7)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (8, 7)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (9, 7)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (10, 7)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (1, 8)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (2, 8)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (3, 8)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (4, 8)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (5, 8)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (6, 8)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (7, 8)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (8, 8)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (9, 8)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (10, 8)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (1, 9)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (2, 9)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (3, 9)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (4, 9)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (5, 9)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (6, 9)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (7, 9)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (8, 9)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (9, 9)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (10, 9)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (1, 10)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (2, 10)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (3, 10)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (4, 10)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (5, 10)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (6, 10)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (7, 10)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (8, 10)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (9, 10)
INSERT [dbo].[RoomAmenities] ([RoomId], [AmenityId]) VALUES (10, 10)
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([Id], [Name], [RoomType], [PricePerNight], [Description], [Capacity], [ImageUrl], [BedType], [Quantity], [Size], [View], [AvailableRooms], [IsAvailable]) VALUES (1, N'Phòng Deluxe', N'Deluxe', CAST(1000000.00 AS Decimal(18, 2)), N'Phòng sang trọng với view thành phố', 2, N'/images/room-1.jpg', N'Queen', 1, 25, N'City', 0, 1)
INSERT [dbo].[Rooms] ([Id], [Name], [RoomType], [PricePerNight], [Description], [Capacity], [ImageUrl], [BedType], [Quantity], [Size], [View], [AvailableRooms], [IsAvailable]) VALUES (2, N'Phòng Suite', N'Suite', CAST(2000000.00 AS Decimal(18, 2)), N'Phòng rộng rãi vớii phòng khách riêng', 4, N'/images/room-2.jpg', N'King', 10, 45, N'Sea', 0, 1)
INSERT [dbo].[Rooms] ([Id], [Name], [RoomType], [PricePerNight], [Description], [Capacity], [ImageUrl], [BedType], [Quantity], [Size], [View], [AvailableRooms], [IsAvailable]) VALUES (3, N'Phòng gia đình', N'Family', CAST(1500000.00 AS Decimal(18, 2)), N'Phòng lớn phù hợp cho gia đình', 5, N'/images/room-3.jpg', N'Four-Poster', 10, 50, N'Garden', 0, 1)
INSERT [dbo].[Rooms] ([Id], [Name], [RoomType], [PricePerNight], [Description], [Capacity], [ImageUrl], [BedType], [Quantity], [Size], [View], [AvailableRooms], [IsAvailable]) VALUES (4, N'Phòng Superior', N'Superior', CAST(1200000.00 AS Decimal(18, 2)), N'Phòng thoải mái với view đẹp', 2, N'/images/room-4.jpg', N'Canopy', 10, 30, N'City', 0, 1)
INSERT [dbo].[Rooms] ([Id], [Name], [RoomType], [PricePerNight], [Description], [Capacity], [ImageUrl], [BedType], [Quantity], [Size], [View], [AvailableRooms], [IsAvailable]) VALUES (5, N'Phòng Executive', N'Executive', CAST(1800000.00 AS Decimal(18, 2)), N'Phòng cao cấp với dịch vụ VIP', 2, N'/images/room-5.jpg', N'Sleigh', 10, 35, N'Panoramic', 0, 1)
INSERT [dbo].[Rooms] ([Id], [Name], [RoomType], [PricePerNight], [Description], [Capacity], [ImageUrl], [BedType], [Quantity], [Size], [View], [AvailableRooms], [IsAvailable]) VALUES (6, N'Phòng Penthouse', N'Penthouse', CAST(5000000.00 AS Decimal(18, 2)), N'Phòng sang trọng nhất với view toàn cảnh', 6, N'/images/room-6.jpg', N'Platform', 10, 100, N'Ocean', 0, 1)
INSERT [dbo].[Rooms] ([Id], [Name], [RoomType], [PricePerNight], [Description], [Capacity], [ImageUrl], [BedType], [Quantity], [Size], [View], [AvailableRooms], [IsAvailable]) VALUES (7, N'Phòng Connecting', N'Connecting', CAST(2200000.00 AS Decimal(18, 2)), N'Hai phòng liền kề, lý tuởng cho gia dình lớn', 6, N'/images/room-7.jpg', N'Upholstered', 10, 60, N'City or Garden', 0, 1)
INSERT [dbo].[Rooms] ([Id], [Name], [RoomType], [PricePerNight], [Description], [Capacity], [ImageUrl], [BedType], [Quantity], [Size], [View], [AvailableRooms], [IsAvailable]) VALUES (8, N'Phòng Studio', N'Studio', CAST(1300000.00 AS Decimal(18, 2)), N'Phòng nhỏ gọn với đầy đủ tiện nghi', 2, N'/images/room-8.jpg', N'Divan', 10, 30, N'Garden', 0, 1)
INSERT [dbo].[Rooms] ([Id], [Name], [RoomType], [PricePerNight], [Description], [Capacity], [ImageUrl], [BedType], [Quantity], [Size], [View], [AvailableRooms], [IsAvailable]) VALUES (9, N'Villa Biển', N'Villa', CAST(8000000.00 AS Decimal(18, 2)), N'Villa riêng biệt với view biển tuyệt đẹp', 8, N'/images/room-9.jpg', N'Chesterfield', 10, 120, N'Ocean', 0, 1)
INSERT [dbo].[Rooms] ([Id], [Name], [RoomType], [PricePerNight], [Description], [Capacity], [ImageUrl], [BedType], [Quantity], [Size], [View], [AvailableRooms], [IsAvailable]) VALUES (10, N'Phòng Accessible', N'Accessible', CAST(1100000.00 AS Decimal(18, 2)), N'Phòng thiết kế đặc biệt cho nguời khuyết tật', 2, N'/images/room-10.jpg', N'Turning', 10, 30, N'Garden', 0, 1)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT (N'') FOR [Email]
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT (N'') FOR [EmailVerificationToken]
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsEmailVerified]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT (N'') FOR [ImageUrl]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT (N'') FOR [BedType]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT ((0)) FOR [Size]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT (N'') FOR [View]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT ((0)) FOR [AvailableRooms]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsAvailable]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_AspNetUsers_ApplicationUserId] FOREIGN KEY([ApplicationUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_AspNetUsers_ApplicationUserId]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Rooms_RoomId] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Rooms_RoomId]
GO
ALTER TABLE [dbo].[RoomAmenities]  WITH CHECK ADD  CONSTRAINT [FK_RoomAmenities_Amenities_AmenityId] FOREIGN KEY([AmenityId])
REFERENCES [dbo].[Amenities] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoomAmenities] CHECK CONSTRAINT [FK_RoomAmenities_Amenities_AmenityId]
GO
ALTER TABLE [dbo].[RoomAmenities]  WITH CHECK ADD  CONSTRAINT [FK_RoomAmenities_Rooms_RoomId] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoomAmenities] CHECK CONSTRAINT [FK_RoomAmenities_Rooms_RoomId]
GO
