USE [master]
GO
/****** Object:  Database [DiagnosticCenter]    Script Date: 5/23/2017 5:08:38 AM ******/
CREATE DATABASE [DiagnosticCenter]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DiagnosticCenter', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DiagnosticCenter.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DiagnosticCenter_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DiagnosticCenter_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DiagnosticCenter] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DiagnosticCenter].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DiagnosticCenter] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DiagnosticCenter] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DiagnosticCenter] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DiagnosticCenter] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DiagnosticCenter] SET ARITHABORT OFF 
GO
ALTER DATABASE [DiagnosticCenter] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DiagnosticCenter] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DiagnosticCenter] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DiagnosticCenter] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DiagnosticCenter] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DiagnosticCenter] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DiagnosticCenter] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DiagnosticCenter] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DiagnosticCenter] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DiagnosticCenter] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DiagnosticCenter] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DiagnosticCenter] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DiagnosticCenter] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DiagnosticCenter] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DiagnosticCenter] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DiagnosticCenter] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DiagnosticCenter] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DiagnosticCenter] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DiagnosticCenter] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DiagnosticCenter] SET  MULTI_USER 
GO
ALTER DATABASE [DiagnosticCenter] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DiagnosticCenter] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DiagnosticCenter] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DiagnosticCenter] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DiagnosticCenter]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 5/23/2017 5:08:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Patient](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[DateOfBirth] [date] NULL,
	[Mobile] [varchar](20) NOT NULL,
	[BillNo] [varchar](50) NOT NULL,
	[TotalBill] [decimal](18, 2) NULL,
	[DueBill] [decimal](18, 2) NULL,
	[BillDate] [date] NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientTest]    Script Date: 5/23/2017 5:08:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientTest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TestId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_PatientTest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Test]    Script Date: 5/23/2017 5:08:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Test](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Fee] [decimal](18, 2) NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_Test] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestType]    Script Date: 5/23/2017 5:08:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TestType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[GetTestTypeWise]    Script Date: 5/23/2017 5:08:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[GetTestTypeWise]
AS
SELECT tt.TypeName,tt.Id, count(TestId) TotalTest,pt.date, t.fee*COUNT(TestId) TotalFee FROM TestType tt
Left join Test t
on tt.Id = t.TypeId
Full JOIN PatientTest pt
on t.Id = pt.TestId
group by tt.TypeName,pt.Date,tt.Id,t.fee


GO
/****** Object:  View [dbo].[GetTestTypeWiseResult]    Script Date: 5/23/2017 5:08:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[GetTestTypeWiseResult]
AS
select TypeName,Date, SUM(TotalTest) Test, SUM(TotalFee) Fee from GetTestTypeWise
group by TypeName, Date




GO
/****** Object:  View [dbo].[GetTestWiseResult]    Script Date: 5/23/2017 5:08:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetTestWiseResult]
AS
SELECT t.Name as Name,t.id, pt.date, COUNT(pt.TestId) AS TestCount,t.fee*COUNT(pt.TestId) As TotalFee FROM Test t 
full JOIN PatientTest pt
ON t.Id = pt.TestId
GROUP BY t.Name,t.fee, t.Id, pt.TestId, pt.date



GO
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([Id], [Name], [DateOfBirth], [Mobile], [BillNo], [TotalBill], [DueBill], [BillDate]) VALUES (1, N'Rakib', CAST(0x2D1F0B00 AS Date), N'01857333667', N'20170523031543265', CAST(1500.00 AS Decimal(18, 2)), CAST(1500.00 AS Decimal(18, 2)), CAST(0xD73C0B00 AS Date))
SET IDENTITY_INSERT [dbo].[Patient] OFF
SET IDENTITY_INSERT [dbo].[PatientTest] ON 

INSERT [dbo].[PatientTest] ([Id], [TestId], [PatientId], [Date]) VALUES (1, 2, 1, CAST(0xD73C0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [TestId], [PatientId], [Date]) VALUES (2, 1, 1, CAST(0xD73C0B00 AS Date))
SET IDENTITY_INSERT [dbo].[PatientTest] OFF
SET IDENTITY_INSERT [dbo].[Test] ON 

INSERT [dbo].[Test] ([Id], [Name], [Fee], [TypeId]) VALUES (1, N'CBC', CAST(500.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Test] ([Id], [Name], [Fee], [TypeId]) VALUES (2, N'Feet X-Ray', CAST(1000.00 AS Decimal(18, 2)), 2)
SET IDENTITY_INSERT [dbo].[Test] OFF
SET IDENTITY_INSERT [dbo].[TestType] ON 

INSERT [dbo].[TestType] ([Id], [TypeName]) VALUES (1, N'Blood')
INSERT [dbo].[TestType] ([Id], [TypeName]) VALUES (2, N'X-Ray')
SET IDENTITY_INSERT [dbo].[TestType] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Patient_1]    Script Date: 5/23/2017 5:08:40 AM ******/
ALTER TABLE [dbo].[Patient] ADD  CONSTRAINT [IX_Patient_1] UNIQUE NONCLUSTERED 
(
	[BillNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Test]    Script Date: 5/23/2017 5:08:40 AM ******/
ALTER TABLE [dbo].[Test] ADD  CONSTRAINT [IX_Test] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_TestType]    Script Date: 5/23/2017 5:08:40 AM ******/
ALTER TABLE [dbo].[TestType] ADD  CONSTRAINT [IX_TestType] UNIQUE NONCLUSTERED 
(
	[TypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PatientTest]  WITH CHECK ADD  CONSTRAINT [FK_PatientTest_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([Id])
GO
ALTER TABLE [dbo].[PatientTest] CHECK CONSTRAINT [FK_PatientTest_Patient]
GO
ALTER TABLE [dbo].[PatientTest]  WITH CHECK ADD  CONSTRAINT [FK_PatientTest_Test] FOREIGN KEY([TestId])
REFERENCES [dbo].[Test] ([Id])
GO
ALTER TABLE [dbo].[PatientTest] CHECK CONSTRAINT [FK_PatientTest_Test]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [FK_Test_TestType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[TestType] ([Id])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [FK_Test_TestType]
GO
USE [master]
GO
ALTER DATABASE [DiagnosticCenter] SET  READ_WRITE 
GO
