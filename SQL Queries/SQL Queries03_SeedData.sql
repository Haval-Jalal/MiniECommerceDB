USE MiniECommerceDB;


INSERT INTO Category (Name, Description) VALUES
('Shoes', 'All types of shoes'),
('Shirts', 'Casual and formal shirts'),
('Accessories', 'Belts, caps and bags'),
('Sportswear', 'Clothing for training and gym'),
('Outerwear', 'Jackets and coats');


INSERT INTO Customer (Email, FirstName, LastName) VALUES
('anna.svensson@example.com', 'Anna', 'Svensson'),
('erik.johansson@example.com', 'Erik', 'Johansson'),
('lisa.nilsson@example.com', 'Lisa', 'Nilsson'),
('markus.larsson@example.com', 'Markus', 'Larsson'),
('emma.karlsson@example.com', 'Emma', 'Karlsson');


INSERT INTO Product (CategoryID, Name, Description, IsActive) VALUES
(1, 'Running Shoes', 'Lightweight running shoes', 1),
(1, 'Sneakers', 'Everyday sneakers', 1),
(2, 'White Shirt', 'Classic white shirt', 1),
(2, 'Black T-Shirt', 'Basic black t-shirt', 1),
(3, 'Leather Belt', 'Genuine leather belt', 1),
(3, 'Baseball Cap', 'Adjustable cap', 1),
(4, 'Training Shorts', 'Breathable sports shorts', 1),
(4, 'Hoodie', 'Warm training hoodie', 1),
(5, 'Winter Jacket', 'Waterproof winter jacket', 1),
(5, 'Rain Coat', 'Lightweight rain coat', 1);


INSERT INTO Inventory (ProductID) VALUES
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10);


INSERT INTO [Order] (CustomerID, Status, TotalAmount) VALUES
(1, 'Pending', 0),
(2, 'Paid', 0),
(3, 'Paid', 0),
(4, 'Pending', 0),
(5, 'Paid', 0);


INSERT INTO OrderItem (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 2, 799.00),
(1, 5, 1, 299.00),

(2, 3, 1, 499.00),
(2, 6, 2, 199.00),

(3, 2, 1, 699.00),
(3, 7, 1, 349.00),
(3, 8, 1, 599.00),

(4, 4, 3, 149.00),

(5, 9, 1, 1299.00),
(5, 10, 1, 899.00);


INSERT INTO Payment (OrderID) VALUES
(2),
(3),
(5);