

SELECT * FROM Production.ProductCategory 
SELECT * FROM Production.ProductSubcategory
SELeCT * FROM Production.Product
SELECT * FROM Sales.SalesOrderDetail 


SELECT 
    pc.Name AS ProduktKategori,
    ROUND(SUM(sod.LineTotal), 2) AS TotalFörsäjning
FROM Sales.SalesOrderDetail sod 
INNER JOIN Production.Product p  ON p.ProductID = sod.ProductID 
INNER JOIN Production.ProductSubcategory psc ON p.ProductSubCategoryID = psc.ProductSubCategoryID
INNER JOIN Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name
ORDER BY SUM(sod.LineTotal) DESC
