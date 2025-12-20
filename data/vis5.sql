SELECT TOP 10
    p.Name AS ProduktNamn,
    SUM(sod.LineTotal) AS Försäljning
FROM Production.Product p  
INNER JOIN Sales.SalesOrderDetail sod ON p.ProductID = sod.ProductID
GROUP BY p.Name
ORDER BY Försäljning DESC