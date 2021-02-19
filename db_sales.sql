CREATE TABLE sales(
	[SalesID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[SalesQuantity] [varchar](55) NOT NULL,
	[SalesDate] [date] NOT NULL,
	[UnitPrice] [numeric](10, 2) NULL,
	[TotalPrice] [numeric](10, 2) NULL,
);
