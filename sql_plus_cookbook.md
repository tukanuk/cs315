## Create a table

```SQL
CREATE TABLE Airport
    (Airport_Code   VARCHAR2(3),
     Name           VARCHAR2(15),
     City           VARCHAR2(15),
     STATE          VARCHAR2(2),
     PRIMARY KEY(Airport_Code) );
```

## Insert

```SQL
INSERT INTO SalesRep VALUES (1111, 'John Smith', 22, 2000.60);
COMMIT;

# Multiple Lines

INSERT INTO AIRPORT (Airport_code, Name, City, State)
        SELECT 'YYZ', 'Pearson Airport', 'Toronto', 'ON' FROM dual UNION ALL
        SELECT 'YTZ', 'Island Airpot', 'Toronto', 'ON' FROM dual UNION ALL
        SELECT 'YQT', 'Thunder Bay Airport', 'Thunder Bay', 'ON' FROM dual UNION ALL
        SELECT 'YQG', 'Windsor Airport', 'Windsor', 'ON' FROM dual UNION ALL
        SELECT 'YYC', 'Calgary Airport', 'Calgary', 'ON' FROM dual; 
    
    SELECT * FROM AIRPORT;


```


## Select statements

```SQL
select * from cat;          // all table list  
select * from SalesRep;
```

## DELETE data from a table

```SQL
# all data from a table
DELETE FROM airport;

# selected from table
DELETE FROM airport WHERE name='Pearson Airport';
```

## Set the linesize of output

SET LINESIZE 100;

