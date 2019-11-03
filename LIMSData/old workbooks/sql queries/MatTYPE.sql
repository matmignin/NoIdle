/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [MATCODE]
      ,[MATNAME]
      ,[MATTYPE]
  FROM [STARLIMSLIVE_DATA].[dbo].[MATERIALS]
  ORDER BY MATTYPE;