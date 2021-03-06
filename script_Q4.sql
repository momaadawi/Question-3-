USE [master]
GO
/****** Object:  Database [Company]    Script Date: 12/24/2018 1:54:51 AM ******/
CREATE DATABASE [Company]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Company', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Company.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Company_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Company_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Company] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Company].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Company] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Company] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Company] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Company] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Company] SET ARITHABORT OFF 
GO
ALTER DATABASE [Company] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Company] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Company] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Company] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Company] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Company] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Company] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Company] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Company] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Company] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Company] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Company] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Company] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Company] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Company] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Company] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Company] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Company] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Company] SET  MULTI_USER 
GO
ALTER DATABASE [Company] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Company] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Company] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Company] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Company] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Company]
GO
/****** Object:  Table [dbo].[City]    Script Date: 12/24/2018 1:54:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](50) NULL,
	[CountryId] [int] NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 12/24/2018 1:54:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 12/24/2018 1:54:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeprtmentName] [nvarchar](50) NULL,
	[Location] [nvarchar](50) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[District]    Script Date: 12/24/2018 1:54:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DistrictName] [nvarchar](50) NULL,
	[CityId] [int] NULL,
 CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/24/2018 1:54:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Salary] [int] NULL,
	[DeptId] [int] NULL,
	[DistrictId] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogData]    Script Date: 12/24/2018 1:54:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogData](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](50) NULL,
	[ColumnName] [nvarchar](50) NULL,
	[ActionType] [nvarchar](50) NULL,
	[ActionDateTime] [datetime] NULL CONSTRAINT [DF_LogData_ActionDateTime]  DEFAULT (getdate()),
	[NewValue] [nvarchar](50) NULL,
	[OldValue] [nvarchar](50) NULL,
 CONSTRAINT [PK_LogData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Project]    Script Date: 12/24/2018 1:54:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectEmployee]    Script Date: 12/24/2018 1:54:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectEmployee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NULL,
	[EmployeeId] [int] NULL,
 CONSTRAINT [PK_ProjectEmployee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[department_empcount_projectcount]    Script Date: 12/24/2018 1:54:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[department_empcount_projectcount]
as
SELECT  d.[DeprtmentName] ,
		count(DISTINCT p.[Id]) AS Employees,
		sum(e.[Salary]) AS [Total Salary],
		count(p.[Id]) AS Pojects
	FROM
	[dbo].[Department] as d  join  [dbo].[Employee] as e
	on d.id = e.[DeptId]  join [dbo].[ProjectEmployee] as p
	on e.id = p.[EmployeeId]  join [dbo].[Project]  on p.[ProjectId] = [dbo].[Project].[Id] 
	group by (d.[DeprtmentName])
GO
/****** Object:  View [dbo].[display_all_data]    Script Date: 12/24/2018 1:54:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[display_all_data]
as
SELECT        dbo.Employee.Name, dbo.Project.ProjectName, dbo.Department.DeprtmentName, dbo.Department.Location, dbo.Employee.Salary, dbo.Country.CountryName, dbo.City.CityName, dbo.District.DistrictName
FROM            dbo.City INNER JOIN
                         dbo.Country ON dbo.City.CountryId = dbo.Country.Id INNER JOIN
                         dbo.Department ON dbo.City.Id = dbo.Department.Id INNER JOIN
                         dbo.District ON dbo.City.Id = dbo.District.CityId INNER JOIN
                         dbo.Employee ON dbo.Department.Id = dbo.Employee.DeptId AND dbo.District.Id = dbo.Employee.DistrictId INNER JOIN
                         dbo.Project ON dbo.City.Id = dbo.Project.Id INNER JOIN
                         dbo.ProjectEmployee ON dbo.Employee.Id = dbo.ProjectEmployee.Id AND dbo.Project.Id = dbo.ProjectEmployee.ProjectId
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [DeprtmentName], [Location]) VALUES (1, N'a', NULL)
INSERT [dbo].[Department] ([Id], [DeprtmentName], [Location]) VALUES (2, N'b', NULL)
INSERT [dbo].[Department] ([Id], [DeprtmentName], [Location]) VALUES (3, N'c', NULL)
INSERT [dbo].[Department] ([Id], [DeprtmentName], [Location]) VALUES (4, N'd', NULL)
INSERT [dbo].[Department] ([Id], [DeprtmentName], [Location]) VALUES (5, N'e', NULL)
INSERT [dbo].[Department] ([Id], [DeprtmentName], [Location]) VALUES (6, N'f', NULL)
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Name], [Salary], [DeptId], [DistrictId]) VALUES (1, N'a', 10, 1, NULL)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [DeptId], [DistrictId]) VALUES (2, N'b', 20, 2, NULL)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [DeptId], [DistrictId]) VALUES (3, N'c', 30, 3, NULL)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [DeptId], [DistrictId]) VALUES (4, N'd', 40, 1, NULL)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [DeptId], [DistrictId]) VALUES (5, N'e', 50, 2, NULL)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [DeptId], [DistrictId]) VALUES (6, N'f', 60, 3, NULL)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [DeptId], [DistrictId]) VALUES (7, N'g', 70, 1, NULL)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [DeptId], [DistrictId]) VALUES (8, N'ahmed', 1000, 2, NULL)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [DeptId], [DistrictId]) VALUES (10, N'ahmed', 1000, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[LogData] ON 

INSERT [dbo].[LogData] ([Id], [TableName], [ColumnName], [ActionType], [ActionDateTime], [NewValue], [OldValue]) VALUES (1, N'[dbo].[Employee]', N'[Name]', N'Updated', CAST(N'2018-12-24 01:52:10.110' AS DateTime), N'ahmed', N'e')
INSERT [dbo].[LogData] ([Id], [TableName], [ColumnName], [ActionType], [ActionDateTime], [NewValue], [OldValue]) VALUES (2, N'[dbo].[Employee]', N'[Salary]', N'Updated', CAST(N'2018-12-24 01:52:10.113' AS DateTime), N'1000', N'80')
SET IDENTITY_INSERT [dbo].[LogData] OFF
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([Id], [ProjectName]) VALUES (1, N'a')
INSERT [dbo].[Project] ([Id], [ProjectName]) VALUES (2, N'b')
INSERT [dbo].[Project] ([Id], [ProjectName]) VALUES (3, N'c')
INSERT [dbo].[Project] ([Id], [ProjectName]) VALUES (4, N'd')
INSERT [dbo].[Project] ([Id], [ProjectName]) VALUES (5, N'e')
INSERT [dbo].[Project] ([Id], [ProjectName]) VALUES (6, N'f')
INSERT [dbo].[Project] ([Id], [ProjectName]) VALUES (7, N'g')
INSERT [dbo].[Project] ([Id], [ProjectName]) VALUES (8, N'h')
SET IDENTITY_INSERT [dbo].[Project] OFF
SET IDENTITY_INSERT [dbo].[ProjectEmployee] ON 

INSERT [dbo].[ProjectEmployee] ([Id], [ProjectId], [EmployeeId]) VALUES (1, 1, 1)
INSERT [dbo].[ProjectEmployee] ([Id], [ProjectId], [EmployeeId]) VALUES (2, 2, 2)
INSERT [dbo].[ProjectEmployee] ([Id], [ProjectId], [EmployeeId]) VALUES (3, 3, 3)
INSERT [dbo].[ProjectEmployee] ([Id], [ProjectId], [EmployeeId]) VALUES (4, 4, 4)
INSERT [dbo].[ProjectEmployee] ([Id], [ProjectId], [EmployeeId]) VALUES (5, 5, 1)
INSERT [dbo].[ProjectEmployee] ([Id], [ProjectId], [EmployeeId]) VALUES (6, 6, 2)
INSERT [dbo].[ProjectEmployee] ([Id], [ProjectId], [EmployeeId]) VALUES (7, 7, 3)
INSERT [dbo].[ProjectEmployee] ([Id], [ProjectId], [EmployeeId]) VALUES (8, 8, 4)
SET IDENTITY_INSERT [dbo].[ProjectEmployee] OFF
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Country]
GO
ALTER TABLE [dbo].[District]  WITH CHECK ADD  CONSTRAINT [FK_District_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[District] CHECK CONSTRAINT [FK_District_City]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([DeptId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_District] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[District] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_District]
GO
ALTER TABLE [dbo].[ProjectEmployee]  WITH CHECK ADD  CONSTRAINT [FK_ProjectEmployee_Employee] FOREIGN KEY([Id])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[ProjectEmployee] CHECK CONSTRAINT [FK_ProjectEmployee_Employee]
GO
ALTER TABLE [dbo].[ProjectEmployee]  WITH CHECK ADD  CONSTRAINT [FK_ProjectEmployee_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[ProjectEmployee] CHECK CONSTRAINT [FK_ProjectEmployee_Project]
GO
USE [master]
GO
ALTER DATABASE [Company] SET  READ_WRITE 
GO
