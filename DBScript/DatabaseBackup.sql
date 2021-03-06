USE [master]
GO
/****** Object:  Database [Curatekart_Dev]    Script Date: 06-02-2021 23:20:24 ******/
CREATE DATABASE [Curatekart_Dev]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Curatekart_Dev', FILENAME = N'C:\Users\Shweta\Curatekart_Dev.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Curatekart_Dev_log', FILENAME = N'C:\Users\Shweta\Curatekart_Dev_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Curatekart_Dev] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Curatekart_Dev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Curatekart_Dev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Curatekart_Dev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Curatekart_Dev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Curatekart_Dev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Curatekart_Dev] SET ARITHABORT OFF 
GO
ALTER DATABASE [Curatekart_Dev] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Curatekart_Dev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Curatekart_Dev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Curatekart_Dev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Curatekart_Dev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Curatekart_Dev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Curatekart_Dev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Curatekart_Dev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Curatekart_Dev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Curatekart_Dev] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Curatekart_Dev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Curatekart_Dev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Curatekart_Dev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Curatekart_Dev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Curatekart_Dev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Curatekart_Dev] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Curatekart_Dev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Curatekart_Dev] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Curatekart_Dev] SET  MULTI_USER 
GO
ALTER DATABASE [Curatekart_Dev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Curatekart_Dev] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Curatekart_Dev] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Curatekart_Dev] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Curatekart_Dev] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Curatekart_Dev] SET QUERY_STORE = OFF
GO
USE [Curatekart_Dev]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Curatekart_Dev]
GO
/****** Object:  Table [dbo].[Cart_Discount_Rule]    Script Date: 06-02-2021 23:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart_Discount_Rule](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BasketPriceMargin] [numeric](18, 2) NOT NULL,
	[Discount] [numeric](18, 2) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Basket_Discount_Rule] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartContent]    Script Date: 06-02-2021 23:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartContent](
	[ProductID] [int] NOT NULL,
	[UnitsAdded] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M_Product]    Script Date: 06-02-2021 23:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[ProductDesc] [nvarchar](255) NULL,
 CONSTRAINT [PK_M_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Discount_Rule]    Script Date: 06-02-2021 23:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Discount_Rule](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Discount] [numeric](18, 2) NULL,
	[ApplicableOnUnits] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Product_Discount_Rule] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Inventory]    Script Date: 06-02-2021 23:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Inventory](
	[ProductID] [int] NOT NULL,
	[UnitsAvailable] [int] NOT NULL,
	[PricePerUnit] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product_Discount_Rule] ADD  CONSTRAINT [DF_Product_Discount_Rule_ApplicableOnUnits]  DEFAULT ((0)) FOR [ApplicableOnUnits]
GO
ALTER TABLE [dbo].[Product_Inventory] ADD  CONSTRAINT [DF_Product_Inventory_UnitsAvailable]  DEFAULT ((0)) FOR [UnitsAvailable]
GO
ALTER TABLE [dbo].[CartContent]  WITH CHECK ADD  CONSTRAINT [FK_CartContent_M_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[M_Product] ([ID])
GO
ALTER TABLE [dbo].[CartContent] CHECK CONSTRAINT [FK_CartContent_M_Product]
GO
ALTER TABLE [dbo].[Product_Discount_Rule]  WITH CHECK ADD  CONSTRAINT [FK_Product_Discount_Rule_M_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[M_Product] ([ID])
GO
ALTER TABLE [dbo].[Product_Discount_Rule] CHECK CONSTRAINT [FK_Product_Discount_Rule_M_Product]
GO
ALTER TABLE [dbo].[Product_Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Product_Inventory_M_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[M_Product] ([ID])
GO
ALTER TABLE [dbo].[Product_Inventory] CHECK CONSTRAINT [FK_Product_Inventory_M_Product]
GO
/****** Object:  StoredProcedure [dbo].[AddProductToCart]    Script Date: 06-02-2021 23:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Shweta Singh>
-- Create date: <Create Date,05-Feb-2021,>
-- Description:	<Description,Adds Product to Cart,>
-- =============================================
CREATE PROCEDURE [dbo].[AddProductToCart]
	-- Add the parameters for the stored procedure here
	@ProductID int ,
	@UnitsAdded int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if(exists(select ProductID from CartContent where ProductID=@ProductID))
	begin
	update CartContent set UnitsAdded=UnitsAdded+@UnitsAdded where ProductID=@ProductID
	end
	else 
	begin
	insert into CartContent(ProductID,UnitsAdded) values(@ProductID,@UnitsAdded);
	end
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllProductDetails]    Script Date: 06-02-2021 23:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Shweta Singh>
-- Create date: <Create Date,05-Feb-2021,>
-- Description:	<Description,Get Details of Product,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllProductDetails]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select p.*,
	case when inv.UnitsAvailable>0 then 'In Stock'
	else 'Out Of Stock' end
	as ProductStatus
	from M_Product p
	inner join Product_Inventory inv 
	on p.ID=inv.ProductID

END
GO
/****** Object:  StoredProcedure [dbo].[GetCartDiscount]    Script Date: 06-02-2021 23:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Shweta Singh>
-- Create date: <Create Date,06-Feb-2021,>
-- Description:	<Description,Fetch Cart Discount if applicable,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCartDiscount]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if object_id('tempdb..#s') is not null
    drop table #s
declare @grandtotal numeric(18,2) 
create table #s(
 ID int not null
,UnitsAdded int null
,ProductName nvarchar(50)  null
,ProductDesc nvarchar(50)  null
,IsDiscountApplicable nvarchar(50) null
,OriginalPrice numeric(18,2)  null
,ProductDiscount numeric(18,2)  null
,PriceToPay numeric(18,2)  null

)
 
 
-- manipulate IDENTITY_INSERT property for
-- #soh table while inserting rows
-- from the stored procedure into the table

insert into #s
  (
    ID
   ,ProductName
   ,ProductDesc
   ,UnitsAdded
   ,IsDiscountApplicable
   ,OriginalPrice
   ,ProductDiscount
   ,PriceToPay
  )
exec [GetCartProductDetails]
set @grandtotal=(select Sum(PriceToPay) as GrandTotal from #s);
select top 1 IsActive as IsCartDiscountApplicable, Discount, BasketPriceMargin from Cart_Discount_Rule where BasketPriceMargin<@grandtotal and IsActive=1
order by BasketPriceMargin desc
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetCartProductDetails]    Script Date: 06-02-2021 23:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Shweta Singh>
-- Create date: <Create Date,05-Feb-2021,>
-- Description:	<Description,Fetch Cart Product Details,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCartProductDetails]
	-- Add the parameters for the stored procedure here
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
		
	select mp.*,cc.UnitsAdded 
	,case when pdr.IsActive=1 and pdr.ApplicableOnUnits<=cc.UnitsAdded then 'Discount Applied!' else 'Not eligible for Discount!'
	end as IsDiscountApplicable,
	cc.UnitsAdded * inv.PricePerUnit as OriginalPrice
	,case when pdr.IsActive=1 and pdr.ApplicableOnUnits<=cc.UnitsAdded 
	then (cc.UnitsAdded/pdr.ApplicableOnUnits)*pdr.Discount else 0
	end as ProductDiscount,
	case when exists(select ProductID from Product_Discount_Rule where ProductID=mp.id) then
	(cc.UnitsAdded * inv.PricePerUnit)-((cc.UnitsAdded/pdr.ApplicableOnUnits)*pdr.Discount)
	else (cc.UnitsAdded * inv.PricePerUnit)
	end
	as PriceToPay
	from M_Product mp 
	inner join CartContent cc on mp.ID=cc.ProductID
	inner join Product_Inventory inv on mp.id=inv.ProductID
	left join Product_Discount_Rule pdr on mp.id=pdr.ProductID
	
	--select * from CartContent
END
GO
/****** Object:  StoredProcedure [dbo].[RemoveProductFromCart]    Script Date: 06-02-2021 23:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Shweta Singh>
-- Create date: <Create Date,05-Feb-2021,>
-- Description:	<Description,Remove Product from Cart,>
-- =============================================
CREate PROCEDURE [dbo].[RemoveProductFromCart]
	-- Add the parameters for the stored procedure here
	@ProductID int 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if(exists(select ProductID from CartContent where ProductID=@ProductID))
	begin
	delete from CartContent where ProductID=@ProductID
	end
	
	--select * from CartContent
END
GO
USE [master]
GO
ALTER DATABASE [Curatekart_Dev] SET  READ_WRITE 
GO
