/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [SAMPLEGROUPNAME]
      ,[SAMPGRTYPE]
      ,[PRODGROUP]
      ,[MATCODE]
      ,[DEPT]
      ,[PLANT]
      ,[SUBGROUPNAME]
  FROM [STARLIMSLIVE_DATA].[dbo].[IPSAMPLEGRPOUPS]
  WHERE DEPT = 'NY'