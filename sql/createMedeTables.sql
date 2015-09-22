/****** Object:  Table [dbo].[CTRG]    Script Date: 9/10/2015 4:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTRG](
	[CTRGID] [int] NULL,
	[name] [varchar](100) NULL
	[CMRGID] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dataset]    Script Date: 9/10/2015 4:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dataset](
	[DatasetID] [int] NOT NULL,
	[TaskID] [int] NULL,
	[Name] [varchar](100) NULL,
	[Description] [varchar](1000) NULL,
	[LastUpdate] [date] NULL,
	[Size] [varchar](50) NULL,
	[FileFormat] [varchar](100) NULL,
	[FileType] [varchar](100) NULL,
	[RelatedData] [varchar](1000) NULL,
	[ContactEmail] [varchar](100) NULL,
	[Identifier] [varchar](100) NULL,
	[Keywords] [varchar](1000) NULL,
	[URL] [varchar](200) NULL,
	[ContactFirstName] [varchar] (100) NULL,
	[ContactLastName] [varchar] (100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PI]    Script Date: 9/10/2015 4:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PI](
	[PiID] [int] NULL,
	[Name] [varchar](100) NULL,
	[Institue] [varchar](100) NULL,
	[Email] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PI_Task]    Script Date: 9/10/2015 4:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PI_Task](
	[id] [int] NULL,
	[PIid] [int] NULL,
	[TaskID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[task]    Script Date: 9/10/2015 4:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[task](
	[taskID] [int] NULL,
	[taskName] [varchar](100) NULL,
	[taskDescription] [varchar](2000) NULL,
	[CTRGID] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO




/****** Object:  Table [dbo].[CMRG]    Script Date: 9/22/2015 11:33:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CMRG](
	[CMRGID] [int] NOT NULL,
	[CMRGName] [varchar](100) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
