SELECT TOP (1000) [CustomerKey]
      --,[GeographyKey]
      --,[CustomerAlternateKey]
      --,[Title]
      ,[FirstName]
      --,[MiddleName]
      ,[LastName]
      --,[NameStyle]
      --,[BirthDate]
      --,[MaritalStatus]
      --,[Suffix]
      ,[Gender]
      --,[EmailAddress]
      --,[YearlyIncome]
      --,[TotalChildren]
      --,[NumberChildrenAtHome]
      --,[EnglishEducation]
      --,[SpanishEducation]
      --,[FrenchEducation]
      --,[EnglishOccupation]
      --,[SpanishOccupation]
      --,[FrenchOccupation]
      --,[HouseOwnerFlag]
      --,[NumberCarsOwned]
      --,[AddressLine1]
      --,[AddressLine2]
      --,[Phone]
      ,[DateFirstPurchase]
      --,[CommuteDistance]
  FROM [AdventureWorksDW].[dbo].[DimCustomer]

  SELECT
	c.[CustomerKey] As CustomerKey,
    c.[FirstName] As [First Name],
	c.[LastName] As [Last Name],
	c.FirstName+' '+LastName As [Full Name],
CASE c.[Gender] When 'M' Then 'Male' when 'F' Then 'Female' End As Gender,
	c.[DateFirstPurchase] As DateFirstPurchase,

	g.city As [Customer City] --Joined in Customer City from Geography Table
	FROM [dbo].[DimCustomer] As c
	Left Join dbo.DimGeography As g on g.GeographyKey = c.GeographyKey
	order by
	CustomerKey Asc



Create Table [dbo].[DimCustomerCleaned](
[CustomerKey] INT,
[FirstName] NVARCHAR(50),
[LastName] NVARCHAR(50),
[FullName] NVARCHAR(101),
[Gender] NVARCHAR(10),
[DateFirstPurchase] Date,
[CustomerCity] NVARCHAR(100)
);

Insert Into [dbo].[DimCustomerCleaned](
[CustomerKey],
[FirstName],
[LastName],
[FullName],
[Gender],
[DateFirstPurchase],
[CustomerCity]
)

SELECT
	c.[CustomerKey] As CustomerKey,
    c.[FirstName] As [First Name],
	c.[LastName] As [Last Name],
	c.FirstName+' '+LastName As [Full Name],
CASE c.[Gender] When 'M' Then 'Male' when 'F' Then 'Female' End As Gender,
	c.[DateFirstPurchase] As DateFirstPurchase,

	g.city As [Customer City] --Joined in Customer City from Geography Table
	FROM [dbo].[DimCustomer] As c
	Left Join dbo.DimGeography As g on g.GeographyKey = c.GeographyKey
	order by
	CustomerKey Asc



	Select * from [dbo].[DimCustomerCleaned]