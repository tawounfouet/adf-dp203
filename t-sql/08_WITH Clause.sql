/*
Description: This script demonstrates the usage of Common Table Expression (CTE) named CTE_Products.
            The CTE retrieves order quantity, product ID, and unit price from the SalesOrderDetail table
            in the SalesLT schema, and then selects all records from the CTE.

Tables used:
- SalesLT.SalesOrderDetail

Columns selected:
- OrderQty: Quantity ordered for each product
- ProductID: Unique identifier for the product
- UnitPrice: Price per unit of the product

Note: CTEs are temporary named result sets that exist only within the scope of a single SELECT,
      INSERT, UPDATE, DELETE, MERGE, or REFRESH statement.
*/
WITH CTE_Products AS
    (
    SELECT OrderQty,ProductID,UnitPrice
    FROM SalesLT.SalesOrderDetail
    )
SELECT * FROM CTE_Products;
