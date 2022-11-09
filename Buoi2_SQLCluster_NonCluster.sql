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

While(@counter <= 1000000)
Begin
	Declare @Name nvarchar(50) = 'ABC ' + RTRIM(@counter)
	Declare @Email nvarchar(50) = 'abc' + RTRIM(@counter) + '@LVTECH.com'
	Declare @Dept nvarchar(10) = 'Dept ' + RTRIM(@counter)

	Insert into Employees values (@Name, @Email, @Dept)

	Set @counter = @counter +1

	If(@Counter%100000 = 0)
		Print RTRIM(@Counter) + ' rows inserted'
End



SELECT COUNT('Id') from Employees

SELECT *from Employees where Id = 325702
SELECT *from Employees where Name = 'ABC 325702'

SELECT *from Employees where Department = 'Dept 32570'


CREATE NONCLUSTERED INDEX IX_Employees_Name
ON [dbo].[Employees] ([Name])

CREATE NONCLUSTERED INDEX IX_Employees_Department
ON [dbo].[Employees] ([Department])
