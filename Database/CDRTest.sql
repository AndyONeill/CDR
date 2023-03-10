USE [CDRTest]
GO
/****** Object:  Table [dbo].[Calls]    Script Date: 20/02/2023 05:10:24 PM ******/
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
SET IDENTITY_INSERT [dbo].[Calls] ON 

INSERT [dbo].[Calls] ([ID], [caller_id], [recipient], [call_date], [end_time], [duration], [cost], [reference], [currency]) VALUES (2, 441215598896, 448000096481, CAST(N'2016-08-16' AS Date), CAST(N'14:21:33' AS Time), 43, CAST(1.234 AS Numeric(9, 3)), N'C5DA9724701EEBBA95CA2CC5617BA93E4', N'GBP')
INSERT [dbo].[Calls] ([ID], [caller_id], [recipient], [call_date], [end_time], [duration], [cost], [reference], [currency]) VALUES (3, 442036401149, 44800833833, CAST(N'2016-08-16' AS Date), CAST(N'14:00:47' AS Time), 244, CAST(0.051 AS Numeric(9, 3)), N'C50B5A7BDB8D68B8512BB14A9D363CAA1', N'GBP')
INSERT [dbo].[Calls] ([ID], [caller_id], [recipient], [call_date], [end_time], [duration], [cost], [reference], [currency]) VALUES (4, 442036401149, 448004960493, CAST(N'2016-08-16' AS Date), CAST(N'14:00:47' AS Time), 3818, CAST(1.012 AS Numeric(9, 3)), N'C7224B928F0FEEC98919B0139E6453BDC', N'GBP')
INSERT [dbo].[Calls] ([ID], [caller_id], [recipient], [call_date], [end_time], [duration], [cost], [reference], [currency]) VALUES (5, 442036401149, 448003580672, CAST(N'2016-08-16' AS Date), CAST(N'14:19:50' AS Time), 13, CAST(0.001 AS Numeric(9, 3)), N'CF3154CFA82653893CA1D77A6627C94B5', N'GBP')
INSERT [dbo].[Calls] ([ID], [caller_id], [recipient], [call_date], [end_time], [duration], [cost], [reference], [currency]) VALUES (6, 442035515300, 448006783320, CAST(N'2016-08-16' AS Date), CAST(N'14:33:32' AS Time), 64, CAST(0.000 AS Numeric(9, 3)), N'CE9BABA57E4CA258BCF66B8FC2E206965', N'GBP')
INSERT [dbo].[Calls] ([ID], [caller_id], [recipient], [call_date], [end_time], [duration], [cost], [reference], [currency]) VALUES (7, 441268567747, 448000833003, CAST(N'2016-08-16' AS Date), CAST(N'14:21:50' AS Time), 31, CAST(0.000 AS Numeric(9, 3)), N'C0FAAB1E6424B20D1625FEAAD5936053E', N'GBP')
INSERT [dbo].[Calls] ([ID], [caller_id], [recipient], [call_date], [end_time], [duration], [cost], [reference], [currency]) VALUES (8, 441827214130, 448001830044, CAST(N'2016-08-16' AS Date), CAST(N'14:32:40' AS Time), 373, CAST(0.000 AS Numeric(9, 3)), N'C639033F0752A937D951A6A2E33EB6910', N'GBP')
INSERT [dbo].[Calls] ([ID], [caller_id], [recipient], [call_date], [end_time], [duration], [cost], [reference], [currency]) VALUES (9, 441760723301, 448000480968, CAST(N'2016-08-16' AS Date), CAST(N'14:33:37' AS Time), 2428, CAST(0.000 AS Numeric(9, 3)), N'C448A51ECB014E5B2D9D96620E2F2397E', N'GBP')
INSERT [dbo].[Calls] ([ID], [caller_id], [recipient], [call_date], [end_time], [duration], [cost], [reference], [currency]) VALUES (10, 442072657300, 448088004444, CAST(N'2016-08-16' AS Date), CAST(N'14:05:29' AS Time), 149, CAST(0.000 AS Numeric(9, 3)), N'C6C4EC9A8C4847E8AD1B1D6CD02491E79', N'GBP')
INSERT [dbo].[Calls] ([ID], [caller_id], [recipient], [call_date], [end_time], [duration], [cost], [reference], [currency]) VALUES (11, 442036401882, 448004960493, CAST(N'2016-08-16' AS Date), CAST(N'14:32:48' AS Time), 693, CAST(0.000 AS Numeric(9, 3)), N'C2BF812F9B32CD37164AB07C69A36111D', N'GBP')
SET IDENTITY_INSERT [dbo].[Calls] OFF
