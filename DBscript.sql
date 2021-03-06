USE [master]
GO
/****** Object:  Database [MoneyxchangeDB]    Script Date: 27/12/2019 01:58:33 ******/
CREATE DATABASE [MoneyxchangeDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MoneyxchangeDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MoneyxchangeDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MoneyxchangeDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MoneyxchangeDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MoneyxchangeDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MoneyxchangeDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MoneyxchangeDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MoneyxchangeDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MoneyxchangeDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MoneyxchangeDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MoneyxchangeDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MoneyxchangeDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MoneyxchangeDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MoneyxchangeDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MoneyxchangeDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MoneyxchangeDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MoneyxchangeDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MoneyxchangeDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MoneyxchangeDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MoneyxchangeDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MoneyxchangeDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MoneyxchangeDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MoneyxchangeDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MoneyxchangeDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MoneyxchangeDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MoneyxchangeDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MoneyxchangeDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MoneyxchangeDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MoneyxchangeDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MoneyxchangeDB] SET  MULTI_USER 
GO
ALTER DATABASE [MoneyxchangeDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MoneyxchangeDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MoneyxchangeDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MoneyxchangeDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MoneyxchangeDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MoneyxchangeDB] SET QUERY_STORE = OFF
GO
USE [MoneyxchangeDB]
GO
/****** Object:  Table [dbo].[Conversion]    Script Date: 27/12/2019 01:58:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conversion](
	[idConversion] [int] IDENTITY(1,1) NOT NULL,
	[fromConversion] [int] NOT NULL,
	[toConversion] [int] NOT NULL,
	[fromValue] [decimal](12, 4) NOT NULL,
	[toValue] [decimal](12, 4) NOT NULL,
	[conversionDate] [datetime] NOT NULL,
	[conversionUser] [int] NOT NULL,
 CONSTRAINT [PK_Conversion] PRIMARY KEY CLUSTERED 
(
	[idConversion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 27/12/2019 01:58:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency](
	[idCurrency] [int] NOT NULL,
	[nameCurrency] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[idCurrency] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 27/12/2019 01:58:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[idRole] [int] NOT NULL,
	[roleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[idRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 27/12/2019 01:58:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[userPass] [varchar](50) NOT NULL,
	[userRole] [int] NOT NULL,
	[modificationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Currency] ([idCurrency], [nameCurrency]) VALUES (1, N'USD')
INSERT [dbo].[Currency] ([idCurrency], [nameCurrency]) VALUES (2, N'EUR')
INSERT [dbo].[Role] ([idRole], [roleName]) VALUES (1, N'Administrator')
INSERT [dbo].[Role] ([idRole], [roleName]) VALUES (2, N'User')
INSERT [dbo].[Role] ([idRole], [roleName]) VALUES (3, N'Customer')
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([idUser], [userName], [userPass], [userRole], [modificationDate]) VALUES (1, N'admin', N'admin123', 1, CAST(N'2019-12-26T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Conversion]  WITH CHECK ADD  CONSTRAINT [FK_Conversion_CurrencyFrom] FOREIGN KEY([fromConversion])
REFERENCES [dbo].[Currency] ([idCurrency])
GO
ALTER TABLE [dbo].[Conversion] CHECK CONSTRAINT [FK_Conversion_CurrencyFrom]
GO
ALTER TABLE [dbo].[Conversion]  WITH CHECK ADD  CONSTRAINT [FK_Conversion_CurrencyTo] FOREIGN KEY([toConversion])
REFERENCES [dbo].[Currency] ([idCurrency])
GO
ALTER TABLE [dbo].[Conversion] CHECK CONSTRAINT [FK_Conversion_CurrencyTo]
GO
ALTER TABLE [dbo].[Conversion]  WITH CHECK ADD  CONSTRAINT [FK_Conversion_User] FOREIGN KEY([conversionUser])
REFERENCES [dbo].[User] ([idUser])
GO
ALTER TABLE [dbo].[Conversion] CHECK CONSTRAINT [FK_Conversion_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([userRole])
REFERENCES [dbo].[Role] ([idRole])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [MoneyxchangeDB] SET  READ_WRITE 
GO
