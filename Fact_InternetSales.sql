SELECT [ProductKey]
      ,[OrderDateKey]
      ,[DueDateKey]
      ,[ShipDateKey]
      ,[CustomerKey]
      --,[PromotionKey]
      --,[CurrencyKey]
      --,[SalesTerritoryKey]
      --,[SalesOrderNumber]
      ,[SalesOrderNumber]
      --,[RevisionNumber]
      --,[OrderQuantity]
      --,[UnitPrice]
      --,[ExtendedAmount]
      --,[UnitPriceDiscountPct]
      --,[DiscountAmount]
      --,[ProductStandardCost]
      --,[TotalProductCost]
      ,[SalesAmount]
      --,[TaxAmt]
      --,[Freight]
      --,[CarrierTrackingNumber]
      --,[CustomerPONumber]
      --,[OrderDate]
      --,[DueDate]
      --,[ShipDate]
  FROM [AdventureWorksDW].[dbo].[FactInternetSales]
  Where Left(OrderDateKey,4) >= 2019
  Order by
  OrderDateKey Asc



  Create Table [dbo].[FactInternetSalesCleaned](
  [ProductKey] INT,
  [OrderDateKey] INT,
  [DueDateKey] INT,
  [ShipDateKey] INT,
  [CustomerKey] INT,
  [SalesOrderNumber] NVARCHAR(50),
  [SalesAmount] DECIMAL(18,2)
);

Insert Into [dbo].[FactInternetSalesCleaned](
[ProductKey],
  [OrderDateKey],
  [DueDateKey],
  [ShipDateKey],
  [CustomerKey],
  [SalesOrderNumber],
  [SalesAmount]
)


SELECT [ProductKey]
      ,[OrderDateKey]
      ,[DueDateKey]
      ,[ShipDateKey]
      ,[CustomerKey]
      ,[SalesOrderNumber]
      ,[SalesAmount]
  FROM [AdventureWorksDW].[dbo].[FactInternetSales]
  Where Left(OrderDateKey,4) >= 2019
  Order by
  OrderDateKey Asc

  Select * from [dbo].[FactInternetSalesCleaned]