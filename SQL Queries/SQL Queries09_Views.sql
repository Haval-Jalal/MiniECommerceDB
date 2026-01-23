CREATE VIEW vw_OrderSummary
AS
SELECT
    o.OrderID,
    c.FirstName,
    c.LastName,
    o.OrderDate,
    o.Status,
    o.TotalAmount
FROM [Order] o
JOIN Customer c ON o.CustomerID = c.CustomerID;

GO

CREATE VIEW vw_ProductOverview
AS
SELECT
    p.ProductID,
    p.Name AS ProductName,
    c.Name AS CategoryName,
    p.IsActive,
    p.CreatedAt
FROM Product p
JOIN Category c ON p.CategoryID = c.CategoryID
JOIN Inventory i ON p.ProductID = i.ProductID;