SELECT 
    p.ProductID AS ProduktID,
    p.Name as ProduktNamn,
    SUM(sod.LineTotal) AS Försäljning,
    SUM(sod.OrderQty) AS Kvantitet
FROM Sales.SalesOrderDetail sod 
INNER JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
INNER JOIN Production.Product p ON sod.ProductID = p.ProductID
GROUP BY P.ProductID, p.Name
ORDER BY Kvantitet DESC, 
         Försäljning ASC 
