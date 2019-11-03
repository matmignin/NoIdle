/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Mat_MatCode]
      ,[Mat_MatDesc]
      ,[Bat_Lot]
      ,[SP_TestPlan]
   --   ,[Ord_SplLogDate]
      ,[Test_Lab]
      ,[Res_TestCode]
      ,[Res_TestName]
      ,[Analyte]
      ,[Numeric_Result]
      ,[Res_Units]
      ,[Rounding_Rule]
      ,[Low_Release_Limit]
      ,[High_Release_Limit]
      ,[METHOD]
  FROM [STARLIMSLIVE_DATA].[dbo].[LIMS_Results_old]
  WHERE Bat_Lot Like '9g413'
  Order By Mat_MatCode;