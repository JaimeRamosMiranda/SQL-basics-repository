USE [master]
GO
/****** Object:  Database [prueba100]    Script Date: 09/02/2018 21:31:33 ******/
CREATE DATABASE [prueba100]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'prueba100', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\prueba100.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'prueba100_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\prueba100_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [prueba100] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [prueba100].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [prueba100] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [prueba100] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [prueba100] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [prueba100] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [prueba100] SET ARITHABORT OFF 
GO
ALTER DATABASE [prueba100] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [prueba100] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [prueba100] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [prueba100] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [prueba100] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [prueba100] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [prueba100] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [prueba100] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [prueba100] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [prueba100] SET  ENABLE_BROKER 
GO
ALTER DATABASE [prueba100] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [prueba100] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [prueba100] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [prueba100] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [prueba100] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [prueba100] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [prueba100] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [prueba100] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [prueba100] SET  MULTI_USER 
GO
ALTER DATABASE [prueba100] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [prueba100] SET DB_CHAINING OFF 
GO
ALTER DATABASE [prueba100] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [prueba100] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [prueba100] SET DELAYED_DURABILITY = DISABLED 
GO
USE [prueba100]
GO
/****** Object:  Table [dbo].[paciente]    Script Date: 09/02/2018 21:31:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[paciente](
	[id_paciente] [int] IDENTITY(1,1) NOT NULL,
	[nombre_paciente] [varchar](20) NULL,
	[edad] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[paciente1]    Script Date: 09/02/2018 21:31:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[paciente1](
	[id_paciente] [int] IDENTITY(1,2) NOT NULL,
	[nombre_paciente] [varchar](20) NULL,
	[edad] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[paciente2]    Script Date: 09/02/2018 21:31:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[paciente2](
	[id_paciente] [int] IDENTITY(3,5) NOT NULL,
	[nombre_paciente] [varchar](20) NULL,
	[edad] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[producto]    Script Date: 09/02/2018 21:31:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[producto](
	[nombre_producto] [varchar](20) NULL,
	[precio_unit] [money] NULL,
	[precio_venta] [money] NULL,
	[id_prod] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 09/02/2018 21:31:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario](
	[id_usuario] [int] NOT NULL,
	[nombre] [varchar](20) NULL,
	[apellido] [varchar](20) NULL,
	[dni] [varchar](8) NULL,
	[edad] [int] NULL,
	[genero] [char](1) NULL,
	[fecha_nac] [date] NULL,
	[sueldo] [money] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[paciente] ON 

INSERT [dbo].[paciente] ([id_paciente], [nombre_paciente], [edad]) VALUES (1, N'Jorge', 23)
INSERT [dbo].[paciente] ([id_paciente], [nombre_paciente], [edad]) VALUES (2, N'Angel', 24)
INSERT [dbo].[paciente] ([id_paciente], [nombre_paciente], [edad]) VALUES (3, N'Kathy', 25)
INSERT [dbo].[paciente] ([id_paciente], [nombre_paciente], [edad]) VALUES (4, NULL, 19)
INSERT [dbo].[paciente] ([id_paciente], [nombre_paciente], [edad]) VALUES (5, N'Andres', NULL)
INSERT [dbo].[paciente] ([id_paciente], [nombre_paciente], [edad]) VALUES (6, NULL, NULL)
SET IDENTITY_INSERT [dbo].[paciente] OFF
SET IDENTITY_INSERT [dbo].[paciente1] ON 

INSERT [dbo].[paciente1] ([id_paciente], [nombre_paciente], [edad]) VALUES (1, N'Ana', 23)
INSERT [dbo].[paciente1] ([id_paciente], [nombre_paciente], [edad]) VALUES (3, N'Harry', 24)
INSERT [dbo].[paciente1] ([id_paciente], [nombre_paciente], [edad]) VALUES (5, N'Camilo', 25)
SET IDENTITY_INSERT [dbo].[paciente1] OFF
SET IDENTITY_INSERT [dbo].[paciente2] ON 

INSERT [dbo].[paciente2] ([id_paciente], [nombre_paciente], [edad]) VALUES (3, N'Ariel', 23)
INSERT [dbo].[paciente2] ([id_paciente], [nombre_paciente], [edad]) VALUES (8, N'Henry', 40)
INSERT [dbo].[paciente2] ([id_paciente], [nombre_paciente], [edad]) VALUES (13, N'Carlos', 25)
SET IDENTITY_INSERT [dbo].[paciente2] OFF
INSERT [dbo].[producto] ([nombre_producto], [precio_unit], [precio_venta], [id_prod]) VALUES (N'Camioneta 4x4 oKM', 30000.0000, 45000.0000, 1)
INSERT [dbo].[producto] ([nombre_producto], [precio_unit], [precio_venta], [id_prod]) VALUES (N'Toyota Yaris OKM', 12000.0000, 18000.0000, 2)
INSERT [dbo].[producto] ([nombre_producto], [precio_unit], [precio_venta], [id_prod]) VALUES (N'Moto lineal Ronco', 6000.0000, 8800.0000, 3)
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [dni], [edad], [genero], [fecha_nac], [sueldo]) VALUES (1, N'Javier', N'Casas', N'12345678', 23, N'M', CAST(N'1994-07-02' AS Date), 1200.0000)
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [dni], [edad], [genero], [fecha_nac], [sueldo]) VALUES (2, N'Ana', N'Salazar', N'12345666', 20, N'F', CAST(N'1998-07-02' AS Date), 850.0000)
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [dni], [edad], [genero], [fecha_nac], [sueldo]) VALUES (3, N'Jorge', N'Sánchez', N'12311665', 25, N'M', CAST(N'1992-07-23' AS Date), 1850.0000)
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [dni], [edad], [genero], [fecha_nac], [sueldo]) VALUES (4, N'Javier', N'Osco', N'12311333', 23, N'F', CAST(N'1993-10-23' AS Date), 4850.0000)
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [dni], [edad], [genero], [fecha_nac], [sueldo]) VALUES (5, N'Jorge', N'Dextre', N'12311443', 21, N'F', CAST(N'1995-12-23' AS Date), 3000.0000)
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [dni], [edad], [genero], [fecha_nac], [sueldo]) VALUES (6, N'Oscar', N'Rodriguez', N'12311000', 23, N'F', CAST(N'1994-09-13' AS Date), 10000.0000)
USE [master]
GO
ALTER DATABASE [prueba100] SET  READ_WRITE 
GO
