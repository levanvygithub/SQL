select @@version
Create database HelloDB
CREATE database HelloDb2
CREATE database HelloDb3
ALTER database HelloDB MODIFY NAME = HelloDbModify
ALTER database HelloDb2 MODIFY NAME = HelloDb2Modify
Drop database HelloDbModify, HelloDb2Modify, HelloDb3, testDB


use master 
use HelloDB

drop database if exists HelloDB
create database HelloDB

DECLARE @Test int;
SELECT @Test as '@Test ko gia tri';
set @Test = 1; 
select @Test as 'Test da gan gia tri'

DECLARE @Test datetimeoffset;
SET @Test = GETDATE();
SELECT @Test AS '@Test datetimeoffset';

DECLARE @Test time;
SET @Test = GETDATE();
SELECT @Test as '@Test time';

DECLARE @Test datetime;
SET @Test = GETDATE();
SELECT @Test as '@Test time';

DECLARE @Test smalldatetime;
SET @Test = GETDATE();
SELECT @Test as '@Test time';

--day la cai comment
use HelloDB
CREATE TABLE MyFirstTable(
    ID int,
    FullName nchar(50),
    Email VARCHAR(20),
    PhoneNumber VARCHAR(10),
    DateOfBirth date,
    Wallet money
);
ALTER TABLE MyFirstTable ADD Age int;
ALTER TABLE MyFirstTable ADD City varchar(20);
ALTER TABLE MyFirstTable DROP COLUMN Age; --xoa colum
ALTER TABLE MyFirstTable ALTER COLUMN City varchar(30); --thay doi kieu du lieu


CREATE TABLE MySecondTable(
    ID int,
    FullName nchar(50),
    Email VARCHAR(20),
    PhoneNumber VARCHAR(10),
    DateOfBirth date,
    Wallet money
);

DROP TABLE MySecondTable;

CREATE TABLE MyThirstTable(
    ID int PRIMARY KEY,
    FullName nchar(50) NOT NULL,
    Email VARCHAR(20) UNIQUE, --can null only one
    PhoneNumber VARCHAR(10),
    DateOfBirth date DEFAULT GETDATE(),
    Wallet money CHECK (Wallet >0)
);

ALTER TABLE MyThirstTable ALTER COLUMN ID int NOT NULL;
ALTER TABLE MyThirstTable ADD PRIMARY KEY (ID);
ALTER TABLE MyThirstTable ALTER COLUMN FullName nchar(50) NOT NULL;
ALTER TABLE MyThirstTable ADD UNIQUE (Email);
ALTER TABLE MyThirstTable ADD CONSTRAINT df_DateOfBirth DEFAULT GETDATE() FOR DateOfBirth;
ALTER TABLE MyThirstTable ADD CHECK (Wallet>= 0);

ALTER TABLE Orders
ADD FOREIGN KEY (PersonID) REFERENCES
Persons(PersonID);

CREATE TABLE Student(
    StudentID int PRIMARY KEY,
    Fullname VARCHAR(50) NOT NULL,
    DateOfBirth date
);
------------------1
CREATE TABLE StudenEmail(
    StudentID int PRIMARY KEY,
    Email VARCHAR(20) UNIQUE
);
ALTER TABLE StudenEmail
ADD FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
-------------------
DROP TABLE StudenEmail

------------------------1
CREATE TABLE StudenEmail(
    StudentID int FOREIGN KEY REFERENCES Student(StudentID),
    Email VARCHAR(20) UNIQUE,
    CONSTRAINT PK_StudenEmail PRIMARY KEY(StudentID, Email)
);
-----------------------------
CREATE TABLE StudentWithIdentity(
    StudentID int PRIMARY KEY IDENTITY(1,1),
    Fullname VARCHAR(50) NOT NULL,
    DateOfBirth date
);

SELECT name
FROM master.sys.databases

USE MASTER;
DROP DATABASE IF EXISTS HELLO_500AE;
CREATE DATABASE HELLO_500AE;
USE HELLO_500AE;
CREATE TABLE BreakTheLimit(
Data char(8000) NOT NULL,
MoreData char(54) NOT NULL
)



