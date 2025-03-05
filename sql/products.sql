-- Drop the table if it exists
DROP TABLE IF EXISTS Products;

-- Create the table with the appropriate columns and data types
CREATE TABLE Products
(
    ProductID VARCHAR(255),                -- Integer type for ProductID
    ProductName VARCHAR(255),      -- VARCHAR type for ProductName
    Category VARCHAR(100),        -- VARCHAR type for Category
    ListPrice VARCHAR(255)      -- DECIMAL type for ListPrice with 4 decimal places
)
WITH
(
    DISTRIBUTION = HASH(ProductID)  -- Distribute data based on ProductID
);
