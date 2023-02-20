use CDR
go

truncate table dbo.cdr_import
--truncate table dbo.calls
go

set DATEFORMAT dmy
BULK INSERT dbo.cdr_import
FROM 'E:\\Temp\techtest_cdr.csv'
WITH
(
 FIRSTROW = 2,
 CODEPAGE='RAW',
 FIELDTERMINATOR=',',
 ROWTERMINATOR = '\n'
)
go

insert into Calls 
   (        caller_id
          , recipient
          , call_date
          , end_time
          , duration
          , cost
          , reference
          , currency
  )
select    
            caller_id
          , recipient
          , call_date
          , end_time
          , duration
          , cost
          , reference
          , currency
from [dbo].[cdr_import]
go