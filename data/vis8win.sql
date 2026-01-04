SELECT TOP 10
    p.ProductID AS ProduktID,
    p.Name as ProduktNamn,
    SUM(sod.LineTotal) AS Försäljning,
    SUM((sod.UnitPrice - p.StandardCost) * sod.OrderQty) AS  Marginal,
    100 * SUM(sod.LineTotal - (p.StandardCost * sod.OrderQty)) / SUM(sod.LineTotal) AS MarginalProcent
FROM Sales.SalesOrderDetail sod 
INNER JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
INNER JOIN Production.Product p ON sod.ProductID = p.ProductID
GROUP BY P.ProductID, p.Name
ORDER BY Marginal DESC 

