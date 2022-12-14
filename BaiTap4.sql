USE MASTER;
DROP DATABASE IF EXISTS LECTURE4_CLASSPRACTICE; CREATE DATABASE LECTURE4_CLASSPRACTICE;
USE LECTURE4_CLASSPRACTICE;
CREATE TABLE CustomerOrder(
ID int PRIMARY KEY IDENTITY(1, 1), CustomerID int,
FullName nvarchar(20) NOT NULL, DeliveryCity nvarchar(20), DateDelivery date,
OrderDate date, TotalAmount money, OrderStatus nvarchar(20)
);

INSERT INTO CustomerOrder(CustomerID, FullName, DeliveryCity, OrderDate, DateDelivery, TotalAmount, OrderStatus)
VALUES(1, N'Ngô Kiến Huy', 'TP. HCM', '3/15/2022', '3/15/2022', 50000, 'COMPLETED'),
(1, N'Ngô Kiến Huy', 'TP. HCM', '3/12/2022', '3/25/2022', 70000, 'ON-GOING'),
(1, N'Ngô Kiến Huy', 'TP. HCM', '3/16/2022', '3/27/2022', 80000, 'CANCLED'),
(2, N'Phan Mạnh Quỳnh', 'TP. HA NOI', '7/13/2022', '3/15/2023', 90000, 'CANCLED'),
(2, N'Phan Mạnh Quỳnh', 'TP. HA NOI', '8/12/2022', '3/25/2023', 40000, 'ON-GOING'),
(2, N'Phan Mạnh Quỳnh', 'TP. HA NOI', '9/18/2022', '3/27/2023', 30000, 'COMPLETED');
INSERT INTO CustomerOrder(CustomerID, FullName, DeliveryCity, OrderDate, DateDelivery, TotalAmount, OrderStatus)
VALUES(3, N'Ngô Kiến', 'TP. HCM', '3/15/2022', '3/15/2022', 70000, 'COMPLETED');
INSERT INTO CustomerOrder(CustomerID, FullName, DeliveryCity, OrderDate, DateDelivery, TotalAmount, OrderStatus)
VALUES(4, N'Ngô Kiến Long', 'TP. HCM', '3/15/2022', '3/15/2022', 70000, 'COMPLETED');
INSERT INTO CustomerOrder(CustomerID, FullName, DeliveryCity, OrderDate, DateDelivery, TotalAmount, OrderStatus)
VALUES(7, N'Ngô Kiến Long lanh', 'TP. HCM', '3/15/2022', '3/15/2023', 70000, 'CANCLED');

SELECT * FROM CustomerOrder;
-- PRACTICE SQL BUILT-IN FUNCTION
-- 1. IN RA THÔNG TIN ĐƠN HÀNG CÓ GIÁ TRỊ LỚN NHẤT MÀ ĐÃ HOÀN THÀNH TRONG NĂM 2022
-- 2. IN RA THÔNG TIN ĐƠN HÀNG CÓ GIÁ TRỊ LỚN NHẤT MÀ ĐÃ BỊ HỦY TRONG NĂM 2023
-- 3. TÍNH SỐ ĐƠN HÀNG ĐƯỢC ĐẶT VÀO TRONG KHOẢNG THÁNG 15/3/2022 CHO ĐẾN HẾT 15/8/2023 
-- 4. TÍNH TỔNG SỐ ĐƠN HÀNG ĐÃ HOÀN THÀNH TRONG NĂM 2022 VÀ 2023
-- 5. TÍNH GIÁ TRỊ TRUNG BÌNH ĐƠN HÀNG TRONG NĂM 2023

-----thông tin đơn hàng có giá trị lớn nhất hoàn thành năm 2022--------
SELECT * FROM CustomerOrder WHERE
 YEAR(CONVERT(date,DateDelivery,103)) =2022 
 AND OrderStatus = 'COMPLETED'
 AND TotalAmount= (SELECT MAX(TotalAmount) FROM CustomerOrder WHERE YEAR(CONVERT(date,DateDelivery,103)) =2022 AND OrderStatus = 'COMPLETED')

-------thông tin đơn hàng lớn nhất đã bị huỷ năm 2023----------------------
 SELECT * FROM CustomerOrder WHERE
 YEAR(CONVERT(date,DateDelivery,103)) =2023 
 AND OrderStatus = 'CANCLED'
 AND TotalAmount= (SELECT MAX(TotalAmount) FROM CustomerOrder WHERE YEAR(CONVERT(date,DateDelivery,103)) =2023 AND OrderStatus = 'CANCLED')

---------số đơn hàng được đặt trong 15/03/2022 đến 15/8/2023---------------
 SELECT COUNT(*) as 'Number of orders from 15/03/2022 to 15/08/2023' FROM CustomerOrder
 WHERE OrderDate BETWEEN CONVERT(date,'15/3/2022',103) AND CONVERT(date,'15/8/2023',103);

-------------số đơn đã hoàn thành trong năm 2022 và 2023----------------------
 SELECT COUNT(*) AS 'Number of completed orders in 2022 and 2023' FROM CustomerOrder WHERE OrderStatus = 'COMPLETED' AND (YEAR(CONVERT(date,DateDelivery,103)) =2023 OR YEAR(CONVERT(date,DateDelivery,103)) =2022)

---------------giá trị trung bfnh của đơn hàng năm 2023
 SELECT AVG(TotalAmount) AS 'AVG price of order Amount in 2023' FROM CustomerOrder WHERE YEAR(CONVERT(date,DateDelivery,103)) =2023;

 SELECT DATA_TYPE, COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS
 WHERE TABLE_NAME = 'CustomerOrder'

 EXEC sp_help CustomerOrder

 
 ---1-------Tổng số đơn theo từng khách-------------------
  SELECT CustomerID, FullName, count(CustomerID) as 'number of orders for each customer' FROM CustomerOrder
  GROUP BY CustomerID,FullName
  ORDER BY CustomerID 

--2--------Tổng số Đơn đặt vào tháng 3 2022--------------
  SELECT count(*) AS 'Order in 3/2022' from CustomerOrder
  WHERE MONTH(OrderDate)=3 AND YEAR(OrderDate)=2022
  
 --3----------Tổng số đơn hàng theo tháng--------------
  SELECT  MONTH(OrderDate) Month, YEAR(OrderDate) Year, COUNT(*) AS'Orders per month' FROM CustomerOrder
  GROUP BY MONTH(OrderDate), YEAR(OrderDate)

--4------------------Lớn Hơn 60.000---------------
  SELECT FullName, AVG(TotalAmount) AS 'Lớn hơn 60000' FROM CustomerOrder
  GROUP BY CustomerID, FullName
  HAVING AVG(TotalAmount)>60000

  --5-----số ngày trung bình để giao một đơn hàng cho khách--------
  SELECT CustomerID, AVG(DATEDIFF(DD,OrderDate, DateDelivery)) FROM CustomerOrder
  WHERE OrderStatus = 'COMPLETED'
  GROUP BY CustomerID 


--6--------Tổng đơn hàng theo thành phố
  SELECT COUNT(*) AS 'Tổng đơn hàng theo thành phố', DeliveryCity FROM CustomerOrder
  GROUP BY DeliveryCity

--7-------Tổng đơn hàng đã hoàn thành theo thành phố-------------
  SELECT COUNT(*) AS 'Completed Order Sum', DeliveryCity FROM CustomerOrder
  WHERE OrderStatus = 'COMPLETED'
  GROUP BY DeliveryCity

--8-------Tôgn đơn hàng bị huỷ theo thành phố---------------------
  SELECT COUNT(*) AS 'CANCLED Order Sum', DeliveryCity FROM CustomerOrder
  WHERE OrderStatus = 'CANCLED'
  GROUP BY DeliveryCity


--9------------Tỷ lệ huỷ đơn theo từng khách hàng------
SELECT CustomerID, (CONVERT(DECIMAL(4,2),count(IIF(OrderStatus = 'CANCLED', 1, NULL))) / CONVERT(DECIMAL(4,2),count(*)))*100 AS 'Ty le huy don theo tung khach hang %'
FROM CustomerOrder
GROUP BY CustomerID


