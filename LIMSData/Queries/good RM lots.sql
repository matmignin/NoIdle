/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Mat_MatCode]
 ,[Mat_MatDesc]
      ,[Bat_Lot]
      ,[Ord_SampNum]
      ,[SP_TestPlan]
      ,[Ord_SplLogDate]
      ,[Ord_SampStat]
      ,[Ord_SampDispStat]
      ,[Test_Lab]
      ,[Res_TestCode]
      ,[Res_TestName]
      ,[TestStatus]
      ,[Analyte]
      ,[Numeric_Result]
      ,[Final_Result]
      ,[Res_Units]
      ,[Rounding_Rule]
      ,[Result_Type]
      ,[Character_Limits]
      ,[Low_Release_Limit]
      ,[High_Release_Limit]
      ,[Low_Alert_Limit]
      ,[High_Alert_Limit]
      ,[Bat_ExpDate]
      ,[PRINTFLAG]
      ,[METHOD]
      ,[ATTBY]
      ,[ATTDATE]
  FROM [STARLIMSLIVE_DATA].[dbo].[LIMS_Results_old]
  WHERE [Mat_MatCode] LIKE '7[a-x]%'
  and [Mat_MatCode] NOT LIKE '[a-x]%' 
  and [SP_TestPlan] LIKE '%Analyti%'
  AND Ord_SampStat LIKE 'Done'
  and Bat_Lot LIKE '1[8-9]000%'
  Order By Bat_Lot;