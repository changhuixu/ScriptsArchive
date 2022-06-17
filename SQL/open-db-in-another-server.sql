SELECT *  
FROM OPENDATASOURCE('SQLNCLI','//connection string')  
    .[IDW2].[directory].[V_Name];  