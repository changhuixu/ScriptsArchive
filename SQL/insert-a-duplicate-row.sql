INSERT INTO [dbo].[ChargeRates]
SELECT '2023-07-01 00:00:00.000'
      ,'2024-07-01 00:00:00.000'
      ,[FirstHourRate]
      ,[StudentStandardRate]
      ,[StandardRate]
      ,[GraduatedRate]
      ,[DailyMaximum]
      ,[FreeMinutes]
      ,[StudentFirstHourRate]
      ,[StudentDailyMaximum]
      ,[EmeritusNwValue]
      ,[MaxGmeFreeHours]
      ,[MaxGmeStandardHours]
      ,[StudentTransactionMaximum]
      ,[StudentConsecutive]
      ,[EmeritusValue]
  FROM [dbo].[ChargeRates]
  WHERE EffectiveDate='2022-07-01 00:00:00.000'