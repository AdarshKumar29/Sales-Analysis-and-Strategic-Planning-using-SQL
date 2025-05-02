SELECT TOP (1000) [ProductKey]
      ,[ProductAlternateKey]
      --,[ProductSubcategoryKey]
      --,[WeightUnitMeasureCode]
      --,[SizeUnitMeasureCode]
      ,[EnglishProductName]
      --,[SpanishProductName]
      --,[FrenchProductName]
      --,[StandardCost]
      --,[FinishedGoodsFlag]
      ,[Color]
      --,[SafetyStockLevel]
      --,[ReorderPoint]
      --,[ListPrice]
      ,[Size]
      --,[SizeRange]
      --,[Weight]
      --,[DaysToManufacture]
      ,[ProductLine]
      --,[DealerPrice]
      --,[Class]
      --,[Style]
      ,[ModelName]
      --,[LargePhoto]
      ,[EnglishDescription]
      --,[FrenchDescription]
      --,[ChineseDescription]
      --,[ArabicDescription]
      --,[HebrewDescription]
      --,[ThaiDescription]
      --,[GermanDescription]
      --,[JapaneseDescription]
      --,[TurkishDescription]
      --,[StartDate]
      --,[EndDate]
      ,[Status]
  FROM [AdventureWorksDW].[dbo].[DimProduct]


  -- Cleaned DIM_Product Table --
  SELECT 
       p.[ProductKey]
      ,p.[ProductAlternateKey] As [ProductItemCode]
      --,[ProductSubcategoryKey]
      --,[WeightUnitMeasureCode]
      --,[SizeUnitMeasureCode]
      ,p.[EnglishProductName] As [Product Name]
	  ,ps.EnglishProductSubcategoryName As [Subcategory Name]
	  ,pc.EnglishProductCategoryName As [Product Category]
      --,[SpanishProductName]
      --,[FrenchProductName]
      --,[StandardCost]
      --,[FinishedGoodsFlag]
      ,p.[Color] As [Product Color]
      --,[SafetyStockLevel]
      --,[ReorderPoint]
      --,[ListPrice]
      ,p.[Size] As [Product Size]
      --,[SizeRange]
      --,[Weight]
      --,[DaysToManufacture]
      ,p.[ProductLine] As [Product Line]
      --,[DealerPrice]
      --,[Class]
      --,[Style]
      ,p.[ModelName] As [Product Model Name]
      --,[LargePhoto]
      ,p.[EnglishDescription] As [Product Description]
      --,[FrenchDescription]
      --,[ChineseDescription]
      --,[ArabicDescription]
      --,[HebrewDescription]
      --,[ThaiDescription]
      --,[GermanDescription]
      --,[JapaneseDescription]
      --,[TurkishDescription]
      --,[StartDate]
      --,[EndDate]
      ,Isnull(p.Status,'outdated') As [Product Status]
  FROM [AdventureWorksDW].[dbo].[DimProduct] as p
  Left Join dbo.DimProductSubcategory As ps on ps.ProductSubcategoryKey = p.ProductSubcategoryKey
  Left Join dbo.DimProductCategory As pc on ps.ProductCategoryKey = pc.ProductCategoryKey
  order by 
  p.ProductKey asc

 Create Table [dbo].[DimProductCleaned](
	[ProductKey] INT,
	[ProductItemCode] NVARCHAR(50),
	[ProductName] NVARCHAR(255),
	[SubCategory] NVARCHAR(255),
	[ProductCategory] NVARCHAR(255),
	[ProductColor] NVARCHAR(50),
	[ProductSize] NVARCHAR(50),
	[ProductLine] NVARCHAR(50),
	[ProductModelName] NVARCHAR(255),
	[ProductDescription] NVARCHAR(Max),
	[ProductStatus] NVARCHAR(50)
);

Insert Into [dbo].[DimProductCleaned](
	[ProductKey],
	[ProductItemCode],
	[ProductName],
	[SubCategory],
	[ProductCategory],
	[ProductColor],
	[ProductSize],
	[ProductLine],
	[ProductModelName],
	[ProductDescription],
	[ProductStatus]
)

SELECT 
       p.[ProductKey],
       p.[ProductAlternateKey] As [ProductItemCode],
       p.[EnglishProductName] As [Product Name],
	   ps.EnglishProductSubcategoryName As [Subcategory Name],
	   pc.EnglishProductCategoryName As [Product Category],
       p.[Color] As [Product Color],
       p.[Size] As [Product Size],
       p.[ProductLine] As [Product Line],
       p.[ModelName] As [Product Model Name],
       p.[EnglishDescription] As [Product Description],
       Isnull(p.Status,'outdated') As [Product Status]
  FROM [AdventureWorksDW].[dbo].[DimProduct] as p
  Left Join dbo.DimProductSubcategory As ps on ps.ProductSubcategoryKey = p.ProductSubcategoryKey
  Left Join dbo.DimProductCategory As pc on ps.ProductCategoryKey = pc.ProductCategoryKey
  order by 
  p.ProductKey asc

  select * from [dbo].[DimProductCleaned]
