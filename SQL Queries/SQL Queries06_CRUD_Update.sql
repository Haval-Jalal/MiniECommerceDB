-- 06_CRUD_Update.sql
-- Demonstrates UPDATE operations on main and related tables

-- Update customer last name
UPDATE Customer
SET LastName = 'Doe-Smith'
WHERE Email = 'john.doe@example.com';

-- Deactivate a product
UPDATE Product
SET IsActive = 0
WHERE ProductID = 10;

-- Update order status
UPDATE [Order]
SET Status = 'Paid'
WHERE OrderID = 1;

UPDATE o
SET o.Status = 'Paid'
FROM [Order] o
JOIN Customer c ON o.CustomerID = c.CustomerID
WHERE c.Email = 'anna.svensson@example.com'
  AND o.Status = 'Pending';

-- Verify rows before update
SELECT *
FROM [Order]
WHERE Status = 'Pending';