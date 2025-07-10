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

-- List all the sales in 2018 between £400,000 and £500,000 in Cambray Road
SELECT 
    *
FROM 
    PricePaidSW12 p
WHERE 
    YEAR(p.TransactionDate) = 2018
    AND p.Price BETWEEN 400000 AND 500000
    AND p.Street = 'Cambray Road';

