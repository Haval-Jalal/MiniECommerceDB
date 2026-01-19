USE MiniECommerceDB;

-- 04_CRUD_Insert.sql
-- Demonstrates INSERT operations for main tables and junction table

-- Insert a new customer
INSERT INTO Customer (Email, FirstName, LastName)
VALUES ('john.doe@example.com', 'John', 'Doe');

-- Insert a new order for the new customer
INSERT INTO [Order] (CustomerID, Status, TotalAmount)
VALUES (6, 'Pending', 0);

-- Insert products into the order (OrderItem)
INSERT INTO OrderItem (OrderID, ProductID, Quantity, UnitPrice)
VALUES
(6, 1, 2, 799.00),
(6, 3, 1, 499.00);


-- Example of transactional insert (order + order items)
BEGIN TRANSACTION;

INSERT INTO [Order] (CustomerID, Status, TotalAmount)
VALUES (6, 'Pending', 0);

DECLARE @NewOrderID INT = SCOPE_IDENTITY();

INSERT INTO OrderItem (OrderID, ProductID, Quantity, UnitPrice)
VALUES
(@NewOrderID, 2, 1, 699.00),
(@NewOrderID, 4, 2, 149.00);

-- If something goes wrong, rollback can be used
-- ROLLBACK;

COMMIT;