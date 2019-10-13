/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [ANALYTE]
      ,[CHARLIMITS]
      ,[ORIGSTS]
      ,[PICTURE]
      ,[PRINTFLAG]
      ,[SCHEMANAME]
      ,[SPECNO]
      ,[SPECSORTER]
      ,[SYNONIM]
      ,[TESTCODE]
      ,[UNITS]
      ,[SPTESTSORTER]
  FROM (
  SELECT DISTINCT [SYNONIM] 
  FROM [STARLIMSLIVE_DATA].[dbo].[SPEC_ANALYTES]);


