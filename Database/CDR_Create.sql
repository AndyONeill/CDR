USE [CDR]
GO
/****** Object:  Table [dbo].[Calls]    Script Date: 20/02/2023 05:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calls](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[caller_id] [bigint] NULL,
	[recipient] [bigint] NOT NULL,
	[call_date] [date] NOT NULL,
	[end_time] [time](7) NOT NULL,
	[duration] [int] NOT NULL,
	[cost] [numeric](9, 3) NOT NULL,
	[reference] [varchar](50) NOT NULL,
	[currency] [char](3) NOT NULL,
 CONSTRAINT [PK_Calls] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cdr_import]    Script Date: 20/02/2023 05:07:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cdr_import](
	[caller_id] [varchar](16) NULL,
	[recipient] [varchar](16) NOT NULL,
	[call_date] [datetime2](7) NOT NULL,
	[end_time] [time](7) NOT NULL,
	[duration] [int] NOT NULL,
	[cost] [float] NOT NULL,
	[reference] [nvarchar](50) NOT NULL,
	[currency] [char](3) NOT NULL
) ON [PRIMARY]
GO
