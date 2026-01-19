-- 07_CRUD_Delete.sql
-- Demonstrates DELETE operations with awareness of foreign key constraints

-- Delete a customer with no related orders
DELETE FROM Customer
WHERE Email = 'unused.customer@example.com';

-- Delete order items first (child table)
DELETE FROM OrderItem
WHERE OrderID = 6;

---- Delete the order itself
DELETE FROM [Order]
WHERE OrderID = 6;


-- This delete will fail if the product is used in OrderItem
 DELETE FROM Product
 WHERE ProductID = 1;

-- Products that are referenced by OrderItem should not be deleted.
-- Instead, products are deactivated using IsActive = 0

-- Verify dependent data before delete
SELECT *
FROM OrderItem
WHERE ProductID = 1;
