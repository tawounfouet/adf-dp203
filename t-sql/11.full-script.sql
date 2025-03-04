-- Here we can select all of the rows in the table and get information on all column values
SELECT * FROM SalesLT.SalesOrderDetail;


-- Here we can specific a search criteria to get the details where the ProductID is equal to a certain value
SELECT * FROM SalesLT.SalesOrderDetail
WHERE ProductID=836;

-- We can use equality operators as well
SELECT * FROM SalesLT.SalesOrderDetail
WHERE OrderQty>10;

-- We can specify multiple conditions in the search criteria
SELECT * FROM SalesLT.SalesOrderDetail
WHERE OrderQty>10 AND UnitPrice>100;

-- We can also filter on string values as well
SELECT * FROM SalesLT.Customer
WHERE LastName='Harris';



SELECT * FROM SalesLT.SalesOrderDetail
WHERE OrderQty >10
ORDER BY UnitPrice;

SELECT * FROM SalesLT.SalesOrderDetail
WHERE OrderQty >10
ORDER BY OrderQty DESC;


-- Here we can get the total count of rows that match this condition
SELECT COUNT(*) FROM SalesLT.SalesOrderDetail
WHERE OrderQty>10;

-- We also specify an alias column name for the output
SELECT COUNT(*)  AS 'Count of Rows' FROM SalesLT.SalesOrderDetail
WHERE OrderQty>10;

-- We can get the count based on a particular column
SELECT COUNT(ProductID)  AS 'Count of Products' FROM SalesLT.SalesOrderDetail
WHERE OrderQty>10;

-- We can get the maximum value of a particular column
SELECT MAX(OrderQty) AS 'Max Value of Order Quantity' FROM SalesLT.SalesOrderDetail;


SELECT ProductID,SUM(OrderQty) AS 'Total Order Quantity' FROM SalesLT.SalesOrderDetail
GROUP BY ProductID;


-- If you wanted to use the GROUP BY clause
SELECT ProductID,SUM(OrderQty) As 'Sum of Orders'
FROM SalesLT.SalesOrderDetail
GROUP BY ProductID;

-- Here we are using the PARTITION BY and OVER clause

SELECT ProductID,OrderQty,
SUM(OrderQty) OVER (PARTITION BY ProductID ) As 'Total Order Quantity'
FROM SalesLT.SalesOrderDetail;



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




-- Here we are creating a table
CREATE TABLE Student
(
    StudentID varchar(100) NOT NULL,
    StudentName varchar(1000),
    PRIMARY KEY (StudentID)
);

-- We can add a row of information onto the table

INSERT INTO Student(StudentID,StudentName) VALUES('S01','StudentA');





CREATE TABLE Course (
    CourseID varchar(100) NOT NULL,
    CourseName varchar(1000),
    Price real,    
    PRIMARY KEY (CourseID)
);
 
CREATE TABLE Orders (
    OrderID varchar(100) NOT NULL,
    CourseID varchar(100),
    StudentID varchar(100),    
    Discountpercent int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);


INSERT INTO Student(StudentID,StudentName) values ('S1','StudentA');
INSERT INTO Student(StudentID,StudentName) values ('S2','StudentB');
INSERT INTO Student(StudentID,StudentName) values ('S3','StudentC');
 
INSERT INTO COURSE(CourseID,CourseName,Price) values ('C1','AZ-900',99.99);
INSERT INTO COURSE(CourseID,CourseName,Price) values ('C2','DP-900',100.99);
INSERT INTO COURSE(CourseID,CourseName,Price) values ('C3','AZ-104',89.99);
 
INSERT INTO Orders(OrderID,CourseID,StudentID,Discountpercent) values ('O1','C2','S1',90);
INSERT INTO Orders(OrderID,CourseID,StudentID,Discountpercent) values ('O2','C1','S2',50);
INSERT INTO Orders(OrderID,CourseID,StudentID,Discountpercent) values ('O3','C3','S3',60);