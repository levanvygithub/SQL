USE MASTER;
DROP DATABASE IF EXISTS DML_WITH_DATA; 
CREATE DATABASE DML_WITH_DATA;
 USE DML_WITH_DATA

CREATE TABLE Student(
ID int PRIMARY KEY,
FullName varchar(10) NOT NULL,
Email nchar(10) UNIQUE,
PhoneNumber varchar(10),
DateOfBirth date default GETDATE(),
Math tinyint CHECK (Math >= 0 AND Math <= 10)
);

INSERT INTO Student(ID, FullName, Email, PhoneNumber, DateOfBirth, Math) VALUES(7, 'HUY', 'H@gmail', '0123456789', GETDATE(), NULL);
INSERT INTO Student(ID, FullName, Email, PhoneNumber, DateOfBirth, Math) VALUES(11, 'HUY', 'HO@gmail', '0123456789', GETDATE(), 10);
INSERT INTO Student(ID, FullName, Email, PhoneNumber, DateOfBirth, Math) VALUES(6, 'HUY', 'HUY@gmail', '0123456789', GETDATE(), 5);

SELECT * FROM Student

INSERT INTO Student(ID, FullName, Email, PhoneNumber, DateOfBirth, Math) VALUES(4, 'LAN', 'LAN@gmail', '0123456789', GETDATE(), 7),
(3, 'HAO', 'HAO@gmail', '0123456789', GETDATE(), 8);

INSERT INTO Student(ID, FullName, Email, PhoneNumber, DateOfBirth, Math) VALUES(2, 'LAN', 'LAN@gmail', '0123456789', GETDATE(), 7)


SELECT * FROM Student
SELECT @@ROWCOUNT AS 'ROWCOUNT'

CREATE TABLE Parent(
StudentID int REFERENCES Student(ID),
FullName varchar(10) NOT NULL,
CONSTRAINT PK_StudentParent PRIMARY KEY (StudentID, FullName)
);


INSERT INTO Parent(StudentID, FullName) VALUES(5, 'PaPa'),
(5, 'Mama')

SELECT * FROM Parent
SELECT * FROM Student
SELECT @@ROWCOUNT AS 'ROWCOUNT'

INSERT INTO Parent(StudentID, FullName) ---Loi vi ko co ID trong Student
VALUES(1, 'Haha')

UPDATE Student
SET FullName = 'HAHA'

SELECT * FROM Parent
SELECT * FROM Student

UPDATE Student
SET FullName = 'BABYBOY BOY' WHERE ID = 5

DELETE FROM Student WHERE ID = 3

USE MASTER;
DROP DATABASE IF EXISTS DML_WITH_SELECT; CREATE DATABASE DML_WITH_SELECT;

CREATE TABLE Student(
ID int PRIMARY KEY,
FullName nvarchar(20) NOT NULL,
Math tinyint CHECK (Math >= 0 AND Math <= 10)
);
INSERT INTO Student(ID, FullName, Math) VALUES(1007, 'Nga Nguyễn', 5),
(1006, N'Nga Nguyễn', 6), (1005, N'Trung hồ', 7), (1001, N'Hào Phạm', 5), (1002, N'Lan Anh', 2), (1003, N'Phương Trần', 9), (1004, N'Mỹ lệ', 10), (1010, N'Lan Anh', 10), (1011, N'HÍ HÍ', NULL)

UPDATE Student
SET FullName = N'Nga Nguyễn' WHERE ID =1007

SELECT * FROM Student

SELECT ID, FullName
FROM Student

SELECT ID AS 'DAY LA ID', FullName AS 'CỘT NÈ' FROM Student

SELECT TOP 3 * FROM Student --co the ra bat ky 

SELECT TOP 3 ID, FullName FROM Student --co the ra bat ky 

SELECT TOP 3 * FROM Student ORDER BY FullName --de ra dung 
SELECT *
FROM Student
ORDER BY FullName DESC

SELECT N.FullName + ' ' + N.FullName AS 'CỘT NÈ' FROM Student AS N --(AS N or N only)

SELECT TOP 50 PERCENT ID, FullName FROM Student
ORDER BY FullName DESC

SELECT FullName
FROM Student

SELECT DISTINCT FullName
FROM Student

SELECT FullName, Math FROM Student
WHERE Math > 5

SELECT ID, FullName INTO newTable
FROM Student

SELECT * FROM newTable;

CREATE VIEW HELLO_VIEW AS SELECT FullName, Math FROM Student
WHERE Math > 5;

SELECT *
FROM HELLO_VIEW where Math > 7

SELECT 30 + 20 AS 'CỘNG NÈ';
SELECT 30 - 20 AS 'TRỪ NÈ';
SELECT 30 * 20 AS 'NHÂN NÈ';
SELECT 30.0 / 20 AS 'CHIA NÈ';
SELECT 30 % 20 AS 'CHIA LẤY DƯ NÈ';

SELECT TOP 1 WITH TIES *
FROM Student
ORDER BY Math DESC

SELECT TOP 1 *
FROM Student
ORDER BY Math DESC


SELECT FullName, Math FROM Student
WHERE Math > 5

SELECT ID, FullName, Math FROM Student
WHERE FullName != 'Lan Anh' --<>

SELECT ID, FullName
FROM Student
WHERE FullName = 'Lan Anh' AND ID = 1010

SELECT ID, FullName
FROM Student
WHERE FullName = 'Lan Anh' OR ID = 1005

SELECT ID, FullName
FROM Student
WHERE ID BETWEEN 1003 AND 1005

SELECT ID, FullName
FROM Student
WHERE FullName LIKE '%U%';

SELECT ID, FullName, Math FROM Student
WHERE NOT Math > 5

SELECT ID, FullName, Math FROM Student
WHERE Math IS NULL

SELECT ID, FullName, Math FROM Student
WHERE Math IS NOT NULL

SELECT name,type_desc FROM sys.sql_logins ---------get User anme

select * from HELLO_VIEW














