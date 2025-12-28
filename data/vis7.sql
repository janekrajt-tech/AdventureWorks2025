SELECT 
    st.Name AS Region,
    CASE 
        WHEN c.StoreID IS NOT NULL THEN 'Store'
        ELSE 'Individual'
    END AS 'Kundtyp',
    COUNT(DISTINCT(soh.SalesOrderID)) AS AntalOrdrar,
    SUM(soh.SubTotal) AS TotalFörsäljning,
    AVG(soh.SubTotal) AS AvgOrdervärde
FROM Sales.SalesOrderHeader soh 
INNER JOIN Sales.SalesTerritory st 
ON soh.TerritoryID = st.TerritoryID
INNER JOIN Sales.Customer c 
ON soh.CustomerID = c.CustomerID
GROUP BY st.Name,
        CASE 
            WHEN c.StoreID IS NOT NULL THEN 'Store'
            ELSE 'Individual'
         END


