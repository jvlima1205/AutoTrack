USE [master]
GO
/****** Object:  Database [DBAutoTrack]    Script Date: 06/03/2026 14:10:05 ******/
CREATE DATABASE [DBAutoTrack]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBAutoTrack', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DBAutoTrack.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBAutoTrack_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DBAutoTrack_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DBAutoTrack] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBAutoTrack].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBAutoTrack] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBAutoTrack] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBAutoTrack] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBAutoTrack] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBAutoTrack] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBAutoTrack] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBAutoTrack] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBAutoTrack] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBAutoTrack] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBAutoTrack] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBAutoTrack] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBAutoTrack] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBAutoTrack] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBAutoTrack] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBAutoTrack] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBAutoTrack] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBAutoTrack] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBAutoTrack] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBAutoTrack] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBAutoTrack] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBAutoTrack] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBAutoTrack] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBAutoTrack] SET RECOVERY FULL 
GO
ALTER DATABASE [DBAutoTrack] SET  MULTI_USER 
GO
ALTER DATABASE [DBAutoTrack] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBAutoTrack] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBAutoTrack] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBAutoTrack] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBAutoTrack] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBAutoTrack] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBAutoTrack', N'ON'
GO
ALTER DATABASE [DBAutoTrack] SET QUERY_STORE = ON
GO
ALTER DATABASE [DBAutoTrack] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DBAutoTrack]
GO
/****** Object:  Table [dbo].[tVehicle]    Script Date: 06/03/2026 14:10:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tVehicle](
	[IdVehicle] [int] IDENTITY(1,1) NOT NULL,
	[IdVehicleBrand] [int] NOT NULL,
	[Vehicle] [nvarchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVehicle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tVehicleBrand]    Script Date: 06/03/2026 14:10:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tVehicleBrand](
	[IdVehicleBrand] [int] IDENTITY(1,1) NOT NULL,
	[Brand] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVehicleBrand] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwVehicle]    Script Date: 06/03/2026 14:10:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwVehicle]
AS
SELECT        dbo.tVehicleBrand.IdVehicleBrand, dbo.tVehicleBrand.Brand, dbo.tVehicle.IdVehicle, dbo.tVehicle.Vehicle
FROM            dbo.tVehicle INNER JOIN
                         dbo.tVehicleBrand ON dbo.tVehicle.IdVehicleBrand = dbo.tVehicleBrand.IdVehicleBrand
GO
/****** Object:  Table [dbo].[tVehicleClient]    Script Date: 06/03/2026 14:10:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tVehicleClient](
	[IdVehicleClient] [int] IDENTITY(1,1) NOT NULL,
	[IdVehicle] [int] NOT NULL,
	[IdClient] [int] NOT NULL,
	[Plate] [nvarchar](10) NOT NULL,
	[YearManufacture] [int] NOT NULL,
	[YearModel] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVehicleClient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tClient]    Script Date: 06/03/2026 14:10:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tClient](
	[IdClient] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[Address] [nvarchar](32) NOT NULL,
	[HouseNumber] [nvarchar](32) NOT NULL,
	[District] [nvarchar](32) NOT NULL,
	[City] [nvarchar](32) NOT NULL,
	[State] [nvarchar](32) NOT NULL,
	[CEP] [nvarchar](32) NULL,
	[Contact] [nvarchar](32) NOT NULL,
	[ContactAux] [nvarchar](32) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdClient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwVehicleClient]    Script Date: 06/03/2026 14:10:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwVehicleClient]
AS
SELECT        dbo.tClient.IdClient, dbo.tClient.Name, dbo.tClient.Address, dbo.tClient.HouseNumber, dbo.tClient.District, dbo.tClient.City, dbo.tClient.State, dbo.tClient.CEP, dbo.tClient.Contact, dbo.tClient.ContactAux, 
                         dbo.tVehicleClient.IdVehicleClient, dbo.vwVehicle.IdVehicleBrand, dbo.vwVehicle.Brand, dbo.vwVehicle.IdVehicle, dbo.vwVehicle.Vehicle, dbo.tVehicleClient.Plate, dbo.tVehicleClient.YearManufacture, 
                         dbo.tVehicleClient.YearModel
FROM            dbo.tClient INNER JOIN
                         dbo.tVehicleClient ON dbo.tClient.IdClient = dbo.tVehicleClient.IdClient INNER JOIN
                         dbo.vwVehicle ON dbo.tVehicleClient.IdVehicle = dbo.vwVehicle.IdVehicle
GO
/****** Object:  Table [dbo].[tWorkOrder]    Script Date: 06/03/2026 14:10:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tWorkOrder](
	[IdWorkOrder] [int] IDENTITY(1,1) NOT NULL,
	[IdStatus] [int] NOT NULL,
	[Number] [varchar](12) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[PromisedDate] [datetime] NOT NULL,
	[CreatAt] [datetime] NOT NULL,
	[IdVehicleClient] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdWorkOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tStatus]    Script Date: 06/03/2026 14:10:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tStatus](
	[IdStatus] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwWorkOrder]    Script Date: 06/03/2026 14:10:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwWorkOrder]
AS
SELECT        dbo.tWorkOrder.IdWorkOrder, dbo.tWorkOrder.Number, dbo.tWorkOrder.Description, dbo.tWorkOrder.PromisedDate, dbo.tWorkOrder.CreatAt, dbo.tStatus.IdStatus, dbo.tStatus.Status, dbo.vwVehicleClient.IdVehicleClient, 
                         dbo.vwVehicleClient.IdVehicle, dbo.vwVehicleClient.Vehicle, dbo.vwVehicleClient.IdVehicleBrand, dbo.vwVehicleClient.Brand, dbo.vwVehicleClient.Plate, dbo.vwVehicleClient.YearManufacture, dbo.vwVehicleClient.YearModel, 
                         dbo.vwVehicleClient.IdClient, dbo.vwVehicleClient.Name, dbo.vwVehicleClient.Address, dbo.vwVehicleClient.HouseNumber, dbo.vwVehicleClient.District, dbo.vwVehicleClient.City, dbo.vwVehicleClient.State, 
                         dbo.vwVehicleClient.CEP, dbo.vwVehicleClient.Contact, dbo.vwVehicleClient.ContactAux
FROM            dbo.tWorkOrder INNER JOIN
                         dbo.tStatus ON dbo.tWorkOrder.IdStatus = dbo.tStatus.IdStatus INNER JOIN
                         dbo.vwVehicleClient ON dbo.tWorkOrder.IdVehicleClient = dbo.vwVehicleClient.IdVehicleClient
GO
/****** Object:  Table [dbo].[tMaintenance]    Script Date: 06/03/2026 14:10:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tMaintenance](
	[IdMaintenance] [int] IDENTITY(1,1) NOT NULL,
	[IdVehicle] [int] NOT NULL,
	[DateMaintenance] [datetime] NOT NULL,
	[Cost] [float] NOT NULL,
	[Mileage] [float] NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMaintenance] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tWorkOrder] ADD  DEFAULT (getdate()) FOR [CreatAt]
GO
ALTER TABLE [dbo].[tVehicle]  WITH CHECK ADD  CONSTRAINT [FK_tVehicle_tVehicleBrand] FOREIGN KEY([IdVehicleBrand])
REFERENCES [dbo].[tVehicleBrand] ([IdVehicleBrand])
GO
ALTER TABLE [dbo].[tVehicle] CHECK CONSTRAINT [FK_tVehicle_tVehicleBrand]
GO
ALTER TABLE [dbo].[tVehicleClient]  WITH CHECK ADD  CONSTRAINT [FK_tVehicleClient_tClient] FOREIGN KEY([IdClient])
REFERENCES [dbo].[tClient] ([IdClient])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tVehicleClient] CHECK CONSTRAINT [FK_tVehicleClient_tClient]
GO
ALTER TABLE [dbo].[tVehicleClient]  WITH CHECK ADD  CONSTRAINT [FK_tVehicleClient_tVehicle] FOREIGN KEY([IdVehicle])
REFERENCES [dbo].[tVehicle] ([IdVehicle])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tVehicleClient] CHECK CONSTRAINT [FK_tVehicleClient_tVehicle]
GO
ALTER TABLE [dbo].[tWorkOrder]  WITH CHECK ADD  CONSTRAINT [FK_tWorkOrder_tStatus] FOREIGN KEY([IdStatus])
REFERENCES [dbo].[tStatus] ([IdStatus])
GO
ALTER TABLE [dbo].[tWorkOrder] CHECK CONSTRAINT [FK_tWorkOrder_tStatus]
GO
ALTER TABLE [dbo].[tWorkOrder]  WITH CHECK ADD  CONSTRAINT [FK_tWorkOrder_tVehicleClient] FOREIGN KEY([IdVehicleClient])
REFERENCES [dbo].[tVehicleClient] ([IdVehicleClient])
GO
ALTER TABLE [dbo].[tWorkOrder] CHECK CONSTRAINT [FK_tWorkOrder_tVehicleClient]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tVehicle"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 187
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tVehicleBrand"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 161
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwVehicle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwVehicle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tClient"
            Begin Extent = 
               Top = 21
               Left = 76
               Bottom = 269
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tVehicleClient"
            Begin Extent = 
               Top = 41
               Left = 338
               Bottom = 229
               Right = 518
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vwVehicle"
            Begin Extent = 
               Top = 24
               Left = 589
               Bottom = 269
               Right = 759
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 19
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwVehicleClient'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwVehicleClient'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tWorkOrder"
            Begin Extent = 
               Top = 14
               Left = 278
               Bottom = 267
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vwVehicleClient"
            Begin Extent = 
               Top = 4
               Left = 548
               Bottom = 331
               Right = 728
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tStatus"
            Begin Extent = 
               Top = 6
               Left = 40
               Bottom = 157
               Right = 210
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwWorkOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwWorkOrder'
GO
USE [master]
GO
ALTER DATABASE [DBAutoTrack] SET  READ_WRITE 
GO
