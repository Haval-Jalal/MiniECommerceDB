USE MiniECommerceDB;
GO

CREATE PROCEDURE sp_UpdateOrderStatus
    @OrderID INT,
    @NewStatus NVARCHAR(50)
AS
BEGIN
    UPDATE [dbo].[Order]
    SET Status = @NewStatus
    WHERE OrderID = @OrderID;
END;
GO

CREATE PROCEDURE sp_CreateOrder
    @CustomerID INT,
    @ProductID INT,
    @Quantity INT,
    @UnitPrice DECIMAL(10,2)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    BEGIN TRY
        INSERT INTO [dbo].[Order] (CustomerID, Status, TotalAmount)
        VALUES (@CustomerID, 'Pending', @Quantity * @UnitPrice);

        DECLARE @NewOrderID INT = SCOPE_IDENTITY();

        INSERT INTO OrderItem (OrderID, ProductID, Quantity, UnitPrice)
        VALUES (@NewOrderID, @ProductID, @Quantity, @UnitPrice);

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        THROW;
    END CATCH
END;
GO


--SELECT OrderID, Status
--FROM [dbo].[Order]
--ORDER BY OrderID;


--EXEC sp_UpdateOrderStatus 1, 'Paid';

--SELECT OrderID, Status
--FROM [dbo].[Order]
--WHERE OrderID = 1;

--EXEC sp_CreateOrder
--    @CustomerID = 1,
--    @ProductID = 2,
--    @Quantity = 2,
--    @UnitPrice = 699.00;

--SELECT TOP 1 *
--FROM [dbo].[Order]
--ORDER BY OrderID DESC;

--SELECT *
--FROM OrderItem
--WHERE OrderID = (SELECT MAX(OrderID) FROM [dbo].[Order]);

--SELECT * 
--FROM vw_OrderSummary
--ORDER BY OrderID DESC;

--SELECT * 
--FROM vw_ProductOverview;