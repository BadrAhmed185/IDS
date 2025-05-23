USE [master]
GO
/****** Object:  Database [IDS]    Script Date: 5/20/2025 10:49:52 PM ******/
CREATE DATABASE [IDS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IDS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\IDS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IDS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\IDS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [IDS] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IDS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IDS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IDS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IDS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IDS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IDS] SET ARITHABORT OFF 
GO
ALTER DATABASE [IDS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [IDS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IDS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IDS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IDS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IDS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IDS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IDS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IDS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IDS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [IDS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IDS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IDS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IDS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IDS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IDS] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [IDS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IDS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IDS] SET  MULTI_USER 
GO
ALTER DATABASE [IDS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IDS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IDS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IDS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IDS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IDS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [IDS] SET QUERY_STORE = ON
GO
ALTER DATABASE [IDS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [IDS]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/20/2025 10:49:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asnans]    Script Date: 5/20/2025 10:49:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asnans](
	[Id] [nvarchar](450) NOT NULL,
	[tooth11] [bit] NOT NULL,
	[tooth12] [bit] NOT NULL,
	[tooth13] [bit] NOT NULL,
	[tooth14] [bit] NOT NULL,
	[tooth15] [bit] NOT NULL,
	[tooth16] [bit] NOT NULL,
	[tooth17] [bit] NOT NULL,
	[tooth18] [bit] NOT NULL,
	[tooth21] [bit] NOT NULL,
	[tooth22] [bit] NOT NULL,
	[tooth23] [bit] NOT NULL,
	[tooth24] [bit] NOT NULL,
	[tooth25] [bit] NOT NULL,
	[tooth26] [bit] NOT NULL,
	[tooth27] [bit] NOT NULL,
	[tooth28] [bit] NOT NULL,
	[tooth31] [bit] NOT NULL,
	[tooth32] [bit] NOT NULL,
	[tooth33] [bit] NOT NULL,
	[tooth34] [bit] NOT NULL,
	[tooth35] [bit] NOT NULL,
	[tooth36] [bit] NOT NULL,
	[tooth37] [bit] NOT NULL,
	[tooth38] [bit] NOT NULL,
	[tooth41] [bit] NOT NULL,
	[tooth42] [bit] NOT NULL,
	[tooth43] [bit] NOT NULL,
	[tooth44] [bit] NOT NULL,
	[tooth45] [bit] NOT NULL,
	[tooth46] [bit] NOT NULL,
	[tooth47] [bit] NOT NULL,
	[tooth48] [bit] NOT NULL,
 CONSTRAINT [PK_Asnans] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 5/20/2025 10:49:53 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/20/2025 10:49:53 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/20/2025 10:49:53 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/20/2025 10:49:53 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/20/2025 10:49:53 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/20/2025 10:49:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[NationalId] [nvarchar](max) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Role] [nvarchar](max) NULL,
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
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 5/20/2025 10:49:53 PM ******/
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
/****** Object:  Table [dbo].[MedicalHistories]    Script Date: 5/20/2025 10:49:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalHistories](
	[Id] [nvarchar](450) NOT NULL,
	[HeartTrouble] [bit] NOT NULL,
	[Hyperttention] [bit] NOT NULL,
	[Pregnancy] [bit] NOT NULL,
	[Diabetes] [bit] NOT NULL,
	[Hepatitis] [nvarchar](max) NOT NULL,
	[AIDs] [bit] NOT NULL,
	[Tuberculosis] [bit] NOT NULL,
	[Allergies] [bit] NOT NULL,
	[Anemia] [bit] NOT NULL,
	[Rheumatism] [bit] NOT NULL,
	[RadTherapy] [bit] NOT NULL,
	[Haemophilia] [bit] NOT NULL,
	[AspirinIntake] [bit] NOT NULL,
	[KidneyTroubles] [bit] NOT NULL,
	[Asthma] [bit] NOT NULL,
	[HayFever] [bit] NOT NULL,
	[MedicalHistoryText] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_MedicalHistories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[patients]    Script Date: 5/20/2025 10:49:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patients](
	[PatientId] [nvarchar](14) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[profession] [nvarchar](100) NOT NULL,
	[phoneNumber] [nvarchar](11) NOT NULL,
	[Gender] [nvarchar](max) NOT NULL,
	[Age] [int] NOT NULL,
 CONSTRAINT [PK_patients] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReferredTo]    Script Date: 5/20/2025 10:49:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReferredTo](
	[Id] [nvarchar](450) NOT NULL,
	[Oral] [bit] NOT NULL,
	[RemovableProsth] [bit] NOT NULL,
	[Operative] [bit] NOT NULL,
	[Endodontic] [bit] NOT NULL,
	[Ortho] [bit] NOT NULL,
	[CrownAndBridge] [bit] NOT NULL,
	[Surgery] [bit] NOT NULL,
	[Pedo] [bit] NOT NULL,
	[XRay] [bit] NOT NULL,
 CONSTRAINT [PK_ReferredTo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ticketAccountancies]    Script Date: 5/20/2025 10:49:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticketAccountancies](
	[TicketId] [nvarchar](450) NOT NULL,
	[ReceptionEmpId] [nvarchar](450) NOT NULL,
	[DiagnosisDocId] [nvarchar](450) NULL,
 CONSTRAINT [PK_ticketAccountancies] PRIMARY KEY CLUSTERED 
(
	[TicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 5/20/2025 10:49:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[TicketId] [nvarchar](450) NOT NULL,
	[PatientId] [nvarchar](14) NOT NULL,
	[AppointmentDate] [datetime2](7) NOT NULL,
	[ChiefComlant] [nvarchar](1000) NOT NULL,
	[PrevisionalDiagnosis] [nvarchar](1000) NOT NULL,
	[NextDate] [datetime2](7) NULL,
	[Status] [nvarchar](max) NOT NULL,
	[IsValid] [bit] NOT NULL,
	[LevelOfCompletness] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[TicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250517160938_yarb-MyBestMigEver', N'9.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250517162441_EditTicketAccountanct', N'9.0.2')
GO
INSERT [dbo].[Asnans] ([Id], [tooth11], [tooth12], [tooth13], [tooth14], [tooth15], [tooth16], [tooth17], [tooth18], [tooth21], [tooth22], [tooth23], [tooth24], [tooth25], [tooth26], [tooth27], [tooth28], [tooth31], [tooth32], [tooth33], [tooth34], [tooth35], [tooth36], [tooth37], [tooth38], [tooth41], [tooth42], [tooth43], [tooth44], [tooth45], [tooth46], [tooth47], [tooth48]) VALUES (N'121489', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Asnans] ([Id], [tooth11], [tooth12], [tooth13], [tooth14], [tooth15], [tooth16], [tooth17], [tooth18], [tooth21], [tooth22], [tooth23], [tooth24], [tooth25], [tooth26], [tooth27], [tooth28], [tooth31], [tooth32], [tooth33], [tooth34], [tooth35], [tooth36], [tooth37], [tooth38], [tooth41], [tooth42], [tooth43], [tooth44], [tooth45], [tooth46], [tooth47], [tooth48]) VALUES (N'139902', 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Asnans] ([Id], [tooth11], [tooth12], [tooth13], [tooth14], [tooth15], [tooth16], [tooth17], [tooth18], [tooth21], [tooth22], [tooth23], [tooth24], [tooth25], [tooth26], [tooth27], [tooth28], [tooth31], [tooth32], [tooth33], [tooth34], [tooth35], [tooth36], [tooth37], [tooth38], [tooth41], [tooth42], [tooth43], [tooth44], [tooth45], [tooth46], [tooth47], [tooth48]) VALUES (N'966029', 1, 1, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Asnans] ([Id], [tooth11], [tooth12], [tooth13], [tooth14], [tooth15], [tooth16], [tooth17], [tooth18], [tooth21], [tooth22], [tooth23], [tooth24], [tooth25], [tooth26], [tooth27], [tooth28], [tooth31], [tooth32], [tooth33], [tooth34], [tooth35], [tooth36], [tooth37], [tooth38], [tooth41], [tooth42], [tooth43], [tooth44], [tooth45], [tooth46], [tooth47], [tooth48]) VALUES (N'971604', 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1893258f-030c-4fd5-9178-f6f2343fbc4a', N'User', N'USER', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1893258f-030c-4fd5-9178-f6f2343fbc4b', N'Reception', N'RECEPTION', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1893258f-030c-4fd5-9178-f6f2343fbc4c', N'Diagnosis-Doc', N'DIAGNOSIS-DOC', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1893258f-030c-4fd5-9178-f6f2343fbc4d', N'Admin', N'ADMIN', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'26edb8dc-ce67-4408-9866-32a860f42e8e', N'1893258f-030c-4fd5-9178-f6f2343fbc4b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ee1d9fe1-b1ad-4ed9-85fe-abdd725f084c', N'1893258f-030c-4fd5-9178-f6f2343fbc4c')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'64d782cd-2b46-4016-bb07-3009014ecace', N'1893258f-030c-4fd5-9178-f6f2343fbc4d')
GO
INSERT [dbo].[AspNetUsers] ([Id], [NationalId], [FullName], [Address], [Role], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'26edb8dc-ce67-4408-9866-32a860f42e8e', N'303051825013534', N'بدرماسك', N'Assiut', N'Reception', N'badrReception', N'BADRRECEPTION', N'badr.ahmed.2017@gmail.com', N'BADR.AHMED.2017@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEAEvLUhSDiIBc5xugZUc5eHpWlNWfZL9lvJehaODrk5vts0dk2aX8ypKGR1SiwjTTw==', N'64YMOHBO74ZWJENL5PPYZN7RGUE465DG', N'8739c498-dc30-4f89-8bda-99c68bb4eb32', N'01013287535', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [NationalId], [FullName], [Address], [Role], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'64d782cd-2b46-4016-bb07-3009014ecace', N'30305182501352', N'بدر أحمد البدري', N'Assiut', N'Admin', N'badr2003', N'BADR2003', N'badr.ahmed.2015@gmail.com', N'BADR.AHMED.2015@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEHeKD2txmeCm3L5UFEvJ+1Az297yOzdAlGMOWiyvETlpcWkVpBXYxQP1Zkikb2stSw==', N'IKDKO7LJOCVH7EV27QEGNYIOUN3CZBTT', N'089502c5-bb95-4e27-9103-c0a167fe4de5', N'01013287537', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [NationalId], [FullName], [Address], [Role], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ee1d9fe1-b1ad-4ed9-85fe-abdd725f084c', N'30305182501350', N'بدر أحمد البدري', N'Assiut', N'Diagnosis-Doc', N'badrDiagnosis', N'BADRDIAGNOSIS', N'badr.ahmed.2016@gmail.com', N'BADR.AHMED.2016@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEK3DNbhXDme4Nj5+PtPlXvih6XJ7YaS6bRUBMitj4h9yjvsilpASjT8PoglT9Tb6CA==', N'QU4GKCFNNNVZKUKX5XIH3JMCHPCM6LBW', N'1ea19f78-50e0-4862-9f60-672af9555ab6', N'01013287538', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[MedicalHistories] ([Id], [HeartTrouble], [Hyperttention], [Pregnancy], [Diabetes], [Hepatitis], [AIDs], [Tuberculosis], [Allergies], [Anemia], [Rheumatism], [RadTherapy], [Haemophilia], [AspirinIntake], [KidneyTroubles], [Asthma], [HayFever], [MedicalHistoryText]) VALUES (N'121489', 0, 0, 0, 0, N'A', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'N/A')
INSERT [dbo].[MedicalHistories] ([Id], [HeartTrouble], [Hyperttention], [Pregnancy], [Diabetes], [Hepatitis], [AIDs], [Tuberculosis], [Allergies], [Anemia], [Rheumatism], [RadTherapy], [Haemophilia], [AspirinIntake], [KidneyTroubles], [Asthma], [HayFever], [MedicalHistoryText]) VALUES (N'139902', 0, 0, 0, 0, N'A', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'N/A')
INSERT [dbo].[MedicalHistories] ([Id], [HeartTrouble], [Hyperttention], [Pregnancy], [Diabetes], [Hepatitis], [AIDs], [Tuberculosis], [Allergies], [Anemia], [Rheumatism], [RadTherapy], [Haemophilia], [AspirinIntake], [KidneyTroubles], [Asthma], [HayFever], [MedicalHistoryText]) VALUES (N'966029', 0, 0, 0, 0, N'A', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, N'N/A')
INSERT [dbo].[MedicalHistories] ([Id], [HeartTrouble], [Hyperttention], [Pregnancy], [Diabetes], [Hepatitis], [AIDs], [Tuberculosis], [Allergies], [Anemia], [Rheumatism], [RadTherapy], [Haemophilia], [AspirinIntake], [KidneyTroubles], [Asthma], [HayFever], [MedicalHistoryText]) VALUES (N'971604', 0, 0, 0, 0, N'A', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'N/A')
GO
INSERT [dbo].[patients] ([PatientId], [Name], [Address], [profession], [phoneNumber], [Gender], [Age]) VALUES (N'30305182501352', N'بدر أحمد البدري راشد', N'القاهره', N'مهندس برمجيات', N'01013287537', N'Male', 22)
INSERT [dbo].[patients] ([PatientId], [Name], [Address], [profession], [phoneNumber], [Gender], [Age]) VALUES (N'30305182501357', N'أحمد محمد عبدالعزيز', N'Assiut', N'مهندس برمجيات', N'01028100177', N'Male', 22)
GO
INSERT [dbo].[ReferredTo] ([Id], [Oral], [RemovableProsth], [Operative], [Endodontic], [Ortho], [CrownAndBridge], [Surgery], [Pedo], [XRay]) VALUES (N'121489', 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[ReferredTo] ([Id], [Oral], [RemovableProsth], [Operative], [Endodontic], [Ortho], [CrownAndBridge], [Surgery], [Pedo], [XRay]) VALUES (N'139902', 0, 0, 1, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[ReferredTo] ([Id], [Oral], [RemovableProsth], [Operative], [Endodontic], [Ortho], [CrownAndBridge], [Surgery], [Pedo], [XRay]) VALUES (N'966029', 0, 1, 0, 0, 0, 1, 0, 0, 0)
INSERT [dbo].[ReferredTo] ([Id], [Oral], [RemovableProsth], [Operative], [Endodontic], [Ortho], [CrownAndBridge], [Surgery], [Pedo], [XRay]) VALUES (N'971604', 1, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[ticketAccountancies] ([TicketId], [ReceptionEmpId], [DiagnosisDocId]) VALUES (N'121489', N'26edb8dc-ce67-4408-9866-32a860f42e8e', NULL)
INSERT [dbo].[ticketAccountancies] ([TicketId], [ReceptionEmpId], [DiagnosisDocId]) VALUES (N'139902', N'26edb8dc-ce67-4408-9866-32a860f42e8e', NULL)
INSERT [dbo].[ticketAccountancies] ([TicketId], [ReceptionEmpId], [DiagnosisDocId]) VALUES (N'966029', N'ee1d9fe1-b1ad-4ed9-85fe-abdd725f084c', NULL)
INSERT [dbo].[ticketAccountancies] ([TicketId], [ReceptionEmpId], [DiagnosisDocId]) VALUES (N'971604', N'ee1d9fe1-b1ad-4ed9-85fe-abdd725f084c', NULL)
GO
INSERT [dbo].[Tickets] ([TicketId], [PatientId], [AppointmentDate], [ChiefComlant], [PrevisionalDiagnosis], [NextDate], [Status], [IsValid], [LevelOfCompletness]) VALUES (N'121489', N'30305182501357', CAST(N'2025-05-19T15:34:07.2842410' AS DateTime2), N'N/A', N'N/A', NULL, N'Reception', 1, NULL)
INSERT [dbo].[Tickets] ([TicketId], [PatientId], [AppointmentDate], [ChiefComlant], [PrevisionalDiagnosis], [NextDate], [Status], [IsValid], [LevelOfCompletness]) VALUES (N'139902', N'30305182501352', CAST(N'2025-05-19T00:00:00.0000000' AS DateTime2), N'N/A', N'Swelling', CAST(N'2025-05-20T00:00:00.0000000' AS DateTime2), N'Reception', 1, NULL)
INSERT [dbo].[Tickets] ([TicketId], [PatientId], [AppointmentDate], [ChiefComlant], [PrevisionalDiagnosis], [NextDate], [Status], [IsValid], [LevelOfCompletness]) VALUES (N'966029', N'30305182501352', CAST(N'2025-05-18T00:00:00.0000000' AS DateTime2), N'N/A', N'بوجي', CAST(N'2025-05-20T00:00:00.0000000' AS DateTime2), N'Reception', 1, NULL)
INSERT [dbo].[Tickets] ([TicketId], [PatientId], [AppointmentDate], [ChiefComlant], [PrevisionalDiagnosis], [NextDate], [Status], [IsValid], [LevelOfCompletness]) VALUES (N'971604', N'30305182501352', CAST(N'2025-05-17T00:00:00.0000000' AS DateTime2), N'N/A', N'N/A', CAST(N'2025-05-22T00:00:00.0000000' AS DateTime2), N'Reception', 1, NULL)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 5/20/2025 10:49:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 5/20/2025 10:49:53 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 5/20/2025 10:49:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 5/20/2025 10:49:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 5/20/2025 10:49:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 5/20/2025 10:49:53 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 5/20/2025 10:49:53 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ticketAccountancies_DiagnosisDocId]    Script Date: 5/20/2025 10:49:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_ticketAccountancies_DiagnosisDocId] ON [dbo].[ticketAccountancies]
(
	[DiagnosisDocId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ticketAccountancies_ReceptionEmpId]    Script Date: 5/20/2025 10:49:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_ticketAccountancies_ReceptionEmpId] ON [dbo].[ticketAccountancies]
(
	[ReceptionEmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Tickets_PatientId]    Script Date: 5/20/2025 10:49:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_Tickets_PatientId] ON [dbo].[Tickets]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asnans]  WITH CHECK ADD  CONSTRAINT [FK_Asnans_Tickets_Id] FOREIGN KEY([Id])
REFERENCES [dbo].[Tickets] ([TicketId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Asnans] CHECK CONSTRAINT [FK_Asnans_Tickets_Id]
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
ALTER TABLE [dbo].[MedicalHistories]  WITH CHECK ADD  CONSTRAINT [FK_MedicalHistories_Tickets_Id] FOREIGN KEY([Id])
REFERENCES [dbo].[Tickets] ([TicketId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MedicalHistories] CHECK CONSTRAINT [FK_MedicalHistories_Tickets_Id]
GO
ALTER TABLE [dbo].[ReferredTo]  WITH CHECK ADD  CONSTRAINT [FK_ReferredTo_Tickets_Id] FOREIGN KEY([Id])
REFERENCES [dbo].[Tickets] ([TicketId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReferredTo] CHECK CONSTRAINT [FK_ReferredTo_Tickets_Id]
GO
ALTER TABLE [dbo].[ticketAccountancies]  WITH CHECK ADD  CONSTRAINT [FK_ticketAccountancies_AspNetUsers_DiagnosisDocId] FOREIGN KEY([DiagnosisDocId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ticketAccountancies] CHECK CONSTRAINT [FK_ticketAccountancies_AspNetUsers_DiagnosisDocId]
GO
ALTER TABLE [dbo].[ticketAccountancies]  WITH CHECK ADD  CONSTRAINT [FK_ticketAccountancies_AspNetUsers_ReceptionEmpId] FOREIGN KEY([ReceptionEmpId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ticketAccountancies] CHECK CONSTRAINT [FK_ticketAccountancies_AspNetUsers_ReceptionEmpId]
GO
ALTER TABLE [dbo].[ticketAccountancies]  WITH CHECK ADD  CONSTRAINT [FK_ticketAccountancies_Tickets_TicketId] FOREIGN KEY([TicketId])
REFERENCES [dbo].[Tickets] ([TicketId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ticketAccountancies] CHECK CONSTRAINT [FK_ticketAccountancies_Tickets_TicketId]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_patients_PatientId] FOREIGN KEY([PatientId])
REFERENCES [dbo].[patients] ([PatientId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_patients_PatientId]
GO
USE [master]
GO
ALTER DATABASE [IDS] SET  READ_WRITE 
GO
