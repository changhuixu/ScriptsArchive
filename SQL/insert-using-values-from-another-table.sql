INSERT INTO table1 ( column1, column2, someInt, someVarChar )
SELECT  table2.column1, table2.column2, 8, 'some string etc.'
FROM    table2
WHERE   table2.ID = 7;


UPDATE #Table1
SET    address = #Table2.address,
       phone2 = #Table2.phone
FROM   #Table2
WHERE  #Table2.gender = #Table1.gender
       AND #Table2.birthdate = #Table1.birthdate

-- or

UPDATE 
     t1
SET 
     t1.column = t2.column
FROM 
     Table1 t1 
     INNER JOIN Table2 t2 
     ON t1.id = t2.id;