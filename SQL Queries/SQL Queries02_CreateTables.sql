IF NOT EXISTS (
    SELECT name 
    FROM sys.databases 
    WHERE name = 'MiniECommerceDB'
)

CREATE DATABASE MiniECommerceDB;


USE MiniECommerceDB;



CREATE TABLE Category (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255),
    CONSTRAINT UQ_Category_Name UNIQUE (Name)
);

CREATE TABLE Customer (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    Email NVARCHAR(255) NOT NULL,
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    CONSTRAINT UQ_Customer_Email UNIQUE (Email)
);

CREATE TABLE Product (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryID INT NOT NULL,
    Name NVARCHAR(150) NOT NULL,
    Description NVARCHAR(255),
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Product_Category 
        FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE Inventory (
    InventoryID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT NOT NULL,
    CONSTRAINT UQ_Inventory_Product UNIQUE (ProductID),
    CONSTRAINT FK_Inventory_Product 
        FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE [Order] (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATETIME NOT NULL DEFAULT GETDATE(),
    Status NVARCHAR(50) NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL CHECK (TotalAmount >= 0),
    CONSTRAINT FK_Order_Customer 
        FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE OrderItem (
    OrderItemID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UnitPrice DECIMAL(10,2) NOT NULL CHECK (UnitPrice >= 0),
    CONSTRAINT FK_OrderItem_Order 
        FOREIGN KEY (OrderID) REFERENCES [Order](OrderID),
    CONSTRAINT FK_OrderItem_Product 
        FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    CONSTRAINT UQ_OrderItem UNIQUE (OrderID, ProductID)
);

CREATE TABLE Payment (
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    CONSTRAINT UQ_Payment_Order UNIQUE (OrderID),
    CONSTRAINT FK_Payment_Order 
        FOREIGN KEY (OrderID) REFERENCES [Order](OrderID)
);