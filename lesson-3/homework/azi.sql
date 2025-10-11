1. The BULK INSERT statement in SQL Server is a Transact-SQL command used to efficiently import large volumes of data from an external data file (such as a CSV or text file) directly into a SQL Server table or view. 
Purpose of BULK INSERT
The primary purpose of BULK INSERT is to provide a high-performance method for loading substantial amounts of data into a SQL Server database, particularly in scenarios where speed and efficiency are critical. This includes:
Data Migrations: Moving data from legacy systems or other data sources into SQL Server.
ETL Processes: Extracting, Transforming, and Loading data as part of data warehousing solutions.
Log File Ingestion: Importing large log files for analysis.
Data Synchronization: Regularly updating or populating tables with data from external sources.
How BULK INSERT Achieves Efficiency
BULK INSERT achieves its efficiency compared to individual INSERT statements by:
Minimizing Network Round Trips: Instead of sending each row individually, it sends data in large batches, significantly reducing network overhead.
Reduced Transaction Overhead: It can load data within a single transaction or in batches, minimizing the overhead associated with individual transaction management.
Optimized Logging: It can use minimal logging if certain conditions are met (e.g., target table is empty or has a HEAP structure), which reduces the size of the transaction log and speeds up the process.
Direct Data Streaming: It allows the database engine to stream data directly to disk pages, bypassing some of the per-row processing overhead of traditional INSERT statements.
Flexible Data Handling: It offers various options for specifying file format, field and row terminators, error handling, and more, allowing it to handle diverse external data file structures.
2. Four file formats that can be imported into SQL Server are:
Delimited Text Files (e.g., CSV): These are common for importing data where values are separated by a specific character, such as a comma or tab.
Parquet Files: A columnar storage format optimized for analytical queries, often used in big data ecosystems.
JSON Files: While directly importing JSON for all platforms is more recent (e.g., Azure SQL Edge), you can use techniques like OPENROWSET with BULK to import JSON documents or query JSON files using serverless SQL pools in Azure Synapse Analytics. 
Delta Lake Files: This open-source storage layer provides ACID transactions, scalable metadata handling, and unified streaming and batch data processing. It is supported in SQL Server 2022 and later versions, as well as Azure SQL Database and serverless SQL pools in Azure Synapse Analytics.
3. CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);
4. INSERT INTO Products (ProductID, ProductName, Price)
VALUES
(1, 'Laptop', 1200.00),
(2, 'Smartphone', 850.00),
(3, 'Headphones', 150.00);
5. NULL signifies the absence of a value, making a column optional, while NOT NULL is a constraint that mandates a column must always have a value, preventing it from being left blank or having a missing entry. For example, a user's "phone number" could be NULL if they don't provide it, but a mandatory field like a "user ID" would be NOT NULL. 
NULL 
Represents absence: A NULL value indicates that there is no value for that field in a record, which is different from zero or an empty string. 
Optionality: By default, a column can accept NULL values, making the data in that column optional for each record. 
Usage: You might use a NULL value when a piece of information is genuinely not available or is not required. 
NOT NULL 
Mandatory value: The NOT NULL constraint ensures that every record in a table must have a value in that specific column. 
Enforces data completeness: This constraint prevents you from inserting a new record or updating an existing one without providing a value for that column. 
Business rules: Columns like primary keys or fields that are essential to business logic are typically defined as NOT NULL. 
Key Difference 
The core difference is whether a column is allowed to be empty or missing data. 
NULL: allows a column to be optional.
NOT NULL: requires a value to always be present.
6. ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);
7. -- This query retrieves all products that have a price greater than 100
SELECT * 
FROM Products
WHERE Price > 100;
8. ALTER TABLE Products
ADD CategoryID INT;
9. CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);
10. EmpID INT IDENTITY(1,1)
11. BULK INSERT Products
FROM 'C:\Data\Products.txt'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
12. ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);
13. The main differences are that a PRIMARY KEY can only have one per table, cannot contain NULL values, and is often used to define a table's main identifier and relationships (like for a foreign key). A UNIQUE KEY can have multiple per table, can contain a single NULL value (in most systems), and is used to prevent duplicates in columns that are not the primary identifier. 
14. ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive CHECK (Price > 0);
15. ALTER TABLE Products
ADD Stock INT NOT NULL;
16. SELECT ProductID, ProductName, ISNULL(Price, 0) AS Price
FROM Products;
17. FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
18. CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Age INT CHECK (Age >= 18)
);
19. CREATE TABLE Orders (
    OrderID INT IDENTITY(100,10) PRIMARY KEY,
    OrderDate DATE
);
20. CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)
);
21. The COALESCE and ISNULL functions in SQL are used to handle NULL values by replacing them with a specified alternative. While they serve a similar purpose, they have distinct characteristics.
COALESCE:
COALESCE is an ANSI SQL standard function, making it widely portable across different database systems.
It takes multiple arguments and returns the first non-NULL expression in the list.
The data type of the returned value is determined by the data type precedence of all the arguments.
COALESCE only evaluates expressions until it finds a non-NULL value, potentially offering performance benefits in certain scenarios.
22. CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Email VARCHAR(100) UNIQUE
);
23. ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID)
ON DELETE CASCADE
ON UPDATE CASCADE;
