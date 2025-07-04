USE [master];
GO

CREATE DATABASE [IDS]
CONTAINMENT = NONE
WITH 
    CATALOG_COLLATION = DATABASE_DEFAULT,
    LEDGER = OFF;
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/28/2025 12:10:44 AM ******/
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
/****** Object:  Table [dbo].[Asnans]    Script Date: 6/28/2025 12:10:44 AM ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 6/28/2025 12:10:44 AM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/28/2025 12:10:44 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/28/2025 12:10:44 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/28/2025 12:10:44 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/28/2025 12:10:44 AM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/28/2025 12:10:44 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 6/28/2025 12:10:44 AM ******/
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
/****** Object:  Table [dbo].[Clinics]    Script Date: 6/28/2025 12:10:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clinics](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Supervisor] [nvarchar](450) NOT NULL,
	[TicketsCount] [int] NOT NULL,
	[ArabicName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Clinics] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Developers]    Script Date: 6/28/2025 12:10:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Developers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Role] [nvarchar](max) NOT NULL,
	[Photo] [varbinary](max) NOT NULL,
	[Links] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Developers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 6/28/2025 12:10:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[Id] [nvarchar](450) NOT NULL,
	[ClinicId] [int] NULL,
	[ActivePatientsUnderResposibility] [int] NOT NULL,
	[Successfulcases] [int] NOT NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalHistories]    Script Date: 6/28/2025 12:10:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalHistories](
	[Id] [nvarchar](14) NOT NULL,
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
/****** Object:  Table [dbo].[patients]    Script Date: 6/28/2025 12:10:44 AM ******/
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
	[UserId] [nvarchar](450) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_patients] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReferredTo]    Script Date: 6/28/2025 12:10:44 AM ******/
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
/****** Object:  Table [dbo].[ticketAccountancies]    Script Date: 6/28/2025 12:10:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticketAccountancies](
	[TicketId] [nvarchar](450) NOT NULL,
	[ReceptionEmpId] [nvarchar](450) NOT NULL,
	[DiagnosisDocId] [nvarchar](450) NULL,
	[ClinicDocId] [nvarchar](450) NULL,
 CONSTRAINT [PK_ticketAccountancies] PRIMARY KEY CLUSTERED 
(
	[TicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 6/28/2025 12:10:44 AM ******/
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
	[ClinicId] [int] NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[TicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250517160938_yarb-MyBestMigEver', N'9.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250517162441_EditTicketAccountanct', N'9.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250618233041_AddingDoctorsAndClinics', N'9.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250619005219_smallMod', N'9.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250621014445_EditTicketAndClinic', N'9.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250621044152_addSystemDeveloper', N'9.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250622050319_addIdOfClinicDoc', N'9.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250623152846_AddUserIdToPatients', N'9.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250623173554_AddCreatedAtToPatients', N'9.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250624031134_NoRiskNoFun', N'9.0.2')
GO
INSERT [dbo].[Asnans] ([Id], [tooth11], [tooth12], [tooth13], [tooth14], [tooth15], [tooth16], [tooth17], [tooth18], [tooth21], [tooth22], [tooth23], [tooth24], [tooth25], [tooth26], [tooth27], [tooth28], [tooth31], [tooth32], [tooth33], [tooth34], [tooth35], [tooth36], [tooth37], [tooth38], [tooth41], [tooth42], [tooth43], [tooth44], [tooth45], [tooth46], [tooth47], [tooth48]) VALUES (N'227642', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Asnans] ([Id], [tooth11], [tooth12], [tooth13], [tooth14], [tooth15], [tooth16], [tooth17], [tooth18], [tooth21], [tooth22], [tooth23], [tooth24], [tooth25], [tooth26], [tooth27], [tooth28], [tooth31], [tooth32], [tooth33], [tooth34], [tooth35], [tooth36], [tooth37], [tooth38], [tooth41], [tooth42], [tooth43], [tooth44], [tooth45], [tooth46], [tooth47], [tooth48]) VALUES (N'252051', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Asnans] ([Id], [tooth11], [tooth12], [tooth13], [tooth14], [tooth15], [tooth16], [tooth17], [tooth18], [tooth21], [tooth22], [tooth23], [tooth24], [tooth25], [tooth26], [tooth27], [tooth28], [tooth31], [tooth32], [tooth33], [tooth34], [tooth35], [tooth36], [tooth37], [tooth38], [tooth41], [tooth42], [tooth43], [tooth44], [tooth45], [tooth46], [tooth47], [tooth48]) VALUES (N'283510', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Asnans] ([Id], [tooth11], [tooth12], [tooth13], [tooth14], [tooth15], [tooth16], [tooth17], [tooth18], [tooth21], [tooth22], [tooth23], [tooth24], [tooth25], [tooth26], [tooth27], [tooth28], [tooth31], [tooth32], [tooth33], [tooth34], [tooth35], [tooth36], [tooth37], [tooth38], [tooth41], [tooth42], [tooth43], [tooth44], [tooth45], [tooth46], [tooth47], [tooth48]) VALUES (N'325768', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Asnans] ([Id], [tooth11], [tooth12], [tooth13], [tooth14], [tooth15], [tooth16], [tooth17], [tooth18], [tooth21], [tooth22], [tooth23], [tooth24], [tooth25], [tooth26], [tooth27], [tooth28], [tooth31], [tooth32], [tooth33], [tooth34], [tooth35], [tooth36], [tooth37], [tooth38], [tooth41], [tooth42], [tooth43], [tooth44], [tooth45], [tooth46], [tooth47], [tooth48]) VALUES (N'356558', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Asnans] ([Id], [tooth11], [tooth12], [tooth13], [tooth14], [tooth15], [tooth16], [tooth17], [tooth18], [tooth21], [tooth22], [tooth23], [tooth24], [tooth25], [tooth26], [tooth27], [tooth28], [tooth31], [tooth32], [tooth33], [tooth34], [tooth35], [tooth36], [tooth37], [tooth38], [tooth41], [tooth42], [tooth43], [tooth44], [tooth45], [tooth46], [tooth47], [tooth48]) VALUES (N'419418', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Asnans] ([Id], [tooth11], [tooth12], [tooth13], [tooth14], [tooth15], [tooth16], [tooth17], [tooth18], [tooth21], [tooth22], [tooth23], [tooth24], [tooth25], [tooth26], [tooth27], [tooth28], [tooth31], [tooth32], [tooth33], [tooth34], [tooth35], [tooth36], [tooth37], [tooth38], [tooth41], [tooth42], [tooth43], [tooth44], [tooth45], [tooth46], [tooth47], [tooth48]) VALUES (N'459082', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Asnans] ([Id], [tooth11], [tooth12], [tooth13], [tooth14], [tooth15], [tooth16], [tooth17], [tooth18], [tooth21], [tooth22], [tooth23], [tooth24], [tooth25], [tooth26], [tooth27], [tooth28], [tooth31], [tooth32], [tooth33], [tooth34], [tooth35], [tooth36], [tooth37], [tooth38], [tooth41], [tooth42], [tooth43], [tooth44], [tooth45], [tooth46], [tooth47], [tooth48]) VALUES (N'585994', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Asnans] ([Id], [tooth11], [tooth12], [tooth13], [tooth14], [tooth15], [tooth16], [tooth17], [tooth18], [tooth21], [tooth22], [tooth23], [tooth24], [tooth25], [tooth26], [tooth27], [tooth28], [tooth31], [tooth32], [tooth33], [tooth34], [tooth35], [tooth36], [tooth37], [tooth38], [tooth41], [tooth42], [tooth43], [tooth44], [tooth45], [tooth46], [tooth47], [tooth48]) VALUES (N'719305', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Asnans] ([Id], [tooth11], [tooth12], [tooth13], [tooth14], [tooth15], [tooth16], [tooth17], [tooth18], [tooth21], [tooth22], [tooth23], [tooth24], [tooth25], [tooth26], [tooth27], [tooth28], [tooth31], [tooth32], [tooth33], [tooth34], [tooth35], [tooth36], [tooth37], [tooth38], [tooth41], [tooth42], [tooth43], [tooth44], [tooth45], [tooth46], [tooth47], [tooth48]) VALUES (N'721947', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Asnans] ([Id], [tooth11], [tooth12], [tooth13], [tooth14], [tooth15], [tooth16], [tooth17], [tooth18], [tooth21], [tooth22], [tooth23], [tooth24], [tooth25], [tooth26], [tooth27], [tooth28], [tooth31], [tooth32], [tooth33], [tooth34], [tooth35], [tooth36], [tooth37], [tooth38], [tooth41], [tooth42], [tooth43], [tooth44], [tooth45], [tooth46], [tooth47], [tooth48]) VALUES (N'75292', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Asnans] ([Id], [tooth11], [tooth12], [tooth13], [tooth14], [tooth15], [tooth16], [tooth17], [tooth18], [tooth21], [tooth22], [tooth23], [tooth24], [tooth25], [tooth26], [tooth27], [tooth28], [tooth31], [tooth32], [tooth33], [tooth34], [tooth35], [tooth36], [tooth37], [tooth38], [tooth41], [tooth42], [tooth43], [tooth44], [tooth45], [tooth46], [tooth47], [tooth48]) VALUES (N'759238', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Asnans] ([Id], [tooth11], [tooth12], [tooth13], [tooth14], [tooth15], [tooth16], [tooth17], [tooth18], [tooth21], [tooth22], [tooth23], [tooth24], [tooth25], [tooth26], [tooth27], [tooth28], [tooth31], [tooth32], [tooth33], [tooth34], [tooth35], [tooth36], [tooth37], [tooth38], [tooth41], [tooth42], [tooth43], [tooth44], [tooth45], [tooth46], [tooth47], [tooth48]) VALUES (N'810763', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Asnans] ([Id], [tooth11], [tooth12], [tooth13], [tooth14], [tooth15], [tooth16], [tooth17], [tooth18], [tooth21], [tooth22], [tooth23], [tooth24], [tooth25], [tooth26], [tooth27], [tooth28], [tooth31], [tooth32], [tooth33], [tooth34], [tooth35], [tooth36], [tooth37], [tooth38], [tooth41], [tooth42], [tooth43], [tooth44], [tooth45], [tooth46], [tooth47], [tooth48]) VALUES (N'815050', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Asnans] ([Id], [tooth11], [tooth12], [tooth13], [tooth14], [tooth15], [tooth16], [tooth17], [tooth18], [tooth21], [tooth22], [tooth23], [tooth24], [tooth25], [tooth26], [tooth27], [tooth28], [tooth31], [tooth32], [tooth33], [tooth34], [tooth35], [tooth36], [tooth37], [tooth38], [tooth41], [tooth42], [tooth43], [tooth44], [tooth45], [tooth46], [tooth47], [tooth48]) VALUES (N'875123', 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Asnans] ([Id], [tooth11], [tooth12], [tooth13], [tooth14], [tooth15], [tooth16], [tooth17], [tooth18], [tooth21], [tooth22], [tooth23], [tooth24], [tooth25], [tooth26], [tooth27], [tooth28], [tooth31], [tooth32], [tooth33], [tooth34], [tooth35], [tooth36], [tooth37], [tooth38], [tooth41], [tooth42], [tooth43], [tooth44], [tooth45], [tooth46], [tooth47], [tooth48]) VALUES (N'895747', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1893258f-030c-4fd5-9178-f6f2343fbc4a', N'User', N'USER', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1893258f-030c-4fd5-9178-f6f2343fbc4b', N'Reception', N'RECEPTION', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1893258f-030c-4fd5-9178-f6f2343fbc4c', N'Diagnosis-Doc', N'DIAGNOSIS-DOC', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1893258f-030c-4fd5-9178-f6f2343fbc4d', N'Admin', N'ADMIN', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1893258f-030c-4fd5-9178-f6f2343fbc4e', N'CPresident', N'CPRESIDENT', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1893258f-030c-4fd5-9178-f6f2343fbc4f', N'EDoctor', N'EDOCTOR', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1893258f-030c-4fd5-9178-f6f2343fbc4g', N'Diagnosis-Nurse', N'DIAGNOSIS-NURSE', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9f4ec2b5-e538-4cf5-8b08-cea1a77415d9', N'1893258f-030c-4fd5-9178-f6f2343fbc4b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9e532cca-44de-4ffc-a90d-53d48431bd33', N'1893258f-030c-4fd5-9178-f6f2343fbc4c')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd7e57d6d-979c-4207-892c-1c5ff6c97fdc', N'1893258f-030c-4fd5-9178-f6f2343fbc4d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'68c33a65-7048-45ed-b04b-eb21046afc86', N'1893258f-030c-4fd5-9178-f6f2343fbc4e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b8842b73-db35-46e2-94b6-201a39f52f7c', N'1893258f-030c-4fd5-9178-f6f2343fbc4e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3bc9fca2-990f-48af-b413-ad1e49daae4d', N'1893258f-030c-4fd5-9178-f6f2343fbc4f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'204a256e-212a-425b-b269-f5fced8f8b69', N'1893258f-030c-4fd5-9178-f6f2343fbc4g')
GO
INSERT [dbo].[AspNetUsers] ([Id], [NationalId], [FullName], [Address], [Role], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'204a256e-212a-425b-b269-f5fced8f8b69', N'30305182501000', N'يحيي أيمن محمد', N'Assiut', N'Diagnosis-Nurse', N'badrDiagnosisNurse', N'BADRDIAGNOSISNURSE', N'badr.ahmed.0016@gmail.com', N'BADR.AHMED.0016@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEKM6W+ej0+QtpW1LvQZ8UnOfPWur56sUJV0Vnh7o/eNtL1UirxeZlRE0I4GZegS5CA==', N'VDA6BUKNHRTPJ6VSP35S23MLUC5V44EB', N'64570a66-9ded-4fb4-8d33-1be0765ad1af', N'01013287777', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [NationalId], [FullName], [Address], [Role], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3bc9fca2-990f-48af-b413-ad1e49daae4d', N'30305999901352', N'ابو عبيده بدر أحمد', N'Assiut', N'EDoctor', N'badrEDoc', N'BADREDOC', N'badr.ahmed.0096@gmail.com', N'BADR.AHMED.0096@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAECRsOeCaMgIdI0OXgPsvrOi+kf7hy6I3lmVNOKU6FtVMGzc+Tz0Nj9NcpShVb9k3ow==', N'CJBX76BAOY2PYA4QASWDPFSFICRTRGRE', N'129b7e3a-6e73-468a-a971-437330406f72', N'01099987537', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [NationalId], [FullName], [Address], [Role], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'68c33a65-7048-45ed-b04b-eb21046afc86', N'30305182501350', N'بدر إيلون ماسك', N'Assiut', N'CPresident', N'EndPresident', N'ENDPRESIDENT', N'badr.ahmed.2086@gmail.com', N'BADR.AHMED.2086@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEDjwpd2NX+UE1kmAsln4kDwpOeXtNzwPMwhScLfYwy38C8HwK9o4jXsUgxHN0ZxIxg==', N'W55AAFS66GZTUQ3RXCUTJ6BQTCDXMEUA', N'3da0f01a-2db0-4dd3-9e11-fb0ef11cac0d', N'01013287531', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [NationalId], [FullName], [Address], [Role], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'9e532cca-44de-4ffc-a90d-53d48431bd33', N'30305182501352', N'بدر أحمد البدري', N'Assiut', N'Diagnosis-Doc', N'docDiagnosis', N'DOCDIAGNOSIS', N'badr.ahmed.2986@gmail.com', N'BADR.AHMED.2986@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEKfJPikqdvCMdWUUJqtNi7NVBRWyA57KnmszVrqOUb0scwychgDXt2YSQV9xmTXcrQ==', N'3JSS2LI7TCLP3AMVS3UAFSMUUT72RI3T', N'62a902f9-44f2-47cd-93a2-d0654c342d59', N'01013287530', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [NationalId], [FullName], [Address], [Role], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'9f4ec2b5-e538-4cf5-8b08-cea1a77415d9', N'30305182501352', N'يحيي أيمن محمد', N'Assiut', N'Reception', N'badrReception', N'BADRRECEPTION', N'badr.ahmed.2316@gmail.com', N'BADR.AHMED.2316@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEPzi5pBvrKdcDNF47YsR7mW7rEbff0zrKnLkOjJpfuTYabYfpr/Lmew0HBNENmzKXw==', N'UV3S4THHP3RVUEHT55KF3DAO4L6UOONH', N'50a1dcff-7b1d-4bb8-8603-f002b9af8efb', N'01013287535', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [NationalId], [FullName], [Address], [Role], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'b8842b73-db35-46e2-94b6-201a39f52f7c', N'30305182501333', N'بدر أحمد البدري راشد', N'القاهره', N'CPresident', N'EndBadr2', N'ENDBADR2', N'badr.ahmed.2211@gmial.com', N'BADR.AHMED.2211@GMIAL.COM', 0, N'AQAAAAIAAYagAAAAEODk42WPeM+wL7fBDhKawa8Vm8dERonykqR6wHyf41QE8nBa7z/8AeoG8LrTsFIF1Q==', N'S5YPHHARZQ4VP7UVIHQLJSKZTMGQE3M4', N'c15b8d5d-e85a-4a0b-aad6-f099f70dc716', N'01113287111', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [NationalId], [FullName], [Address], [Role], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd7e57d6d-979c-4207-892c-1c5ff6c97fdc', N'30305182501352', N'بدر أحمد البدري', N'Assiut', N'Admin', N'badr2003', N'BADR2003', N'badr.ahmed.2016@gmail.com', N'BADR.AHMED.2016@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEBFTbsTqglXnVsHLZ/KdyWpkINnXhn3oteoLbSVJChpeZVaktG9dNT3Jx2I20jK41A==', N'7YZ7MWSCRSC7YG3DHRG54CCFJGSCPE5P', N'ee44eede-0b0a-4bf7-a20f-3eb8e5711673', N'01013287537', 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Clinics] ON 

INSERT [dbo].[Clinics] ([Id], [Name], [Supervisor], [TicketsCount], [ArabicName]) VALUES (1, N'Endodont', N'68c33a65-7048-45ed-b04b-eb21046afc86', 1, N'علاج الجذور')
SET IDENTITY_INSERT [dbo].[Clinics] OFF
GO
INSERT [dbo].[Doctors] ([Id], [ClinicId], [ActivePatientsUnderResposibility], [Successfulcases]) VALUES (N'3bc9fca2-990f-48af-b413-ad1e49daae4d', 1, 3, 0)
INSERT [dbo].[Doctors] ([Id], [ClinicId], [ActivePatientsUnderResposibility], [Successfulcases]) VALUES (N'b8842b73-db35-46e2-94b6-201a39f52f7c', 1, 5, 0)
GO
INSERT [dbo].[MedicalHistories] ([Id], [HeartTrouble], [Hyperttention], [Pregnancy], [Diabetes], [Hepatitis], [AIDs], [Tuberculosis], [Allergies], [Anemia], [Rheumatism], [RadTherapy], [Haemophilia], [AspirinIntake], [KidneyTroubles], [Asthma], [HayFever], [MedicalHistoryText]) VALUES (N'20205182501352', 0, 0, 0, 0, N'A', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'N/A')
INSERT [dbo].[MedicalHistories] ([Id], [HeartTrouble], [Hyperttention], [Pregnancy], [Diabetes], [Hepatitis], [AIDs], [Tuberculosis], [Allergies], [Anemia], [Rheumatism], [RadTherapy], [Haemophilia], [AspirinIntake], [KidneyTroubles], [Asthma], [HayFever], [MedicalHistoryText]) VALUES (N'20305182501352', 0, 0, 0, 0, N'A', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'N/A')
INSERT [dbo].[MedicalHistories] ([Id], [HeartTrouble], [Hyperttention], [Pregnancy], [Diabetes], [Hepatitis], [AIDs], [Tuberculosis], [Allergies], [Anemia], [Rheumatism], [RadTherapy], [Haemophilia], [AspirinIntake], [KidneyTroubles], [Asthma], [HayFever], [MedicalHistoryText]) VALUES (N'30305182501352', 1, 1, 0, 0, N'A', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, N'N/Axcv sdvsdv')
INSERT [dbo].[MedicalHistories] ([Id], [HeartTrouble], [Hyperttention], [Pregnancy], [Diabetes], [Hepatitis], [AIDs], [Tuberculosis], [Allergies], [Anemia], [Rheumatism], [RadTherapy], [Haemophilia], [AspirinIntake], [KidneyTroubles], [Asthma], [HayFever], [MedicalHistoryText]) VALUES (N'30501122500334', 0, 0, 0, 0, N'A', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'N/A')
INSERT [dbo].[MedicalHistories] ([Id], [HeartTrouble], [Hyperttention], [Pregnancy], [Diabetes], [Hepatitis], [AIDs], [Tuberculosis], [Allergies], [Anemia], [Rheumatism], [RadTherapy], [Haemophilia], [AspirinIntake], [KidneyTroubles], [Asthma], [HayFever], [MedicalHistoryText]) VALUES (N'30506142502254', 0, 0, 0, 0, N'A', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'N/A')
GO
INSERT [dbo].[patients] ([PatientId], [Name], [Address], [profession], [phoneNumber], [Gender], [Age], [UserId], [CreatedAt]) VALUES (N'20205182501352', N'أحمد محمد عبدالعزيز', N'Assiut', N'مهندس برمجيات', N'01013287537', N'Male', 23, NULL, CAST(N'2025-06-24T08:23:42.3660043' AS DateTime2))
INSERT [dbo].[patients] ([PatientId], [Name], [Address], [profession], [phoneNumber], [Gender], [Age], [UserId], [CreatedAt]) VALUES (N'20305182501352', N'عبده عماد', N'N/A', N'N/A', N'01113287537', N'Male', 23, NULL, CAST(N'2025-06-24T09:23:14.6266927' AS DateTime2))
INSERT [dbo].[patients] ([PatientId], [Name], [Address], [profession], [phoneNumber], [Gender], [Age], [UserId], [CreatedAt]) VALUES (N'30305182501352', N'بدر أحمد البدري', N'Assiut', N'مهندس برمجيات', N'01013287517', N'Male', 23, NULL, CAST(N'2025-06-24T08:23:14.1468321' AS DateTime2))
INSERT [dbo].[patients] ([PatientId], [Name], [Address], [profession], [phoneNumber], [Gender], [Age], [UserId], [CreatedAt]) VALUES (N'30501122500334', N'عمر احمد عصمت', N'اسيوط الجديدة', N'طالب', N'01550143955', N'Male', 20, NULL, CAST(N'2025-06-24T09:22:28.4597524' AS DateTime2))
INSERT [dbo].[patients] ([PatientId], [Name], [Address], [profession], [phoneNumber], [Gender], [Age], [UserId], [CreatedAt]) VALUES (N'30506142502254', N'يحيي أيمن محمد', N'القاهره', N'مهندس برمجيات', N'01113287537', N'Male', 22, NULL, CAST(N'2025-06-24T09:06:23.2570809' AS DateTime2))
GO
INSERT [dbo].[ReferredTo] ([Id], [Oral], [RemovableProsth], [Operative], [Endodontic], [Ortho], [CrownAndBridge], [Surgery], [Pedo], [XRay]) VALUES (N'227642', 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[ReferredTo] ([Id], [Oral], [RemovableProsth], [Operative], [Endodontic], [Ortho], [CrownAndBridge], [Surgery], [Pedo], [XRay]) VALUES (N'252051', 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[ReferredTo] ([Id], [Oral], [RemovableProsth], [Operative], [Endodontic], [Ortho], [CrownAndBridge], [Surgery], [Pedo], [XRay]) VALUES (N'283510', 0, 0, 0, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[ReferredTo] ([Id], [Oral], [RemovableProsth], [Operative], [Endodontic], [Ortho], [CrownAndBridge], [Surgery], [Pedo], [XRay]) VALUES (N'325768', 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[ReferredTo] ([Id], [Oral], [RemovableProsth], [Operative], [Endodontic], [Ortho], [CrownAndBridge], [Surgery], [Pedo], [XRay]) VALUES (N'356558', 0, 0, 0, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[ReferredTo] ([Id], [Oral], [RemovableProsth], [Operative], [Endodontic], [Ortho], [CrownAndBridge], [Surgery], [Pedo], [XRay]) VALUES (N'419418', 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[ReferredTo] ([Id], [Oral], [RemovableProsth], [Operative], [Endodontic], [Ortho], [CrownAndBridge], [Surgery], [Pedo], [XRay]) VALUES (N'459082', 0, 0, 0, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[ReferredTo] ([Id], [Oral], [RemovableProsth], [Operative], [Endodontic], [Ortho], [CrownAndBridge], [Surgery], [Pedo], [XRay]) VALUES (N'585994', 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[ReferredTo] ([Id], [Oral], [RemovableProsth], [Operative], [Endodontic], [Ortho], [CrownAndBridge], [Surgery], [Pedo], [XRay]) VALUES (N'719305', 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[ReferredTo] ([Id], [Oral], [RemovableProsth], [Operative], [Endodontic], [Ortho], [CrownAndBridge], [Surgery], [Pedo], [XRay]) VALUES (N'721947', 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[ReferredTo] ([Id], [Oral], [RemovableProsth], [Operative], [Endodontic], [Ortho], [CrownAndBridge], [Surgery], [Pedo], [XRay]) VALUES (N'75292', 0, 0, 0, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[ReferredTo] ([Id], [Oral], [RemovableProsth], [Operative], [Endodontic], [Ortho], [CrownAndBridge], [Surgery], [Pedo], [XRay]) VALUES (N'759238', 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[ReferredTo] ([Id], [Oral], [RemovableProsth], [Operative], [Endodontic], [Ortho], [CrownAndBridge], [Surgery], [Pedo], [XRay]) VALUES (N'810763', 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[ReferredTo] ([Id], [Oral], [RemovableProsth], [Operative], [Endodontic], [Ortho], [CrownAndBridge], [Surgery], [Pedo], [XRay]) VALUES (N'815050', 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[ReferredTo] ([Id], [Oral], [RemovableProsth], [Operative], [Endodontic], [Ortho], [CrownAndBridge], [Surgery], [Pedo], [XRay]) VALUES (N'875123', 0, 0, 0, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[ReferredTo] ([Id], [Oral], [RemovableProsth], [Operative], [Endodontic], [Ortho], [CrownAndBridge], [Surgery], [Pedo], [XRay]) VALUES (N'895747', 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[ticketAccountancies] ([TicketId], [ReceptionEmpId], [DiagnosisDocId], [ClinicDocId]) VALUES (N'227642', N'9f4ec2b5-e538-4cf5-8b08-cea1a77415d9', NULL, NULL)
INSERT [dbo].[ticketAccountancies] ([TicketId], [ReceptionEmpId], [DiagnosisDocId], [ClinicDocId]) VALUES (N'252051', N'9f4ec2b5-e538-4cf5-8b08-cea1a77415d9', NULL, NULL)
INSERT [dbo].[ticketAccountancies] ([TicketId], [ReceptionEmpId], [DiagnosisDocId], [ClinicDocId]) VALUES (N'283510', N'9f4ec2b5-e538-4cf5-8b08-cea1a77415d9', NULL, N'3bc9fca2-990f-48af-b413-ad1e49daae4d')
INSERT [dbo].[ticketAccountancies] ([TicketId], [ReceptionEmpId], [DiagnosisDocId], [ClinicDocId]) VALUES (N'325768', N'9f4ec2b5-e538-4cf5-8b08-cea1a77415d9', NULL, NULL)
INSERT [dbo].[ticketAccountancies] ([TicketId], [ReceptionEmpId], [DiagnosisDocId], [ClinicDocId]) VALUES (N'356558', N'9f4ec2b5-e538-4cf5-8b08-cea1a77415d9', NULL, N'3bc9fca2-990f-48af-b413-ad1e49daae4d')
INSERT [dbo].[ticketAccountancies] ([TicketId], [ReceptionEmpId], [DiagnosisDocId], [ClinicDocId]) VALUES (N'419418', N'9f4ec2b5-e538-4cf5-8b08-cea1a77415d9', NULL, NULL)
INSERT [dbo].[ticketAccountancies] ([TicketId], [ReceptionEmpId], [DiagnosisDocId], [ClinicDocId]) VALUES (N'459082', N'9f4ec2b5-e538-4cf5-8b08-cea1a77415d9', NULL, N'b8842b73-db35-46e2-94b6-201a39f52f7c')
INSERT [dbo].[ticketAccountancies] ([TicketId], [ReceptionEmpId], [DiagnosisDocId], [ClinicDocId]) VALUES (N'585994', N'9f4ec2b5-e538-4cf5-8b08-cea1a77415d9', NULL, N'b8842b73-db35-46e2-94b6-201a39f52f7c')
INSERT [dbo].[ticketAccountancies] ([TicketId], [ReceptionEmpId], [DiagnosisDocId], [ClinicDocId]) VALUES (N'719305', N'9f4ec2b5-e538-4cf5-8b08-cea1a77415d9', NULL, NULL)
INSERT [dbo].[ticketAccountancies] ([TicketId], [ReceptionEmpId], [DiagnosisDocId], [ClinicDocId]) VALUES (N'721947', N'9f4ec2b5-e538-4cf5-8b08-cea1a77415d9', NULL, NULL)
INSERT [dbo].[ticketAccountancies] ([TicketId], [ReceptionEmpId], [DiagnosisDocId], [ClinicDocId]) VALUES (N'75292', N'9f4ec2b5-e538-4cf5-8b08-cea1a77415d9', NULL, N'3bc9fca2-990f-48af-b413-ad1e49daae4d')
INSERT [dbo].[ticketAccountancies] ([TicketId], [ReceptionEmpId], [DiagnosisDocId], [ClinicDocId]) VALUES (N'759238', N'9f4ec2b5-e538-4cf5-8b08-cea1a77415d9', NULL, NULL)
INSERT [dbo].[ticketAccountancies] ([TicketId], [ReceptionEmpId], [DiagnosisDocId], [ClinicDocId]) VALUES (N'810763', N'9f4ec2b5-e538-4cf5-8b08-cea1a77415d9', NULL, NULL)
INSERT [dbo].[ticketAccountancies] ([TicketId], [ReceptionEmpId], [DiagnosisDocId], [ClinicDocId]) VALUES (N'815050', N'9f4ec2b5-e538-4cf5-8b08-cea1a77415d9', NULL, NULL)
INSERT [dbo].[ticketAccountancies] ([TicketId], [ReceptionEmpId], [DiagnosisDocId], [ClinicDocId]) VALUES (N'875123', N'9f4ec2b5-e538-4cf5-8b08-cea1a77415d9', NULL, NULL)
INSERT [dbo].[ticketAccountancies] ([TicketId], [ReceptionEmpId], [DiagnosisDocId], [ClinicDocId]) VALUES (N'895747', N'9f4ec2b5-e538-4cf5-8b08-cea1a77415d9', NULL, NULL)
GO
INSERT [dbo].[Tickets] ([TicketId], [PatientId], [AppointmentDate], [ChiefComlant], [PrevisionalDiagnosis], [NextDate], [Status], [IsValid], [LevelOfCompletness], [ClinicId]) VALUES (N'227642', N'30305182501352', CAST(N'2025-06-27T23:52:27.3568677' AS DateTime2), N'N/A', N'N/A', NULL, N'1', 1, NULL, NULL)
INSERT [dbo].[Tickets] ([TicketId], [PatientId], [AppointmentDate], [ChiefComlant], [PrevisionalDiagnosis], [NextDate], [Status], [IsValid], [LevelOfCompletness], [ClinicId]) VALUES (N'252051', N'30305182501352', CAST(N'2025-06-27T23:52:12.1682773' AS DateTime2), N'N/A', N'N/A', NULL, N'1', 1, NULL, NULL)
INSERT [dbo].[Tickets] ([TicketId], [PatientId], [AppointmentDate], [ChiefComlant], [PrevisionalDiagnosis], [NextDate], [Status], [IsValid], [LevelOfCompletness], [ClinicId]) VALUES (N'283510', N'30305182501352', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), N'N/Asdvsdvsdv', N'N/A', NULL, N'5', 1, NULL, 1)
INSERT [dbo].[Tickets] ([TicketId], [PatientId], [AppointmentDate], [ChiefComlant], [PrevisionalDiagnosis], [NextDate], [Status], [IsValid], [LevelOfCompletness], [ClinicId]) VALUES (N'325768', N'30501122500334', CAST(N'2025-06-24T09:23:50.7892775' AS DateTime2), N'N/A', N'N/A', NULL, N'4', 1, NULL, 1)
INSERT [dbo].[Tickets] ([TicketId], [PatientId], [AppointmentDate], [ChiefComlant], [PrevisionalDiagnosis], [NextDate], [Status], [IsValid], [LevelOfCompletness], [ClinicId]) VALUES (N'356558', N'20205182501352', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), N'N/A', N'N/A', NULL, N'5', 1, NULL, 1)
INSERT [dbo].[Tickets] ([TicketId], [PatientId], [AppointmentDate], [ChiefComlant], [PrevisionalDiagnosis], [NextDate], [Status], [IsValid], [LevelOfCompletness], [ClinicId]) VALUES (N'419418', N'30305182501352', CAST(N'2025-06-27T23:52:22.1318106' AS DateTime2), N'N/A', N'N/A', NULL, N'1', 1, NULL, NULL)
INSERT [dbo].[Tickets] ([TicketId], [PatientId], [AppointmentDate], [ChiefComlant], [PrevisionalDiagnosis], [NextDate], [Status], [IsValid], [LevelOfCompletness], [ClinicId]) VALUES (N'459082', N'30305182501352', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), N'Badr Ahmed', N'Swelling', NULL, N'5', 1, NULL, 1)
INSERT [dbo].[Tickets] ([TicketId], [PatientId], [AppointmentDate], [ChiefComlant], [PrevisionalDiagnosis], [NextDate], [Status], [IsValid], [LevelOfCompletness], [ClinicId]) VALUES (N'585994', N'30506142502254', CAST(N'2025-06-24T09:06:02.0829233' AS DateTime2), N'N/A', N'N/A', NULL, N'5', 1, NULL, 1)
INSERT [dbo].[Tickets] ([TicketId], [PatientId], [AppointmentDate], [ChiefComlant], [PrevisionalDiagnosis], [NextDate], [Status], [IsValid], [LevelOfCompletness], [ClinicId]) VALUES (N'719305', N'30305182501352', CAST(N'2025-06-27T23:53:06.1915916' AS DateTime2), N'N/A', N'N/A', NULL, N'1', 1, NULL, NULL)
INSERT [dbo].[Tickets] ([TicketId], [PatientId], [AppointmentDate], [ChiefComlant], [PrevisionalDiagnosis], [NextDate], [Status], [IsValid], [LevelOfCompletness], [ClinicId]) VALUES (N'721947', N'30305182501352', CAST(N'2025-06-24T09:30:17.3058441' AS DateTime2), N'N/A', N'N/A', NULL, N'4', 1, NULL, 1)
INSERT [dbo].[Tickets] ([TicketId], [PatientId], [AppointmentDate], [ChiefComlant], [PrevisionalDiagnosis], [NextDate], [Status], [IsValid], [LevelOfCompletness], [ClinicId]) VALUES (N'75292', N'30305182501352', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), N'N/Accc', N'Swelling', NULL, N'5', 1, NULL, 1)
INSERT [dbo].[Tickets] ([TicketId], [PatientId], [AppointmentDate], [ChiefComlant], [PrevisionalDiagnosis], [NextDate], [Status], [IsValid], [LevelOfCompletness], [ClinicId]) VALUES (N'759238', N'30501122500334', CAST(N'2025-06-24T09:22:26.0188066' AS DateTime2), N'N/A', N'N/A', NULL, N'4', 1, NULL, 1)
INSERT [dbo].[Tickets] ([TicketId], [PatientId], [AppointmentDate], [ChiefComlant], [PrevisionalDiagnosis], [NextDate], [Status], [IsValid], [LevelOfCompletness], [ClinicId]) VALUES (N'810763', N'30305182501352', CAST(N'2025-06-24T09:26:07.7690113' AS DateTime2), N'N/A', N'N/A', NULL, N'4', 1, NULL, 1)
INSERT [dbo].[Tickets] ([TicketId], [PatientId], [AppointmentDate], [ChiefComlant], [PrevisionalDiagnosis], [NextDate], [Status], [IsValid], [LevelOfCompletness], [ClinicId]) VALUES (N'815050', N'20305182501352', CAST(N'2025-06-24T09:23:11.6647923' AS DateTime2), N'N/A', N'N/A', NULL, N'2', 1, NULL, NULL)
INSERT [dbo].[Tickets] ([TicketId], [PatientId], [AppointmentDate], [ChiefComlant], [PrevisionalDiagnosis], [NextDate], [Status], [IsValid], [LevelOfCompletness], [ClinicId]) VALUES (N'875123', N'30305182501352', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), N'N/Acx xv vg', N'Swelling', NULL, N'2', 1, NULL, 1)
INSERT [dbo].[Tickets] ([TicketId], [PatientId], [AppointmentDate], [ChiefComlant], [PrevisionalDiagnosis], [NextDate], [Status], [IsValid], [LevelOfCompletness], [ClinicId]) VALUES (N'895747', N'30305182501352', CAST(N'2025-06-27T23:52:33.1573077' AS DateTime2), N'N/A', N'N/A', NULL, N'1', 1, NULL, NULL)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 6/28/2025 12:10:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 6/28/2025 12:10:44 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 6/28/2025 12:10:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 6/28/2025 12:10:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 6/28/2025 12:10:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 6/28/2025 12:10:44 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 6/28/2025 12:10:44 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Clinics_Supervisor]    Script Date: 6/28/2025 12:10:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Clinics_Supervisor] ON [dbo].[Clinics]
(
	[Supervisor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Doctors_ClinicId]    Script Date: 6/28/2025 12:10:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Doctors_ClinicId] ON [dbo].[Doctors]
(
	[ClinicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_patients_UserId]    Script Date: 6/28/2025 12:10:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_patients_UserId] ON [dbo].[patients]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ticketAccountancies_ClinicDocId]    Script Date: 6/28/2025 12:10:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_ticketAccountancies_ClinicDocId] ON [dbo].[ticketAccountancies]
(
	[ClinicDocId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ticketAccountancies_DiagnosisDocId]    Script Date: 6/28/2025 12:10:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_ticketAccountancies_DiagnosisDocId] ON [dbo].[ticketAccountancies]
(
	[DiagnosisDocId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ticketAccountancies_ReceptionEmpId]    Script Date: 6/28/2025 12:10:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_ticketAccountancies_ReceptionEmpId] ON [dbo].[ticketAccountancies]
(
	[ReceptionEmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tickets_ClinicId]    Script Date: 6/28/2025 12:10:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Tickets_ClinicId] ON [dbo].[Tickets]
(
	[ClinicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Tickets_PatientId]    Script Date: 6/28/2025 12:10:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Tickets_PatientId] ON [dbo].[Tickets]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clinics] ADD  DEFAULT (N'') FOR [ArabicName]
GO
ALTER TABLE [dbo].[patients] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [CreatedAt]
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
ALTER TABLE [dbo].[Clinics]  WITH CHECK ADD  CONSTRAINT [FK_Clinics_AspNetUsers_Supervisor] FOREIGN KEY([Supervisor])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Clinics] CHECK CONSTRAINT [FK_Clinics_AspNetUsers_Supervisor]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_AspNetUsers_Id] FOREIGN KEY([Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_AspNetUsers_Id]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_Clinics_ClinicId] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinics] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_Clinics_ClinicId]
GO
ALTER TABLE [dbo].[MedicalHistories]  WITH CHECK ADD  CONSTRAINT [FK_MedicalHistories_patients_Id] FOREIGN KEY([Id])
REFERENCES [dbo].[patients] ([PatientId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MedicalHistories] CHECK CONSTRAINT [FK_MedicalHistories_patients_Id]
GO
ALTER TABLE [dbo].[patients]  WITH CHECK ADD  CONSTRAINT [FK_patients_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[patients] CHECK CONSTRAINT [FK_patients_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ReferredTo]  WITH CHECK ADD  CONSTRAINT [FK_ReferredTo_Tickets_Id] FOREIGN KEY([Id])
REFERENCES [dbo].[Tickets] ([TicketId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReferredTo] CHECK CONSTRAINT [FK_ReferredTo_Tickets_Id]
GO
ALTER TABLE [dbo].[ticketAccountancies]  WITH CHECK ADD  CONSTRAINT [FK_ticketAccountancies_AspNetUsers_ClinicDocId] FOREIGN KEY([ClinicDocId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ticketAccountancies] CHECK CONSTRAINT [FK_ticketAccountancies_AspNetUsers_ClinicDocId]
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
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Clinics_ClinicId] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinics] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Clinics_ClinicId]
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
