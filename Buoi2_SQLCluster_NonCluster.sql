USE master
DROP DATABASE IF EXISTS SQLINDEX_SCAN
CREATE DATABASE SQLINDEX_SCANMA
USE SQLINDEX_SCAN

Create Table Employees
(
	Id int primary key identity,
	[Name] nvarchar(50),
	Email nvarchar(50),
	Department nvarchar(50)
)
Go

SET NOCOUNT ON
Declare @counter int = 1

While(@counter <= 200000)
Begin
	Declare @Name nvarchar(50) = 'ABC ' + RTRIM(@counter)
	Declare @Email nvarchar(50) = 'abc' + RTRIM(@counter) + '@LVTECH.com'
	Declare @Dept nvarchar(10) = 'Dept ' + RTRIM(@counter)

	Insert into Employees values (@Name, @Email, @Dept)

	Set @counter = @counter +1

	If(@Counter%200000 = 0)
		Print RTRIM(@Counter) + ' rows inserted'
End

ALTER TABLE Employees ADD ABC VARCHAR(10) DEFAULT 0
-----ALTER TABLE Employees ADD CONSTRAINT df_ABC DEFAULT 0 FOR ABC;
EXEC sp_help Employees
ALTER TABLE Employees
DROP CONSTRAINT DF__Employees__ABC__267ABA7A;
ALTER TABLE Employees DROP COLUMN ABC


SELECT COUNT(*) from Employees

SELECT *from Employees where Id = 300000
SELECT *from Employees where Email = 'abc100000@LVTECH.com'
SELECT *from Employees where Name = 'ABC 199899'

SELECT *from Employees where Department = 'Dept 32570'


CREATE NONCLUSTERED INDEX IX_Employees_Name
ON [dbo].[Employees] ([Name])

CREATE NONCLUSTERED INDEX IX_Employees_Email
ON [dbo].[Employees] ([Email])

DROP INDEX Employees.IX_Employees_Email;
DROP INDEX Employees.IX_Employees_Name;

exec sp_spaceused Employees
exec sp_spaceused 