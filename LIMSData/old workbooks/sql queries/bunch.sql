/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [METHOD]
      ,[TESTCODE]
      ,[DEPT]
      ,[EQTYPE]
      ,[SERVGRP]
  FROM [STARLIMSLIVE_DATA].[dbo].[METHODSRELATEDTOTESTS]
  WHERE Dept='NY' and SERVGRP!='NY-Microbiology';
  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT [METHOD]
      ,[TESTCODE]
      ,[SP_CODE]
      ,[SERVGRP]
      ,[DEFAULTMETHOD]
  FROM [STARLIMSLIVE_DATA].[dbo].[METHODSRELSPTESTS]
  WHERE Dept='NY' and SERVGRP!='NY-Microbiology';
  SELECT[SUPPNAM]
      ,[SUPPCODE]
	  ,[SUPPADD]
      ,[SUPPCITY]
  FROM [STARLIMSLIVE_DATA].[dbo].[SUPPLIERS];
  SELECT [METHOD]
      ,[DESCRIPTION]
  FROM [STARLIMSLIVE_DATA].[dbo].[TEST_METHODS];
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT[METHOD]
      ,[STARTDDATE]
      ,[STATUS]
      ,[VERSION]
  FROM [STARLIMSLIVE_DATA].[dbo].[TEST_METHODS_VERSIONS]
  WHERE STATUS='Approved';