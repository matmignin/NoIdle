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
  WHERE Ord_SplLogDate >= '2019-01-01' 
  And Ord_SplLogDate < '2019-10-01' 
  -- and Test_Lab = 'NY-Analytical' 
  and Mat_MatCode NOT Like '[a-x]%_%' 
  and Bat_Lot NOT Like '9[a-x]%_%'
  and SP_TestPlan NOT LIKE 'Microbiology%'
  Order By Mat_MatCode;