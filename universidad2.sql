USE [master]
GO
/****** Object:  Database [Universidad2]    Script Date: 05/02/2018 21:46:34 ******/
CREATE DATABASE [Universidad2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Universidad2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Universidad2.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Universidad2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Universidad2_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Universidad2] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Universidad2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Universidad2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Universidad2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Universidad2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Universidad2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Universidad2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Universidad2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Universidad2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Universidad2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Universidad2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Universidad2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Universidad2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Universidad2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Universidad2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Universidad2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Universidad2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Universidad2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Universidad2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Universidad2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Universidad2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Universidad2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Universidad2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Universidad2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Universidad2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Universidad2] SET  MULTI_USER 
GO
ALTER DATABASE [Universidad2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Universidad2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Universidad2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Universidad2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Universidad2] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Universidad2]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 05/02/2018 21:46:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alumno](
	[id_alumno] [int] NOT NULL,
	[nombre] [varchar](20) NULL,
	[apellido] [varchar](20) NULL,
	[edad] [int] NULL,
	[genero] [char](1) NULL,
	[telefono] [int] NULL,
	[direccion] [varchar](50) NULL,
 CONSTRAINT [PK_Alumno_1002] PRIMARY KEY CLUSTERED 
(
	[id_alumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Alumno_Carrera]    Script Date: 05/02/2018 21:46:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno_Carrera](
	[id_alumno] [int] NOT NULL,
	[id_carrera] [int] NOT NULL,
 CONSTRAINT [PK_Alumno_Carrera_1004] PRIMARY KEY CLUSTERED 
(
	[id_alumno] ASC,
	[id_carrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Carrera]    Script Date: 05/02/2018 21:46:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Carrera](
	[id_carrera] [int] NOT NULL,
	[nombre] [varchar](30) NULL,
	[duracion] [int] NULL,
 CONSTRAINT [PK_Carrera_1003] PRIMARY KEY CLUSTERED 
(
	[id_carrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Alumno_Carrera]  WITH CHECK ADD  CONSTRAINT [FK_Alumno_Carrera_Alumno] FOREIGN KEY([id_alumno])
REFERENCES [dbo].[Alumno] ([id_alumno])
GO
ALTER TABLE [dbo].[Alumno_Carrera] CHECK CONSTRAINT [FK_Alumno_Carrera_Alumno]
GO
ALTER TABLE [dbo].[Alumno_Carrera]  WITH CHECK ADD  CONSTRAINT [FK_Alumno_Carrera_Carrera] FOREIGN KEY([id_carrera])
REFERENCES [dbo].[Carrera] ([id_carrera])
GO
ALTER TABLE [dbo].[Alumno_Carrera] CHECK CONSTRAINT [FK_Alumno_Carrera_Carrera]
GO
USE [master]
GO
ALTER DATABASE [Universidad2] SET  READ_WRITE 
GO
