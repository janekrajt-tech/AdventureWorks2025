SELECT *  FROM Sales.SalesTerritory
SELECT *  FROM Sales.SalesOrderHeader
SELECT *  FROM Sales.Customer

SELECT 
    st.Name AS Region,
    SUM(soh.SubTotal) AS Försäljning,
    COUNT(DISTINCT(C.CustomerID)) AS AntalKunder
FROM Sales.SalesTerritory st  
INNER JOIN Sales.SalesOrderHeader soh ON st.TerritoryID = soh.TerritoryID
INNER JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
GROUP BY st.Name 
ORDER BY Försäljning DESC 

