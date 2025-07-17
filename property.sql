SELECT 
    p.PropertyType
    ,COUNT (*) AS NumberOfSales
FROM 
    PricePaidSW12 p
GROUP BY
    p.PropertyType
ORDER BY
    NumberOfSales DESC

SELECT * FROM PricePaidSW12

-- number of sales by year
SELECT 
    YEAR(P.TransactionDate) AS TheYear
    ,COUNT (*) AS NumberOfSales
FROM 
    PricePaidSW12 p
GROUP BY
    YEAR(P.TransactionDate)
ORDER BY
    TheYear


-- total market value in £ Millions of all the sales each year
SELECT 
    YEAR(P.TransactionDate) AS TheYear
    ,COUNT (*) AS NumberOfSales
    ,sum(p.Price) / 1000000.0 AS "MarketValue £m"
FROM 
    PricePaidSW12 p
GROUP BY
    YEAR(P.TransactionDate)
ORDER BY
    TheYear

-- earliest and latest dates of a sale
SELECT 
    MIN(p.TransactionDate) AS EarliestSaleDate,
    MAX(p.TransactionDate) AS LatestSaleDate
FROM 
    PricePaidSW12 p;

-- List all the sales in 2018 between £400,000 and £500,000 in Cambray Road (a street in SW12)
SELECT
    p.TransactionDate
    ,p.Price
    ,p.Street
    ,p.County
FROM
    PricePaidSW12 p
WHERE
    p.Street = 'Cambray Road'
    AND p.Price BETWEEN 400000 AND 500000
    AND p.TransactionDate BETWEEN '2018-01-01' AND '2018-12-31'
ORDER BY p.TransactionDate;

-- List all the sales in 2018 between £400,000 and £500,000 in Cambray Road
SELECT 
    p.TransactionDate
    ,p.Price
    ,p.Street
    ,p.County
FROM 
    PricePaidSW12 p
WHERE 
    YEAR(p.TransactionDate) = 2018
    AND p.Price BETWEEN 400000 AND 500000
    AND p.Street = 'Cambray Road';

-- List all the sales in 2018 between £400,000 and £500,000 in Cambray Road and Midmoor Road
SELECT 
    p.TransactionDate
    ,p.Price
    ,p.Street
    ,p.County
FROM 
    PricePaidSW12 p
WHERE 
    YEAR(p.TransactionDate) IN (2018,2017)
    AND p.Price > 400000
    AND p.Street IN ('Cambray Road','Midoor Road')

-- Homework Part 1
-- Write a SQL query that Write a SQL query that lists the 25 latest sales in Ormeley Road with the following fields: 
-- TransactionDate, Price, PostCode, PAON

SELECT TOP 25
    p.TransactionDate
    , p.Price
    , p.PostCode
    , p.PAON
FROM 
    PricePaidSW12 p
WHERE
    p.Street = 'Ormeley Road'
ORDER BY
    p.TransactionDate DESC


-- Homework Part 2
-- There is a table named PropertyTypeLookup .  This has columns PropertyTypeCode  and PropertyTypeName.  
-- The values in PropertyTypeCode  match those in the PropertyType column of The PricePaidSW12 table.   
-- The values in PropertyTypeName are the full name of the property type e.g. Flat, Terraced
-- Write a SQL query that joins on table  PropertyTypeLookup to include column PropertyTypeName in the result.

-- Use to see column list
SELECT
    *
FROM
    PricePaidSW12 p


SELECT TOP 25
    p.TransactionDate
    ,p.Price
    ,p.PostCode
    ,p.PAON
    ,p.PropertyType
    ,pt.PropertyTypeName
FROM
    PricePaidSW12 p LEFT JOIN PropertyTypeLookup pt ON p.PropertyType = pt.PropertyTypeCode
WHERE Street = 'Ormeley Road'
ORDER BY TransactionDate DESC

