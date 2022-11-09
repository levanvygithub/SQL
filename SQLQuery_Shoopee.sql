use master
DROP DATABASE IF EXISTS SHOPEE
CREATE DATABASE SHOPEE
Use SHOPEE
GO
CREATE TABLE Customer
(
  customerID int IDENTITY(1,1),
  phone varchar(20) NULL,
  name varchar(30) NOT NULL,
  dateOfBirth date NOT NULL,
  Email varchar(50) NULL,
  PRIMARY KEY (customerID)
);

GO
CREATE TABLE Address
(
  addressID int IDENTITY(1,1),
  city varchar(20) NOT NULL,
  district varchar(20) NOT NULL,
  street varchar(20) NOT NULL,
  customerID int,
  PRIMARY KEY (addressID),
  FOREIGN KEY (customerID) REFERENCES Customer(customerID)
);


GO
CREATE TABLE Orders
(
  orderId int IDENTITY(1,1),
  dateDelivery date NOT NULL,
  totalAmount int NOT NULL,
  orderStatus varchar(50) NULL,
  addressID int,
  customerID int,
  PRIMARY KEY (orderId),
  FOREIGN KEY (addressID) REFERENCES Address(addressID),
  FOREIGN KEY (customerID) REFERENCES Customer(customerID)
);

GO
CREATE TABLE Product
(
  producID int IDENTITY(1,1),
  inventoryQuantity int NOT NULL,
  price int NOT NULL,
  discount int NULL,
  type varchar(30) NULL,
  PRIMARY KEY (producID)
);

GO
CREATE TABLE Category
(
  categoryID int IDENTITY(1,1),
  name varchar(20) NOT NULL,
  PRIMARY KEY (categoryID)
);

GO
CREATE TABLE Category_Product
(
  producID int,
  categoryID int,
  PRIMARY KEY (producID, categoryID),
  FOREIGN KEY (producID) REFERENCES Product(producID),
  FOREIGN KEY (categoryID) REFERENCES Category(categoryID)
);

GO
CREATE TABLE Product_Order
(
  orderId int,
  producID int,
  PRIMARY KEY (orderId, producID),
  FOREIGN KEY (orderId) REFERENCES Orders(orderId),
  FOREIGN KEY (producID) REFERENCES Product(producID)
);

GO
CREATE TABLE Sent_Message
(
  customerID1 int,
  customerID2 int,
  PRIMARY KEY (customerID1, customerID2),
  FOREIGN KEY (customerID1) REFERENCES Customer(customerID),
  FOREIGN KEY (customerID2) REFERENCES Customer(customerID)
);

