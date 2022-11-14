USE MASTER;
DROP DATABASE IF EXISTS LECTURE2_SHOPEE;
CREATE DATABASE LECTURE2_SHOPEE;
GO
USE LECTURE2_SHOPEE;
GO
--name, phone, email, dateOfBirth
CREATE TABLE Customer(
	ID int PRIMARY KEY IDENTITY(1, 1),
	FullName nvarchar(20) NOT NULL,
	Phone nvarchar(12),
	Email nvarchar(20),
	DateOfBirth date,
);
GO

CREATE TABLE CustomerMessage(
	ID int PRIMARY KEY IDENTITY(1, 1),
	FromCustomerID int REFERENCES Customer(ID),
	ToCustomerID int REFERENCES Customer(ID),
	ContentMessage nvarchar(100) NOT NULL,
	SentDate date,
	IsRead BIT
);
GO

CREATE TABLE CustomerAddress(
	ID int PRIMARY KEY IDENTITY(1, 1),
	CustomerID int REFERENCES Customer(ID),
	AliasName nvarchar(20),
	IsDefault BIT,
	City nvarchar(20),
	District nvarchar(20),
	Street nvarchar(20),
	Detail nvarchar(20),
);
GO

CREATE TABLE CustomerOrder(
	ID int PRIMARY KEY IDENTITY(1, 1),
	CustomerID int REFERENCES Customer(ID),
	DateDelivery date,
	OrderDate date,
	TotalAmount money,
	OrderStatus nvarchar(20),
	DeliveryAddress int REFERENCES CustomerAddress(ID),
);
GO

CREATE TABLE Category(
	ID int PRIMARY KEY IDENTITY(1, 1),
	CategoryName nvarchar(20),
);
GO

CREATE TABLE Product(
	ID int PRIMARY KEY IDENTITY(1, 1),
	Price money,
	StockQuatity bigint,
	Discount int,
	OrderStatus nvarchar(20),
);
GO
CREATE TABLE ProductCategory(
	ProductID int REFERENCES Product(ID),
	CategoryID int REFERENCES Category(ID),
	CONSTRAINT PK_ProductCategory PRIMARY KEY (ProductID, CategoryID)
);
GO

CREATE TABLE OrderDetail(
	OrderID int REFERENCES CustomerOrder(ID),
	ProductID int REFERENCES Product(ID),
	Quatity bigint,
	Discount int,
	PriceAfterDiscountPerUnit money,
);
GO