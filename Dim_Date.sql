SELECT [DateKey]
      ,[FullDateAlternateKey] As Date 
      --,[DayNumberOfWeek] 
      ,[EnglishDayNameOfWeek] As Day 
      --,[SpanishDayNameOfWeek]
      --,[FrenchDayNameOfWeek]
      --,[DayNumberOfMonth]
      --,[DayNumberOfYear]
      --,[WeekNumberOfYear]
      ,[EnglishMonthName] As Month
	  ,left([EnglishMonthName],3) As MonthShort 
      --,[SpanishMonthName]
      --,[FrenchMonthName]
      ,[MonthNumberOfYear] As MonthNo
      ,[CalendarQuarter] As Quarter 
      ,[CalendarYear] As Year 
      --,[CalendarSemester]
      --,[FiscalQuarter]
      --,[FiscalYear]
      --,[FiscalSemester]
  FROM [AdventureWorksDW].[dbo].[DimDate]
  Where CalendarYear>=2019

  Create Table [dbo].[DimDateCleaned](
  [DateKey] INT,
  [Date] Date,
  [Day] NVARCHAR(50),
  [Month] NVARCHAR(50),
  [MonthShort] NVARCHAR(3),
  [MonthNo] INT,
  [Quarter] INT,
  [Year] INT
);

Insert Into [dbo].[DimDateCleaned]([DateKey],[Date],[Day],[Month],[MonthShort],[MonthNo],[Quarter],[Year])
SELECT [DateKey]
      ,[FullDateAlternateKey] As Date 
      ,[EnglishDayNameOfWeek] As Day 
      ,[EnglishMonthName] As Month
	  ,left([EnglishMonthName],3) As MonthShort 
      ,[MonthNumberOfYear] As MonthNo
      ,[CalendarQuarter] As Quarter 
      ,[CalendarYear] As Year 
  FROM [AdventureWorksDW].[dbo].[DimDate]
  Where CalendarYear>=2019

  select * from [dbo].[DimDateCleaned]