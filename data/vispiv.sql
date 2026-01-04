SELECT 
    pc.Name AS Kategori,
    COUNT(DISTINCT p.ProductID) AS AntalProdukter,
    SUM(sod.OrderQty) AS TotalKvantitet,
    SUM(sod.LineTotal) AS Försäljning,
    SUM((sod.UnitPrice - p.StandardCost) * sod.OrderQty) AS  Marginal,
    100.0 *
        SUM(sod.LineTotal - (p.StandardCost * sod.OrderQty))
        / SUM(sod.LineTotal) AS MarginalProcent
FROM Sales.SalesOrderDetail sod 
INNER JOIN Production.Product p ON sod.ProductID = p.ProductID
INNER JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
INNER JOIN Production.ProductCategory pc  ON ps.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name
ORDER BY Försäljning DESC 

