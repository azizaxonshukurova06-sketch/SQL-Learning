--1
Data refers to raw facts and figures gathered through observation or research, which can be numbers, names, or descriptions. A database is a structured, electronic collection of this data designed for systematic storage, management, and retrieval. A relational database is a specific type of database that organizes data into related tables, linked by common fields (keys), enabling complex queries and high data integrity. A table is a component of a relational database, presenting data in rows (records) and columns (attributes), representing distinct entities and their properties. 
--2
Relational Database Management System (RDBMS): SQL Server functions as a core RDBMS, organizing data into tables with defined relationships, ensuring data integrity and consistency through adherence to the relational model.
High Availability and Disaster Recovery: SQL Server provides robust features for business continuity, including Always On Availability Groups, failover clustering, and database mirroring, to ensure maximum uptime and minimize data loss in case of failures.
Advanced Security: It offers comprehensive security features to protect data at rest and in motion. This includes transparent data encryption, row-level security, dynamic data masking, and robust auditing capabilities to comply with various regulatory requirements.
Performance and Scalability: SQL Server is engineered for high performance, supporting features like in-memory OLTP for faster transactional workloads, columnstore indexes for efficient data warehousing and analytics, and query optimization tools to enhance query execution speed. It is designed to scale to handle large volumes of data and user loads.
Integration and Analytics Capabilities: SQL Server integrates with various tools and services for data integration (SSIS), reporting (SSRS), analysis (SSAS), and machine learning services (Python and R scripts). It also supports data virtualization with PolyBase, allowing queries across diverse data sources like Hadoop and other databases without data movement.
--3
1. Windows Authentication Mode 
How it works: When connecting with this mode, SQL Server trusts the user's Windows identity. The user first logs into their Windows account, and SQL Server then authenticates the user based on that existing Windows credentials.
Advantages: It is more secure, as it's integrated with the Windows security model and leverages existing user accounts and groups. This also enables the use of Kerberos or NTLM authentication.
Best for: Environments where users are part of a Windows domain, as access can be managed at the domain level for simplified administration.
2. Mixed Mode (SQL Server and Windows Authentication) 
How it works: This mode allows for both Windows Authentication and SQL Server Authentication to be enabled. You can choose to log in with a Windows user account or with a specific SQL Server login and password.
SQL Server Authentication (within Mixed Mode): This involves creating and managing separate user accounts and passwords directly within SQL Server. The user provides a SQL Server-specific login name and password, which SQL Server then verifies.
Best for: Situations where you need to allow both domain users and non-domain users to access the database, or when migrating from or integrating with systems that use SQL Server-only logins.
--4
create database SchoolDB
use  SchoolDB
--5
create table Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);


--6
SQL Server, SSMS, and SQL are distinct but related components within the Microsoft data platform.
SQL (Structured Query Language): This is a standardized programming language used to manage and manipulate relational databases. It is the language used to communicate with databases to perform tasks such as creating tables, inserting data, querying information, and modifying records. SQL is not specific to Microsoft SQL Server; it is used by various relational database management systems (RDBMS) like MySQL, Oracle, and PostgreSQL.
SQL Server (Microsoft SQL Server): This refers to the relational database management system (RDBMS) developed by Microsoft. It is a software product that stores, retrieves, and manages data. SQL Server is the "engine" that houses your databases and processes the SQL commands sent to it. It provides features like data storage, indexing, security, transaction management, and various editions (e.g., Express, Standard, Enterprise) with different functionalities and scalability. 
SSMS (SQL Server Management Studio): This is a graphical user interface (GUI) tool provided by Microsoft for managing and developing components of SQL Server. SSMS allows users to interact with SQL Server instances in a visual manner, rather than solely through command-line interfaces. It includes features for database administration (e.g., creating and managing databases, users, and permissions), development (e.g., writing and executing SQL queries, creating stored procedures), and performance monitoring. SSMS is the primary tool used by database administrators and developers to work with SQL Server.
In summary, SQL is the language, SQL Server is the database system that understands and executes that language, and SSMS is the graphical tool used to manage and interact with SQL Server.

--7
Data Definition Language (DDL)
DDL commands are used to define, modify, and delete the structure of database objects like tables, indexes, and views. They deal with the database schema itself, not the data within it.
CREATE TABLE Employees (
        EmployeeID INT PRIMARY KEY,
        FirstName VARCHAR(50),
        LastName VARCHAR(50)
    );
    ALTER TABLE Employees ADD Email VARCHAR(100);
    DROP TABLE Employees;
    TRUNCATE TABLE Employees;
    SELECT FirstName, LastName FROM Employees WHERE EmployeeID = 1;
Data Query Language (DQL)
DQL commands are used to retrieve data from the database. 
SELECT FirstName, LastName FROM Employees WHERE EmployeeID = 101;
DML commands are used to insert, update, and delete data within the database tables. 
    INSERT INTO Employees (EmployeeID, FirstName, LastName) VALUES (101, 'John', 'Doe');
    UPDATE Employees SET Email = 'john.doe@example.com' WHERE EmployeeID = 1;
    DELETE FROM Employees WHERE EmployeeID = 1;
DCL commands are used to manage user permissions and access control to the database.
    GRANT SELECT, INSERT ON Employees TO user_name;
    REVOKE SELECT ON Employees FROM 'user1';
TCL commands manage transactions within a database, ensuring data consistency and integrity. 
    COMMIT;
    ROLLBACK;
    SAVEPOINT SavePoint1;
--8
INSERT INTO Students (StudentID, FirstName, LastName, Age)
VALUES
    (101, 'Alice', 'Smith', 18),
    (102, 'Bob', 'Johnson', 19),
    (103, 'Charlie', 'Brown', 17);
