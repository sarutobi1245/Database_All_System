USE [DMR]
GO
/****** Object:  UserDefinedFunction [dbo].[DistinctValue]    Script Date: 1/9/2023 9:39:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[DistinctValue](@value NVARCHAR(max)) RETURNS NVARCHAR(max)
AS BEGIN
	SELECT @value=STRING_AGG(value,',') FROM (
		SELECT DISTINCT value FROM STRING_SPLIT(@value,',')
	) a
	RETURN @value
END
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 1/9/2023 9:39:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Abnormals]    Script Date: 1/9/2023 9:39:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abnormals](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ingredient] [nvarchar](max) NULL,
	[Batch] [nvarchar](max) NULL,
	[Building] [nvarchar](max) NULL,
	[UserID] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Abnormals] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActionInFunctionSystem]    Script Date: 1/9/2023 9:39:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionInFunctionSystem](
	[FunctionSystemID] [int] NOT NULL,
	[ActionID] [int] NOT NULL,
 CONSTRAINT [PK_ActionInFunctionSystem] PRIMARY KEY CLUSTERED 
(
	[ActionID] ASC,
	[FunctionSystemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Actions]    Script Date: 1/9/2023 9:39:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Actions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Additions]    Script Date: 1/9/2023 9:39:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Additions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LineID] [int] NOT NULL,
	[BPFCEstablishID] [int] NOT NULL,
	[ChemicalID] [int] NOT NULL,
	[Remark] [nvarchar](max) NULL,
	[Amount] [float] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NOT NULL,
	[ModifiedTime] [datetime2](7) NOT NULL,
	[DeletedTime] [datetime2](7) NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[WorkerID] [nvarchar](max) NULL,
 CONSTRAINT [PK_Additions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleNos]    Script Date: 1/9/2023 9:39:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleNos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[ModelNoID] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ArticleNos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArtProcesses]    Script Date: 1/9/2023 9:39:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArtProcesses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ArticleNoID] [int] NOT NULL,
	[ProcessID] [int] NOT NULL,
 CONSTRAINT [PK_ArtProcesses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BPFCEstablishes]    Script Date: 1/9/2023 9:39:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BPFCEstablishes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ModelNameID] [int] NOT NULL,
	[ModelNoID] [int] NOT NULL,
	[ArticleNoID] [int] NOT NULL,
	[ArtProcessID] [int] NOT NULL,
	[ApprovalStatus] [bit] NOT NULL,
	[FinishedStatus] [bit] NOT NULL,
	[ApprovalBy] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Season] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[UpdateTime] [datetime2](7) NULL,
	[BuildingDate] [datetime2](7) NULL,
	[DueDate] [datetime2](7) NULL,
	[IsDelete] [bit] NOT NULL,
	[DeleteTime] [datetime2](7) NULL,
	[DeleteBy] [int] NOT NULL,
 CONSTRAINT [PK_BPFCEstablishes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BPFCHistories]    Script Date: 1/9/2023 9:39:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BPFCHistories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BPFCEstablishID] [int] NOT NULL,
	[Action] [nvarchar](max) NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[Before] [nvarchar](max) NULL,
	[After] [nvarchar](max) NULL,
	[GlueID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Remark] [nvarchar](max) NULL,
 CONSTRAINT [PK_BPFCHistories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buildings]    Script Date: 1/9/2023 9:39:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buildings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Level] [int] NOT NULL,
	[ParentID] [int] NULL,
	[KindID] [int] NULL,
	[LunchTimeID] [int] NULL,
	[BuildingTypeID] [int] NULL,
 CONSTRAINT [PK_Buildings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuildingType]    Script Date: 1/9/2023 9:39:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuildingType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_BuildingType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuildingUser]    Script Date: 1/9/2023 9:39:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuildingUser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[BuildingID] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_BuildingUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 1/9/2023 9:39:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[BPFCEstablishID] [int] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dispatches]    Script Date: 1/9/2023 9:39:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dispatches](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [float] NOT NULL,
	[Unit] [nvarchar](max) NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[DeliveryTime] [datetime2](7) NULL,
	[CreateBy] [int] NOT NULL,
	[LineID] [int] NOT NULL,
	[MixingInfoID] [int] NOT NULL,
	[DispatchListID] [int] NULL,
	[DeleteBy] [int] NOT NULL,
	[DeleteTime] [datetime2](7) NULL,
	[IsDelete] [bit] NOT NULL,
	[EstimatedFinishTime] [datetime2](7) NOT NULL,
	[EstimatedStartTime] [datetime2](7) NOT NULL,
	[GlueNameID] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[RemainingAmount] [float] NULL,
 CONSTRAINT [PK_Dispatches] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DispatchList]    Script Date: 1/9/2023 9:39:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DispatchList](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PlanID] [int] NOT NULL,
	[MixingInfoID] [int] NOT NULL,
	[GlueID] [int] NOT NULL,
	[GlueNameID] [int] NOT NULL,
	[BuildingID] [int] NOT NULL,
	[LineID] [int] NOT NULL,
	[BPFCID] [int] NOT NULL,
	[LineName] [nvarchar](max) NULL,
	[GlueName] [nvarchar](max) NULL,
	[Supplier] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[StartDispatchingTime] [datetime2](7) NULL,
	[FinishDispatchingTime] [datetime2](7) NULL,
	[PrintTime] [datetime2](7) NULL,
	[EstimatedStartTime] [datetime2](7) NOT NULL,
	[EstimatedFinishTime] [datetime2](7) NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[DeleteTime] [datetime2](7) NOT NULL,
	[DeleteBy] [int] NOT NULL,
	[ColorCode] [int] NOT NULL,
	[FinishTimeOfPeriod] [datetime2](7) NOT NULL,
	[StartTimeOfPeriod] [datetime2](7) NOT NULL,
	[AbnormalStatus] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[DeliveredAmount] [float] NOT NULL,
 CONSTRAINT [PK_DispatchList] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DispatchListDetail]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DispatchListDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DispatchListID] [int] NOT NULL,
	[MixingInfoID] [int] NOT NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_DispatchListDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FunctionSystem]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FunctionSystem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Level] [int] NOT NULL,
	[Url] [nvarchar](max) NULL,
	[Sequence] [int] NOT NULL,
	[ParentID] [int] NULL,
	[ModuleID] [int] NULL,
	[Icon] [nvarchar](100) NULL,
 CONSTRAINT [PK_FunctionSystem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FunctionTranslations]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FunctionTranslations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[LanguageID] [nvarchar](10) NULL,
	[FunctionSystemID] [int] NULL,
 CONSTRAINT [PK_FunctionTranslations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlueIngredient]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlueIngredient](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GlueID] [int] NOT NULL,
	[IngredientID] [int] NOT NULL,
	[Allow] [float] NOT NULL,
	[Percentage] [float] NOT NULL,
	[CreatedDate] [nvarchar](max) NULL,
	[Position] [nvarchar](max) NULL,
 CONSTRAINT [PK_GlueIngredient] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlueName]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlueName](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_GlueName] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Glues]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Glues](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Consumption] [nvarchar](max) NULL,
	[CreatedDate] [nvarchar](max) NULL,
	[isShow] [bit] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[MaterialID] [int] NULL,
	[ExpiredTime] [int] NOT NULL,
	[KindID] [int] NULL,
	[PartID] [int] NULL,
	[CreatedBy] [int] NOT NULL,
	[BPFCEstablishID] [int] NOT NULL,
	[GlueNameID] [int] NULL,
 CONSTRAINT [PK_Glues] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlueTypes]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlueTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Level] [int] NOT NULL,
	[Minutes] [float] NOT NULL,
	[RPM] [float] NOT NULL,
	[ParentID] [int] NULL,
	[Method] [nvarchar](max) NULL,
 CONSTRAINT [PK_GlueTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IngredientInfoReports]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IngredientInfoReports](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[ManufacturingDate] [datetime2](7) NOT NULL,
	[SupplierName] [nvarchar](max) NULL,
	[ExpiredTime] [datetime2](7) NOT NULL,
	[Batch] [nvarchar](max) NULL,
	[Qty] [float] NOT NULL,
	[IngredientInfoID] [int] NOT NULL,
	[Consumption] [nvarchar](max) NULL,
	[UserID] [int] NOT NULL,
	[BuildingName] [nvarchar](max) NULL,
 CONSTRAINT [PK_IngredientInfoReports] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredients]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredients](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[CreatedDate] [nvarchar](max) NULL,
	[MaterialNO] [nvarchar](max) NULL,
	[CreatedBy] [int] NOT NULL,
	[isShow] [bit] NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[ManufacturingDate] [datetime2](7) NOT NULL,
	[Unit] [float] NOT NULL,
	[VOC] [float] NOT NULL,
	[ExpiredTime] [float] NOT NULL,
	[DaysToExpiration] [float] NOT NULL,
	[Real] [float] NOT NULL,
	[CBD] [float] NOT NULL,
	[ReplacementFrequency] [float] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[PrepareTime] [float] NOT NULL,
	[GlueTypeID] [int] NULL,
	[SupplierID] [int] NOT NULL,
	[StandardCycle] [float] NOT NULL,
	[PartNO] [nvarchar](max) NULL,
 CONSTRAINT [PK_Ingredients] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IngredientsInfos]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IngredientsInfos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IngredientID] [int] NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[ManufacturingDate] [datetime2](7) NOT NULL,
	[SupplierName] [nvarchar](max) NULL,
	[Batch] [nvarchar](max) NULL,
	[ExpiredTime] [datetime2](7) NOT NULL,
	[Qty] [float] NOT NULL,
	[Consumption] [nvarchar](max) NULL,
	[UserID] [int] NOT NULL,
	[BuildingName] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_IngredientsInfos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kinds]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kinds](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[KindTypeID] [int] NULL,
 CONSTRAINT [PK_Kinds] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KindType]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KindType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_KindType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[ID] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Sequence] [int] NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Line]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Line](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Line] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LunchTime]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LunchTime](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StartTime] [datetime2](7) NOT NULL,
	[EndTime] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedTime] [datetime2](7) NULL,
	[DeletedBy] [int] NOT NULL,
	[DeletedTime] [datetime2](7) NULL,
	[IsDelete] [int] NOT NULL,
 CONSTRAINT [PK_LunchTime] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mailings]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mailings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[UserID] [int] NOT NULL,
	[Frequency] [nvarchar](max) NULL,
	[TimeSend] [datetime2](7) NOT NULL,
	[Report] [nvarchar](max) NULL,
	[PathName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Mailings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Materials] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MixingInfoDetails]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MixingInfoDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Batch] [nvarchar](50) NULL,
	[Position] [nvarchar](2) NULL,
	[Amount] [float] NOT NULL,
	[IngredientID] [int] NOT NULL,
	[MixingInfoID] [int] NOT NULL,
	[Time_Start] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_MixingInfoDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MixingInfos]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MixingInfos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GlueID] [int] NOT NULL,
	[GlueName] [nvarchar](max) NULL,
	[BuildingID] [int] NOT NULL,
	[Code] [nvarchar](max) NULL,
	[MixBy] [int] NOT NULL,
	[ExpiredTime] [datetime2](7) NOT NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[Status] [bit] NOT NULL,
	[EstimatedTime] [datetime2](7) NOT NULL,
	[StartTime] [datetime2](7) NOT NULL,
	[EndTime] [datetime2](7) NOT NULL,
	[PrintTime] [datetime2](7) NULL,
	[EstimatedStartTime] [datetime2](7) NOT NULL,
	[EstimatedFinishTime] [datetime2](7) NOT NULL,
	[GlueNameID] [int] NOT NULL,
 CONSTRAINT [PK_MixingInfos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModelNames]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModelNames](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_ModelNames] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModelNos]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModelNos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[ModelNameID] [int] NOT NULL,
 CONSTRAINT [PK_ModelNos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modules]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modules](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Sequence] [int] NOT NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Icon] [nvarchar](100) NULL,
	[Url] [nvarchar](max) NULL,
 CONSTRAINT [PK_Modules] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModuleTranslations]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleTranslations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[LanguageID] [nvarchar](10) NULL,
	[ModuleID] [int] NULL,
 CONSTRAINT [PK_ModuleTranslations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parts]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Parts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PeriodDispatch]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeriodDispatch](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StartTime] [datetime2](7) NOT NULL,
	[EndTime] [datetime2](7) NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[DeletedBy] [int] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[DeletedTime] [datetime2](7) NULL,
	[UpdatedTime] [datetime2](7) NULL,
	[PeriodMixingID] [int] NOT NULL,
 CONSTRAINT [PK_PeriodDispatch] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PeriodMixing]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeriodMixing](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BuildingID] [int] NOT NULL,
	[IsOvertime] [bit] NOT NULL,
	[StartTime] [datetime2](7) NOT NULL,
	[EndTime] [datetime2](7) NOT NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[UpdatedTime] [datetime2](7) NULL,
	[DeletedTime] [datetime2](7) NULL,
	[IsDelete] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[DeletedBy] [int] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
 CONSTRAINT [PK_PeriodMixing] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permisions]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisions](
	[ActionID] [int] NOT NULL,
	[FunctionSystemID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_Permisions] PRIMARY KEY CLUSTERED 
(
	[ActionID] ASC,
	[FunctionSystemID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanDetails]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GlueName] [nvarchar](max) NULL,
	[BPFCName] [nvarchar](max) NULL,
	[GlueID] [int] NOT NULL,
	[Supplier] [nvarchar](max) NULL,
	[Consumption] [float] NOT NULL,
	[PlanID] [int] NOT NULL,
 CONSTRAINT [PK_PlanDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plans]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plans](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BuildingID] [int] NOT NULL,
	[BPFCEstablishID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[BPFCName] [nvarchar](max) NULL,
	[HourlyOutput] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[DueDate] [datetime2](7) NOT NULL,
	[StartWorkingTime] [datetime2](7) NOT NULL,
	[FinishWorkingTime] [datetime2](7) NOT NULL,
	[WorkingHour] [int] NOT NULL,
	[IsGenarateTodo] [bit] NOT NULL,
	[IsRefreshTodo] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[DeleteTime] [datetime2](7) NOT NULL,
	[ModifyTime] [datetime2](7) NOT NULL,
	[DeleteBy] [int] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[IsChangeBPFC] [bit] NOT NULL,
	[IsOvertime] [bit] NOT NULL,
	[UpdatedTime] [datetime2](7) NULL,
	[IsOffline] [bit] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedNoOvertime] [datetime2](7) NULL,
	[UpdatedNoOvertimeBy] [int] NOT NULL,
	[UpdatedOffline] [datetime2](7) NULL,
	[UpdatedOfflineBy] [int] NOT NULL,
	[UpdatedOnline] [datetime2](7) NULL,
	[UpdatedOnlineBy] [int] NOT NULL,
	[UpdatedOvertime] [datetime2](7) NULL,
	[UpdatedOvertimeBy] [int] NOT NULL,
 CONSTRAINT [PK_Plans] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Processes]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Processes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Processes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Remarks]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Remarks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Remarks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Code] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScaleMachines]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScaleMachines](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MachineType] [nvarchar](max) NULL,
	[Unit] [nvarchar](max) NULL,
	[BuildingID] [int] NOT NULL,
	[MachineID] [int] NOT NULL,
 CONSTRAINT [PK_ScaleMachines] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[MachineType] [nvarchar](max) NULL,
	[GlueTypeID] [int] NULL,
	[MachineCode] [nvarchar](max) NULL,
	[MinRPM] [int] NOT NULL,
	[MaxRPM] [int] NOT NULL,
	[BuildingID] [int] NOT NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shakes]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shakes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ChemicalType] [nvarchar](max) NULL,
	[StandardCycle] [float] NOT NULL,
	[ActualCycle] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[StartTime] [datetime2](7) NULL,
	[EndTime] [datetime2](7) NULL,
	[MixingInfoID] [int] NOT NULL,
 CONSTRAINT [PK_Shakes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stations]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [int] NOT NULL,
	[GlueID] [int] NOT NULL,
	[PlanID] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[DeleteBy] [int] NOT NULL,
	[CreateTime] [datetime2](7) NOT NULL,
	[DeleteTime] [datetime2](7) NULL,
	[ModifyTime] [datetime2](7) NULL,
 CONSTRAINT [PK_Stations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StirRawData]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StirRawData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BuildingID] [int] NOT NULL,
	[MachineID] [int] NOT NULL,
	[RPM] [float] NOT NULL,
	[Building] [nvarchar](max) NULL,
	[Sequence] [int] NOT NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[Duration] [int] NOT NULL,
 CONSTRAINT [PK_StirRawData] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stirs]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stirs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GlueName] [nvarchar](max) NULL,
	[SettingID] [int] NULL,
	[RPM] [int] NOT NULL,
	[ActualDuration] [int] NOT NULL,
	[StandardDuration] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[TotalMinutes] [float] NOT NULL,
	[MixingInfoID] [int] NOT NULL,
	[StartTime] [datetime2](7) NOT NULL,
	[EndTime] [datetime2](7) NOT NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[StartScanTime] [datetime2](7) NOT NULL,
	[StartStiringTime] [datetime2](7) NOT NULL,
	[FinishStiringTime] [datetime2](7) NOT NULL,
	[MachineID] [int] NULL,
 CONSTRAINT [PK_Stirs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubpackageCapacity]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubpackageCapacity](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Capacity] [float] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[UpdatedTime] [datetime2](7) NULL,
 CONSTRAINT [PK_SubpackageCapacity] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subpackages]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subpackages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[GlueNameID] [int] NOT NULL,
	[MixingInfoID] [int] NOT NULL,
	[GlueName] [nvarchar](max) NULL,
	[Amount] [float] NOT NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Code] [nvarchar](max) NULL,
	[PrintTime] [datetime2](7) NULL,
	[Position] [int] NOT NULL,
 CONSTRAINT [PK_Subpackages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[isShow] [bit] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ToDoList]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ToDoList](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PlanID] [int] NOT NULL,
	[MixingInfoID] [int] NOT NULL,
	[GlueID] [int] NOT NULL,
	[GlueNameID] [int] NOT NULL,
	[BuildingID] [int] NOT NULL,
	[LineID] [int] NOT NULL,
	[BPFCID] [int] NOT NULL,
	[LineName] [nvarchar](max) NULL,
	[GlueName] [nvarchar](max) NULL,
	[Supplier] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[AbnormalStatus] [bit] NOT NULL,
	[StartMixingTime] [datetime2](7) NULL,
	[FinishMixingTime] [datetime2](7) NULL,
	[StartStirTime] [datetime2](7) NULL,
	[FinishStirTime] [datetime2](7) NULL,
	[StartDispatchingTime] [datetime2](7) NULL,
	[FinishDispatchingTime] [datetime2](7) NULL,
	[PrintTime] [datetime2](7) NULL,
	[StandardConsumption] [float] NOT NULL,
	[MixedConsumption] [float] NOT NULL,
	[DeliveredConsumption] [float] NOT NULL,
	[EstimatedStartTime] [datetime2](7) NOT NULL,
	[EstimatedFinishTime] [datetime2](7) NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[DeleteTime] [datetime2](7) NOT NULL,
	[DeleteBy] [int] NOT NULL,
	[IsEVA_UV] [bit] NOT NULL,
	[KindID] [int] NOT NULL,
 CONSTRAINT [PK_ToDoList] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[LineID] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
	[IsLock] [bit] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NULL,
	[PasswordHash] [varbinary](max) NULL,
	[PasswordSalt] [varbinary](max) NULL,
	[Email] [nvarchar](max) NULL,
	[AccessTokenLineNotify] [nvarchar](max) NULL,
	[DeleteBy] [int] NOT NULL,
	[EmployeeID] [nvarchar](max) NULL,
	[ImageBase64] [varbinary](max) NULL,
	[ImageURL] [nvarchar](max) NULL,
	[IsShow] [bit] NOT NULL,
	[LevelOC] [int] NOT NULL,
	[ModifyTime] [datetime2](7) NOT NULL,
	[OCID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
	[isLeader] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Versions]    Script Date: 1/9/2023 9:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Versions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[UploadBy] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[UpatedTime] [datetime2](7) NOT NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Versions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Additions] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Dispatches] ADD  DEFAULT ((0)) FOR [DeleteBy]
GO
ALTER TABLE [dbo].[Dispatches] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Dispatches] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [EstimatedFinishTime]
GO
ALTER TABLE [dbo].[Dispatches] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [EstimatedStartTime]
GO
ALTER TABLE [dbo].[Dispatches] ADD  DEFAULT ((0)) FOR [GlueNameID]
GO
ALTER TABLE [dbo].[Dispatches] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[DispatchList] ADD  DEFAULT ((0)) FOR [ColorCode]
GO
ALTER TABLE [dbo].[DispatchList] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [FinishTimeOfPeriod]
GO
ALTER TABLE [dbo].[DispatchList] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [StartTimeOfPeriod]
GO
ALTER TABLE [dbo].[DispatchList] ADD  DEFAULT (CONVERT([bit],(0))) FOR [AbnormalStatus]
GO
ALTER TABLE [dbo].[DispatchList] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[DispatchList] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [CreatedTime]
GO
ALTER TABLE [dbo].[DispatchList] ADD  DEFAULT ((0.0000000000000000e+000)) FOR [DeliveredAmount]
GO
ALTER TABLE [dbo].[Ingredients] ADD  DEFAULT ((0.0000000000000000e+000)) FOR [StandardCycle]
GO
ALTER TABLE [dbo].[LunchTime] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[LunchTime] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [CreatedTime]
GO
ALTER TABLE [dbo].[LunchTime] ADD  DEFAULT ((0)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[LunchTime] ADD  DEFAULT ((0)) FOR [DeletedBy]
GO
ALTER TABLE [dbo].[LunchTime] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[MixingInfoDetails] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [Time_Start]
GO
ALTER TABLE [dbo].[MixingInfos] ADD  DEFAULT ((0)) FOR [GlueNameID]
GO
ALTER TABLE [dbo].[Permisions] ADD  DEFAULT ((0)) FOR [RoleID]
GO
ALTER TABLE [dbo].[Plans] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsChangeBPFC]
GO
ALTER TABLE [dbo].[Plans] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsOvertime]
GO
ALTER TABLE [dbo].[Plans] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsOffline]
GO
ALTER TABLE [dbo].[Plans] ADD  DEFAULT ((0)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[Plans] ADD  DEFAULT ((0)) FOR [UpdatedNoOvertimeBy]
GO
ALTER TABLE [dbo].[Plans] ADD  DEFAULT ((0)) FOR [UpdatedOfflineBy]
GO
ALTER TABLE [dbo].[Plans] ADD  DEFAULT ((0)) FOR [UpdatedOnlineBy]
GO
ALTER TABLE [dbo].[Plans] ADD  DEFAULT ((0)) FOR [UpdatedOvertimeBy]
GO
ALTER TABLE [dbo].[StirRawData] ADD  DEFAULT ((0)) FOR [Duration]
GO
ALTER TABLE [dbo].[Subpackages] ADD  DEFAULT ((0)) FOR [Position]
GO
ALTER TABLE [dbo].[ToDoList] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsEVA_UV]
GO
ALTER TABLE [dbo].[ToDoList] ADD  DEFAULT ((0)) FOR [KindID]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [DeleteBy]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsShow]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [LevelOC]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [ModifyTime]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [OCID]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [RoleID]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (CONVERT([bit],(0))) FOR [isLeader]
GO
ALTER TABLE [dbo].[ActionInFunctionSystem]  WITH CHECK ADD  CONSTRAINT [FK_ActionInFunctionSystem_Actions_ActionID] FOREIGN KEY([ActionID])
REFERENCES [dbo].[Actions] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActionInFunctionSystem] CHECK CONSTRAINT [FK_ActionInFunctionSystem_Actions_ActionID]
GO
ALTER TABLE [dbo].[ActionInFunctionSystem]  WITH CHECK ADD  CONSTRAINT [FK_ActionInFunctionSystem_FunctionSystem_FunctionSystemID] FOREIGN KEY([FunctionSystemID])
REFERENCES [dbo].[FunctionSystem] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActionInFunctionSystem] CHECK CONSTRAINT [FK_ActionInFunctionSystem_FunctionSystem_FunctionSystemID]
GO
ALTER TABLE [dbo].[Additions]  WITH CHECK ADD  CONSTRAINT [FK_Additions_BPFCEstablishes_BPFCEstablishID] FOREIGN KEY([BPFCEstablishID])
REFERENCES [dbo].[BPFCEstablishes] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Additions] CHECK CONSTRAINT [FK_Additions_BPFCEstablishes_BPFCEstablishID]
GO
ALTER TABLE [dbo].[Additions]  WITH CHECK ADD  CONSTRAINT [FK_Additions_Buildings_LineID] FOREIGN KEY([LineID])
REFERENCES [dbo].[Buildings] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Additions] CHECK CONSTRAINT [FK_Additions_Buildings_LineID]
GO
ALTER TABLE [dbo].[Additions]  WITH CHECK ADD  CONSTRAINT [FK_Additions_Ingredients_ChemicalID] FOREIGN KEY([ChemicalID])
REFERENCES [dbo].[Ingredients] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Additions] CHECK CONSTRAINT [FK_Additions_Ingredients_ChemicalID]
GO
ALTER TABLE [dbo].[ArticleNos]  WITH CHECK ADD  CONSTRAINT [FK_ArticleNos_ModelNos_ModelNoID] FOREIGN KEY([ModelNoID])
REFERENCES [dbo].[ModelNos] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ArticleNos] CHECK CONSTRAINT [FK_ArticleNos_ModelNos_ModelNoID]
GO
ALTER TABLE [dbo].[ArtProcesses]  WITH CHECK ADD  CONSTRAINT [FK_ArtProcesses_ArticleNos_ArticleNoID] FOREIGN KEY([ArticleNoID])
REFERENCES [dbo].[ArticleNos] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ArtProcesses] CHECK CONSTRAINT [FK_ArtProcesses_ArticleNos_ArticleNoID]
GO
ALTER TABLE [dbo].[ArtProcesses]  WITH CHECK ADD  CONSTRAINT [FK_ArtProcesses_Processes_ProcessID] FOREIGN KEY([ProcessID])
REFERENCES [dbo].[Processes] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ArtProcesses] CHECK CONSTRAINT [FK_ArtProcesses_Processes_ProcessID]
GO
ALTER TABLE [dbo].[BPFCEstablishes]  WITH CHECK ADD  CONSTRAINT [FK_BPFCEstablishes_ArticleNos_ArticleNoID] FOREIGN KEY([ArticleNoID])
REFERENCES [dbo].[ArticleNos] ([ID])
GO
ALTER TABLE [dbo].[BPFCEstablishes] CHECK CONSTRAINT [FK_BPFCEstablishes_ArticleNos_ArticleNoID]
GO
ALTER TABLE [dbo].[BPFCEstablishes]  WITH CHECK ADD  CONSTRAINT [FK_BPFCEstablishes_ArtProcesses_ArtProcessID] FOREIGN KEY([ArtProcessID])
REFERENCES [dbo].[ArtProcesses] ([ID])
GO
ALTER TABLE [dbo].[BPFCEstablishes] CHECK CONSTRAINT [FK_BPFCEstablishes_ArtProcesses_ArtProcessID]
GO
ALTER TABLE [dbo].[BPFCEstablishes]  WITH CHECK ADD  CONSTRAINT [FK_BPFCEstablishes_ModelNames_ModelNameID] FOREIGN KEY([ModelNameID])
REFERENCES [dbo].[ModelNames] ([ID])
GO
ALTER TABLE [dbo].[BPFCEstablishes] CHECK CONSTRAINT [FK_BPFCEstablishes_ModelNames_ModelNameID]
GO
ALTER TABLE [dbo].[BPFCEstablishes]  WITH CHECK ADD  CONSTRAINT [FK_BPFCEstablishes_ModelNos_ModelNoID] FOREIGN KEY([ModelNoID])
REFERENCES [dbo].[ModelNos] ([ID])
GO
ALTER TABLE [dbo].[BPFCEstablishes] CHECK CONSTRAINT [FK_BPFCEstablishes_ModelNos_ModelNoID]
GO
ALTER TABLE [dbo].[Buildings]  WITH CHECK ADD  CONSTRAINT [FK_Buildings_BuildingType_BuildingTypeID] FOREIGN KEY([BuildingTypeID])
REFERENCES [dbo].[BuildingType] ([ID])
GO
ALTER TABLE [dbo].[Buildings] CHECK CONSTRAINT [FK_Buildings_BuildingType_BuildingTypeID]
GO
ALTER TABLE [dbo].[Buildings]  WITH CHECK ADD  CONSTRAINT [FK_Buildings_Kinds_KindID] FOREIGN KEY([KindID])
REFERENCES [dbo].[Kinds] ([ID])
GO
ALTER TABLE [dbo].[Buildings] CHECK CONSTRAINT [FK_Buildings_Kinds_KindID]
GO
ALTER TABLE [dbo].[Buildings]  WITH CHECK ADD  CONSTRAINT [FK_Buildings_LunchTime_LunchTimeID] FOREIGN KEY([LunchTimeID])
REFERENCES [dbo].[LunchTime] ([ID])
GO
ALTER TABLE [dbo].[Buildings] CHECK CONSTRAINT [FK_Buildings_LunchTime_LunchTimeID]
GO
ALTER TABLE [dbo].[BuildingUser]  WITH CHECK ADD  CONSTRAINT [FK_BuildingUser_Buildings_BuildingID] FOREIGN KEY([BuildingID])
REFERENCES [dbo].[Buildings] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BuildingUser] CHECK CONSTRAINT [FK_BuildingUser_Buildings_BuildingID]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_BPFCEstablishes_BPFCEstablishID] FOREIGN KEY([BPFCEstablishID])
REFERENCES [dbo].[BPFCEstablishes] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_BPFCEstablishes_BPFCEstablishID]
GO
ALTER TABLE [dbo].[Dispatches]  WITH CHECK ADD  CONSTRAINT [FK_Dispatches_Buildings_LineID] FOREIGN KEY([LineID])
REFERENCES [dbo].[Buildings] ([ID])
GO
ALTER TABLE [dbo].[Dispatches] CHECK CONSTRAINT [FK_Dispatches_Buildings_LineID]
GO
ALTER TABLE [dbo].[Dispatches]  WITH CHECK ADD  CONSTRAINT [FK_Dispatches_DispatchList_DispatchListID] FOREIGN KEY([DispatchListID])
REFERENCES [dbo].[DispatchList] ([ID])
GO
ALTER TABLE [dbo].[Dispatches] CHECK CONSTRAINT [FK_Dispatches_DispatchList_DispatchListID]
GO
ALTER TABLE [dbo].[Dispatches]  WITH CHECK ADD  CONSTRAINT [FK_Dispatches_MixingInfos_MixingInfoID] FOREIGN KEY([MixingInfoID])
REFERENCES [dbo].[MixingInfos] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Dispatches] CHECK CONSTRAINT [FK_Dispatches_MixingInfos_MixingInfoID]
GO
ALTER TABLE [dbo].[DispatchList]  WITH CHECK ADD  CONSTRAINT [FK_DispatchList_Plans_PlanID] FOREIGN KEY([PlanID])
REFERENCES [dbo].[Plans] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DispatchList] CHECK CONSTRAINT [FK_DispatchList_Plans_PlanID]
GO
ALTER TABLE [dbo].[DispatchListDetail]  WITH CHECK ADD  CONSTRAINT [FK_DispatchListDetail_DispatchList_DispatchListID] FOREIGN KEY([DispatchListID])
REFERENCES [dbo].[DispatchList] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DispatchListDetail] CHECK CONSTRAINT [FK_DispatchListDetail_DispatchList_DispatchListID]
GO
ALTER TABLE [dbo].[FunctionSystem]  WITH CHECK ADD  CONSTRAINT [FK_FunctionSystem_FunctionSystem_ParentID] FOREIGN KEY([ParentID])
REFERENCES [dbo].[FunctionSystem] ([ID])
GO
ALTER TABLE [dbo].[FunctionSystem] CHECK CONSTRAINT [FK_FunctionSystem_FunctionSystem_ParentID]
GO
ALTER TABLE [dbo].[FunctionSystem]  WITH CHECK ADD  CONSTRAINT [FK_FunctionSystem_Modules_ModuleID] FOREIGN KEY([ModuleID])
REFERENCES [dbo].[Modules] ([ID])
GO
ALTER TABLE [dbo].[FunctionSystem] CHECK CONSTRAINT [FK_FunctionSystem_Modules_ModuleID]
GO
ALTER TABLE [dbo].[FunctionTranslations]  WITH CHECK ADD  CONSTRAINT [FK_FunctionTranslations_FunctionSystem_FunctionSystemID] FOREIGN KEY([FunctionSystemID])
REFERENCES [dbo].[FunctionSystem] ([ID])
GO
ALTER TABLE [dbo].[FunctionTranslations] CHECK CONSTRAINT [FK_FunctionTranslations_FunctionSystem_FunctionSystemID]
GO
ALTER TABLE [dbo].[FunctionTranslations]  WITH CHECK ADD  CONSTRAINT [FK_FunctionTranslations_Languages_LanguageID] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([ID])
GO
ALTER TABLE [dbo].[FunctionTranslations] CHECK CONSTRAINT [FK_FunctionTranslations_Languages_LanguageID]
GO
ALTER TABLE [dbo].[GlueIngredient]  WITH CHECK ADD  CONSTRAINT [FK_GlueIngredient_Glues_GlueID] FOREIGN KEY([GlueID])
REFERENCES [dbo].[Glues] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GlueIngredient] CHECK CONSTRAINT [FK_GlueIngredient_Glues_GlueID]
GO
ALTER TABLE [dbo].[GlueIngredient]  WITH CHECK ADD  CONSTRAINT [FK_GlueIngredient_Ingredients_IngredientID] FOREIGN KEY([IngredientID])
REFERENCES [dbo].[Ingredients] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GlueIngredient] CHECK CONSTRAINT [FK_GlueIngredient_Ingredients_IngredientID]
GO
ALTER TABLE [dbo].[Glues]  WITH CHECK ADD  CONSTRAINT [FK_Glues_BPFCEstablishes_BPFCEstablishID] FOREIGN KEY([BPFCEstablishID])
REFERENCES [dbo].[BPFCEstablishes] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Glues] CHECK CONSTRAINT [FK_Glues_BPFCEstablishes_BPFCEstablishID]
GO
ALTER TABLE [dbo].[Glues]  WITH CHECK ADD  CONSTRAINT [FK_Glues_Kinds_KindID] FOREIGN KEY([KindID])
REFERENCES [dbo].[Kinds] ([ID])
GO
ALTER TABLE [dbo].[Glues] CHECK CONSTRAINT [FK_Glues_Kinds_KindID]
GO
ALTER TABLE [dbo].[Glues]  WITH CHECK ADD  CONSTRAINT [FK_Glues_Materials_MaterialID] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Materials] ([ID])
GO
ALTER TABLE [dbo].[Glues] CHECK CONSTRAINT [FK_Glues_Materials_MaterialID]
GO
ALTER TABLE [dbo].[Glues]  WITH CHECK ADD  CONSTRAINT [FK_Glues_Parts_PartID] FOREIGN KEY([PartID])
REFERENCES [dbo].[Parts] ([ID])
GO
ALTER TABLE [dbo].[Glues] CHECK CONSTRAINT [FK_Glues_Parts_PartID]
GO
ALTER TABLE [dbo].[Ingredients]  WITH CHECK ADD  CONSTRAINT [FK_Ingredients_GlueTypes_GlueTypeID] FOREIGN KEY([GlueTypeID])
REFERENCES [dbo].[GlueTypes] ([ID])
GO
ALTER TABLE [dbo].[Ingredients] CHECK CONSTRAINT [FK_Ingredients_GlueTypes_GlueTypeID]
GO
ALTER TABLE [dbo].[Ingredients]  WITH CHECK ADD  CONSTRAINT [FK_Ingredients_Supplier_SupplierID] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ingredients] CHECK CONSTRAINT [FK_Ingredients_Supplier_SupplierID]
GO
ALTER TABLE [dbo].[Kinds]  WITH CHECK ADD  CONSTRAINT [FK_Kinds_KindType_KindTypeID] FOREIGN KEY([KindTypeID])
REFERENCES [dbo].[KindType] ([ID])
GO
ALTER TABLE [dbo].[Kinds] CHECK CONSTRAINT [FK_Kinds_KindType_KindTypeID]
GO
ALTER TABLE [dbo].[MixingInfoDetails]  WITH CHECK ADD  CONSTRAINT [FK_MixingInfoDetails_Ingredients_IngredientID] FOREIGN KEY([IngredientID])
REFERENCES [dbo].[Ingredients] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MixingInfoDetails] CHECK CONSTRAINT [FK_MixingInfoDetails_Ingredients_IngredientID]
GO
ALTER TABLE [dbo].[MixingInfoDetails]  WITH CHECK ADD  CONSTRAINT [FK_MixingInfoDetails_MixingInfos_MixingInfoID] FOREIGN KEY([MixingInfoID])
REFERENCES [dbo].[MixingInfos] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MixingInfoDetails] CHECK CONSTRAINT [FK_MixingInfoDetails_MixingInfos_MixingInfoID]
GO
ALTER TABLE [dbo].[MixingInfos]  WITH CHECK ADD  CONSTRAINT [FK_MixingInfos_Glues_GlueID] FOREIGN KEY([GlueID])
REFERENCES [dbo].[Glues] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MixingInfos] CHECK CONSTRAINT [FK_MixingInfos_Glues_GlueID]
GO
ALTER TABLE [dbo].[ModelNos]  WITH CHECK ADD  CONSTRAINT [FK_ModelNos_ModelNames_ModelNameID] FOREIGN KEY([ModelNameID])
REFERENCES [dbo].[ModelNames] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ModelNos] CHECK CONSTRAINT [FK_ModelNos_ModelNames_ModelNameID]
GO
ALTER TABLE [dbo].[ModuleTranslations]  WITH CHECK ADD  CONSTRAINT [FK_ModuleTranslations_Languages_LanguageID] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([ID])
GO
ALTER TABLE [dbo].[ModuleTranslations] CHECK CONSTRAINT [FK_ModuleTranslations_Languages_LanguageID]
GO
ALTER TABLE [dbo].[ModuleTranslations]  WITH CHECK ADD  CONSTRAINT [FK_ModuleTranslations_Modules_ModuleID] FOREIGN KEY([ModuleID])
REFERENCES [dbo].[Modules] ([ID])
GO
ALTER TABLE [dbo].[ModuleTranslations] CHECK CONSTRAINT [FK_ModuleTranslations_Modules_ModuleID]
GO
ALTER TABLE [dbo].[PeriodDispatch]  WITH CHECK ADD  CONSTRAINT [FK_PeriodDispatch_PeriodMixing_PeriodMixingID] FOREIGN KEY([PeriodMixingID])
REFERENCES [dbo].[PeriodMixing] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PeriodDispatch] CHECK CONSTRAINT [FK_PeriodDispatch_PeriodMixing_PeriodMixingID]
GO
ALTER TABLE [dbo].[PeriodMixing]  WITH CHECK ADD  CONSTRAINT [FK_PeriodMixing_Buildings_BuildingID] FOREIGN KEY([BuildingID])
REFERENCES [dbo].[Buildings] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PeriodMixing] CHECK CONSTRAINT [FK_PeriodMixing_Buildings_BuildingID]
GO
ALTER TABLE [dbo].[Permisions]  WITH CHECK ADD  CONSTRAINT [FK_Permisions_Actions_ActionID] FOREIGN KEY([ActionID])
REFERENCES [dbo].[Actions] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Permisions] CHECK CONSTRAINT [FK_Permisions_Actions_ActionID]
GO
ALTER TABLE [dbo].[Permisions]  WITH CHECK ADD  CONSTRAINT [FK_Permisions_FunctionSystem_FunctionSystemID] FOREIGN KEY([FunctionSystemID])
REFERENCES [dbo].[FunctionSystem] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Permisions] CHECK CONSTRAINT [FK_Permisions_FunctionSystem_FunctionSystemID]
GO
ALTER TABLE [dbo].[Permisions]  WITH CHECK ADD  CONSTRAINT [FK_Permisions_Roles_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Permisions] CHECK CONSTRAINT [FK_Permisions_Roles_RoleID]
GO
ALTER TABLE [dbo].[PlanDetails]  WITH CHECK ADD  CONSTRAINT [FK_PlanDetails_Plans_PlanID] FOREIGN KEY([PlanID])
REFERENCES [dbo].[Plans] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlanDetails] CHECK CONSTRAINT [FK_PlanDetails_Plans_PlanID]
GO
ALTER TABLE [dbo].[Plans]  WITH CHECK ADD  CONSTRAINT [FK_Plans_BPFCEstablishes_BPFCEstablishID] FOREIGN KEY([BPFCEstablishID])
REFERENCES [dbo].[BPFCEstablishes] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Plans] CHECK CONSTRAINT [FK_Plans_BPFCEstablishes_BPFCEstablishID]
GO
ALTER TABLE [dbo].[Plans]  WITH CHECK ADD  CONSTRAINT [FK_Plans_Buildings_BuildingID] FOREIGN KEY([BuildingID])
REFERENCES [dbo].[Buildings] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Plans] CHECK CONSTRAINT [FK_Plans_Buildings_BuildingID]
GO
ALTER TABLE [dbo].[Settings]  WITH CHECK ADD  CONSTRAINT [FK_Settings_Buildings_BuildingID] FOREIGN KEY([BuildingID])
REFERENCES [dbo].[Buildings] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Settings] CHECK CONSTRAINT [FK_Settings_Buildings_BuildingID]
GO
ALTER TABLE [dbo].[Settings]  WITH CHECK ADD  CONSTRAINT [FK_Settings_GlueTypes_GlueTypeID] FOREIGN KEY([GlueTypeID])
REFERENCES [dbo].[GlueTypes] ([ID])
GO
ALTER TABLE [dbo].[Settings] CHECK CONSTRAINT [FK_Settings_GlueTypes_GlueTypeID]
GO
ALTER TABLE [dbo].[Stations]  WITH CHECK ADD  CONSTRAINT [FK_Stations_Glues_GlueID] FOREIGN KEY([GlueID])
REFERENCES [dbo].[Glues] ([ID])
GO
ALTER TABLE [dbo].[Stations] CHECK CONSTRAINT [FK_Stations_Glues_GlueID]
GO
ALTER TABLE [dbo].[Stirs]  WITH CHECK ADD  CONSTRAINT [FK_Stirs_Settings_SettingID] FOREIGN KEY([SettingID])
REFERENCES [dbo].[Settings] ([ID])
GO
ALTER TABLE [dbo].[Stirs] CHECK CONSTRAINT [FK_Stirs_Settings_SettingID]
GO
ALTER TABLE [dbo].[ToDoList]  WITH CHECK ADD  CONSTRAINT [FK_ToDoList_Plans_PlanID] FOREIGN KEY([PlanID])
REFERENCES [dbo].[Plans] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ToDoList] CHECK CONSTRAINT [FK_ToDoList_Plans_PlanID]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles_RoleID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles_RoleID]
GO
