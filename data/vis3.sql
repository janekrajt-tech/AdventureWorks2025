SELECT 
    MONTH(OrderDate) AS Månad,
    ROUND(SUM(SubTotal),2) AS Månadsförsäljning

FROM Sales.SalesOrderHeader 
WHERE OrderDate >= '2023-01-01' AND OrderDate < '2023-12-31'
GROUP BY MONTH(OrderDate)  
ORDER BY Månad ASC;