USE MASTER;
DROP DATABASE IF EXISTS LECTURE4_FUNCTION;
CREATE DATABASE LECTURE4_FUNCTION;
USE LECTURE4_FUNCTION;
CREATE TABLE Student(
ID int PRIMARY KEY IDENTITY(1, 1),
FirstName NVARCHAR(10),
MiddleName NVARCHAR(10),
LastName NVARCHAR(10),
Math int,
Physic int,
Chemical int,
DateOfBirth date
);
INSERT INTO Student(FirstName, MiddleName, LastName, Math,
Physic, Chemical, DateOfBirth)
VALUES(N'Nguyễn', N'Văn', N'Huấn', 7, 8, 9, '10/15/2000'),
(N'Võ', N'Văn', N'Hiếu', 3, 4, 5, '10/15/2005'),
(N'Nguyễn', N'Thị', N'Huệ', 2, 5, 7,'10/15/2008'),
(N'Nguyễn', NULL, 'Trương', NULL, 5, 7,'10/15/1999');

SELECT LEN('Test Length') AS 'LEN FUNCTION';
SELECT REVERSE('123456') AS 'REVERSE FUNCTION';

SELECT REVERSE(LastName) AS 'REVERSE LastName',LEN(LastName) AS 'Length of LastName'
FROM Student



SELECT LOWER('HELLO') as 'L'

SELECT UPPER('to Upper') as 'U'

SELECT UPPER(LastName) AS 'UP', LOWER(FirstName) AS 'LW' FROM Student 

SELECT CONCAT('abc','def','ghiklmn');
SELECT  SUBSTRING('ABCDEFGH',2,3);

SELECT CONCAT(FirstName,' ',MiddleName, ' ',LastName) AS FullName FROM Student

--SELECT '|' + LTRIM(' HI ') + '|' AS 'LTRIM FUNCTION';
SELECT '|' + RTRIM(LTRIM(' HH ')) + '|' AS 'RTRIM FUNCTION';

SELECT MONTH(CONVERT(datetime,'12/2/2017',103)) AS AD

SELECT DAY(CONVERT(datetime,'12/2/2017',103)) AS AD

SELECT YEAR(CONVERT(datetime,'12/2/2017',103)) AS AD

SELECT YEAR(CONVERT(date,DateOFBirth,103)) AS 'Y' FROM Student

SELECT DATEPART(HOUR, '11/13/2022 19:20') AS 'DATEPART HOUR';
SELECT DATEPART(MINUTE, '11/13/2022 19:20') AS 'DATEPART MINUTE';
SELECT DATEPART(SECOND, CONVERT(datetime,'13/01/2017 19:20:35',103)) AS 'DATEPART YEAR';
SELECT DATEPART(MINUTE, CONVERT(datetime,'13/01/2017 19:20:35',103)) AS 'DATEPART YEAR';
SELECT DATEPART(YEAR, CONVERT(datetime,'13-01-2017 19:20:35',103)) AS 'DATEPART YEAR';
SELECT DATEPART(MONTH, CONVERT(datetime,'13-01-2017 19:20:35',103)) AS 'DATEPART YEAR';
SELECT DATEPART(DAY, CONVERT(datetime,'13-01-2017 19:20:35',103)) AS 'DATEPART YEAR';
SELECT DATEPART(DAY, CONVERT(datetime,'01.13.2017 19:20:35',120)) AS 'DATEPART YEAR';

SELECT DATEDIFF(MM, '10/15/2020', '11/25/2022') AS 'DATEDIFF FUNCTION';
SELECT DATEDIFF(YYYY, '10/15/2020', '11/25/2022') AS 'DATEDIFF FUNCTION';
SELECT DATEDIFF(HOUR, '10/15/2020', '11/25/2022') AS 'DATEDIFF FUNCTION';

SELECT DATEDIFF(HOUR, '10/2020', '11/2022') AS 'DATEDIFF FUNCTION';



SELECT * FROM Student

SELECT YEAR(GETDATE())- YEAR(CONVERT(date,DateOFBirth,103)) AS 'Tuoi' FROM Student
SELECT DATEDIFF(YYYY,DateOfBirth, GETDATE()) AS 'Tuoi' FROM Student

SELECT LastName, DateOfBirth, DATEDIFF(YYYY,DateOfBirth, GETDATE()) AS 'Age'
FROM Student

SELECT LastName, DateOfBirth, DATEDIFF(YYYY,DateOfBirth, GETDATE()) AS 'Age'
FROM Student
WHERE DATEDIFF(YYYY,DateOfBirth, GETDATE()) >= 20

SELECT LastName, DateOfBirth, YEAR(GETDATE())- YEAR(CONVERT(date,DateOFBirth,103)) AS 'Age'
FROM Student
WHERE (YEAR(GETDATE())- YEAR(CONVERT(date,DateOFBirth,103))) >=20


SELECT SUM(Math) FROM Student

SELECT AVG(Math) AS 'AVG of Physic'
FROM Student
SELECT * FROM Student

SELECT CEILING(1.0001) AS 'LÀM TRÒN LÊN'
SELECT CEILING(-1.5) AS 'LÀM TRÒN LÊN'
SELECT FLOOR(1.6) AS 'LÀM TRÒN XUỐNG'

SELECT PI() AS 'PI NUMBER'

SELECT ROUND(PI(), 4) AS 'ROUND PI NUMBER'
SELECT ROUND(PI(), 2) AS 'ROUND PI NUMBER'

SELECT ROUND(2.41155, 4) AS 'ROUND PI NUMBER'
SELECT ROUND(2.41154, 4) AS 'ROUND PI NUMBER'
SELECT ROUND(PI(), 2) AS 'ROUND PI NUMBER'

SELECT POWER(2, 8) AS 'POWER LÀ SỨC MẠNH'
SELECT SQRT(16) AS 'SQRT LÀ CĂN BẬC 2'

SELECT COUNT(ID) AS 'COUNT ID'
FROM Student
SELECT COUNT(MiddleName) AS 'COUNT
MiddleName'
FROM Student

SELECT COUNT(*) AS 'COUNT ID' ----giong count(10), count(whatever)
FROM Student
SELECT * FROM Student
SELECT COUNT(0.1) AS 'COUNT MiddleName'
FROM Student

SELECT COUNT(DISTINCT MiddleName) AS 'COUNT DISTINCT'
FROM Student
SELECT DISTINCT MiddleName AS 'COUNT DISTINCT'
FROM Student

SELECT * FROM Student

DECLARE @Test varchar(10);
SET @Test = 'NOT NULL';
SELECT ISNULL(@Test, 'HAHAHA') AS 'HI CHECK
NULL';

DECLARE @Test1 varchar(10);
SELECT ISNULL(@Test1, 'HAHAHA') AS 'HI CHECK
NULL';

SELECT ISNULL(MiddleName, 'DEFAULT') MiddleName, ACB.LastName NCB, ISNULL(Math, 0) Math
FROM Student ACB

SELECT IIF(1>0, 'CORRECT', 'IN-CORRECT') ABC;

SELECT IIF(1=0, 'CORRECT', 'IN-CORRECT') WithIIF;

SELECT  IIF(Math>5,N'TốTốTốTTốt','ddd') as 'Hoc Luc' from Student

SELECT * FROM Student


















