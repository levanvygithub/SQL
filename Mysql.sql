use sys;
DROP DATABASE IF EXISTS LECTURE2_SHOPEE;
CREATE DATABASE LECTURE2_SHOPEE;
use LECTURE2_SHOPEE;
CREATE TABLE Student(
ID int PRIMARY KEY,
FullName varchar(10) NOT NULL,
Email nchar(10) UNIQUE,
PhoneNumber varchar(10),
DateOfBirth DATE default (CURRENT_DATE),
Math tinyint CHECK (Math >= 0 AND Math <= 10)
 );
 
 SELECT *FROM Student where ID = 3;
 INSERT INTO Student(ID, FullName, Email, PhoneNumber, DateOfBirth, Math) VALUES(5, 'HUY', 'HUY@gmail', '0123456789', CURRENT_TIMESTAMP, 5);
 INSERT INTO Student(ID, FullName, Email, PhoneNumber, DateOfBirth, Math) VALUES(4, 'LAN', 'LAN@gmail', '0123456789', CURRENT_DATE, 7),
(3, 'HAO', 'HAO@gmail', '0123456789', CURRENT_DATE, 8);