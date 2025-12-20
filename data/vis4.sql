
SELECT 
     YEAR(OrderDate) AS År,
     ROUND(SUM(SubTotal),2) AS TotalFörsäjning,
     COUNT(DISTINCT SalesOrderID) AS AntalOrdrar
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate)
ORDER BY År DESC 