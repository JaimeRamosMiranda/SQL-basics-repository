USE [master]
GO
/****** Object:  Database [encuesta]    Script Date: 07/02/2018 19:24:02 ******/
CREATE DATABASE [encuesta]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'encuesta', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\encuesta.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'encuesta_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\encuesta_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [encuesta] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [encuesta].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [encuesta] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [encuesta] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [encuesta] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [encuesta] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [encuesta] SET ARITHABORT OFF 
GO
ALTER DATABASE [encuesta] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [encuesta] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [encuesta] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [encuesta] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [encuesta] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [encuesta] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [encuesta] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [encuesta] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [encuesta] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [encuesta] SET  ENABLE_BROKER 
GO
ALTER DATABASE [encuesta] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [encuesta] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [encuesta] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [encuesta] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [encuesta] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [encuesta] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [encuesta] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [encuesta] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [encuesta] SET  MULTI_USER 
GO
ALTER DATABASE [encuesta] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [encuesta] SET DB_CHAINING OFF 
GO
ALTER DATABASE [encuesta] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [encuesta] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [encuesta] SET DELAYED_DURABILITY = DISABLED 
GO
USE [encuesta]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 07/02/2018 19:24:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departamento](
	[id_dpto] [int] NOT NULL,
	[nombre_dpto] [varchar](20) NULL,
 CONSTRAINT [PK_Departamento_1008] PRIMARY KEY CLUSTERED 
(
	[id_dpto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Distrito]    Script Date: 07/02/2018 19:24:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Distrito](
	[id_distrito] [int] NOT NULL,
	[nombre_distrito] [varchar](20) NULL,
	[id_prov] [int] NOT NULL,
 CONSTRAINT [PK_Distrito_1007] PRIMARY KEY CLUSTERED 
(
	[id_distrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Encuesta]    Script Date: 07/02/2018 19:24:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Encuesta](
	[id_encuesta] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
	[poblacion] [int] NULL,
	[muestra] [int] NULL,
	[desde] [date] NULL,
	[hasta] [date] NULL,
 CONSTRAINT [PK_Encuesta_1004] PRIMARY KEY CLUSTERED 
(
	[id_encuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Encuestador]    Script Date: 07/02/2018 19:24:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Encuestador](
	[id_encuestador] [int] NOT NULL,
	[dni] [varchar](8) NULL,
	[nombre] [varchar](20) NULL,
	[apellido] [varchar](20) NULL,
	[supervisor] [varchar](20) NULL,
 CONSTRAINT [PK_Encuestador_1001] PRIMARY KEY CLUSTERED 
(
	[id_encuestador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 07/02/2018 19:24:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estado](
	[id_estado] [int] NOT NULL,
	[descripcion] [varchar](20) NULL,
 CONSTRAINT [PK_Estado_1005] PRIMARY KEY CLUSTERED 
(
	[id_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ficha]    Script Date: 07/02/2018 19:24:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ficha](
	[id_ficha] [int] NOT NULL,
	[fecha_hora] [date] NULL,
	[lugar] [varchar](50) NULL,
	[encuestas] [int] NULL,
	[id_encuestador] [int] NOT NULL,
 CONSTRAINT [PK_Ficha_1002] PRIMARY KEY CLUSTERED 
(
	[id_ficha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ficha_Encuesta]    Script Date: 07/02/2018 19:24:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ficha_Encuesta](
	[id_ficha] [int] NOT NULL,
	[id_encuesta] [int] NOT NULL,
	[id_distrito] [int] NOT NULL,
	[id_estado] [int] NOT NULL,
 CONSTRAINT [PK_Ficha_Encuesta__1003] PRIMARY KEY CLUSTERED 
(
	[id_ficha] ASC,
	[id_encuesta] ASC,
	[id_distrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 07/02/2018 19:24:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Provincia](
	[id_prov] [int] NOT NULL,
	[nombre_prov] [varchar](20) NULL,
	[id_dpto] [int] NOT NULL,
 CONSTRAINT [PK_Provincia_1006] PRIMARY KEY CLUSTERED 
(
	[id_prov] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Distrito]  WITH CHECK ADD  CONSTRAINT [FK_Distrito_Provincia] FOREIGN KEY([id_prov])
REFERENCES [dbo].[Provincia] ([id_prov])
GO
ALTER TABLE [dbo].[Distrito] CHECK CONSTRAINT [FK_Distrito_Provincia]
GO
ALTER TABLE [dbo].[Ficha]  WITH CHECK ADD  CONSTRAINT [FK_Ficha_Encuestador] FOREIGN KEY([id_encuestador])
REFERENCES [dbo].[Encuestador] ([id_encuestador])
GO
ALTER TABLE [dbo].[Ficha] CHECK CONSTRAINT [FK_Ficha_Encuestador]
GO
ALTER TABLE [dbo].[Ficha_Encuesta]  WITH CHECK ADD  CONSTRAINT [FK_Ficha_Encuesta_Distrito] FOREIGN KEY([id_distrito])
REFERENCES [dbo].[Distrito] ([id_distrito])
GO
ALTER TABLE [dbo].[Ficha_Encuesta] CHECK CONSTRAINT [FK_Ficha_Encuesta_Distrito]
GO
ALTER TABLE [dbo].[Ficha_Encuesta]  WITH CHECK ADD  CONSTRAINT [FK_Ficha_Encuesta_Encuesta] FOREIGN KEY([id_encuesta])
REFERENCES [dbo].[Encuesta] ([id_encuesta])
GO
ALTER TABLE [dbo].[Ficha_Encuesta] CHECK CONSTRAINT [FK_Ficha_Encuesta_Encuesta]
GO
ALTER TABLE [dbo].[Ficha_Encuesta]  WITH CHECK ADD  CONSTRAINT [FK_Ficha_Encuesta_Estado] FOREIGN KEY([id_estado])
REFERENCES [dbo].[Estado] ([id_estado])
GO
ALTER TABLE [dbo].[Ficha_Encuesta] CHECK CONSTRAINT [FK_Ficha_Encuesta_Estado]
GO
ALTER TABLE [dbo].[Ficha_Encuesta]  WITH CHECK ADD  CONSTRAINT [FK_Ficha_Encuesta_Ficha] FOREIGN KEY([id_ficha])
REFERENCES [dbo].[Ficha] ([id_ficha])
GO
ALTER TABLE [dbo].[Ficha_Encuesta] CHECK CONSTRAINT [FK_Ficha_Encuesta_Ficha]
GO
ALTER TABLE [dbo].[Provincia]  WITH CHECK ADD  CONSTRAINT [FK_Provincia_Departamento] FOREIGN KEY([id_dpto])
REFERENCES [dbo].[Departamento] ([id_dpto])
GO
ALTER TABLE [dbo].[Provincia] CHECK CONSTRAINT [FK_Provincia_Departamento]
GO
USE [master]
GO
ALTER DATABASE [encuesta] SET  READ_WRITE 
GO
