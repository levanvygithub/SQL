
use master;
select name from sys.databases;
use LECTURE6_PRATICE_JOIN;

SELECT * FROM Customer
SELECT * FROM OrderFood

SELECT c.ID_KhachHang, c.FullName  FROM Customer c LEFT JOIN OrderFood o ON c.ID_KhachHang = o.CustomerID WHERE o.CustomerID IS NULL
SELECT ID_KhachHang, FullName FROM Customer WHERE ID_KhachHang NOT IN (SELECT CustomerID FROM OrderFood);
SELECT ID_KhachHang, FullName FROM Customer c WHERE NOT EXISTS (SELECT o.CustomerID FROM OrderFood o WHERE o.CustomerID = c.ID_KhachHang )


SELECT c.ID_KhachHang, c.FullName FROM Customer c INNER JOIN OrderFood o ON c.ID_KhachHang = o.CustomerID GROUP BY c.ID_KhachHang,c.FullName HAVING COUNT(*)>=2
SELECT ID_KhachHang, FullName FROM Customer WHERE ID_KhachHang IN (SELECT CustomerID FROM OrderFood GROUP BY CustomerID HAVING COUNT(*)>=2)
SELECT ID_KhachHang, FullName FROM Customer c WHERE EXISTS (SELECT o.CustomerID FROM OrderFood o WHERE o.CustomerID = c.ID_KhachHang GROUP BY o.CustomerID HAVING COUNT(*)>=2)


SELECT ID_KhachHang,FullName FROM Customer WHERE ID_KhachHang IN(SELECT CustomerID FROM OrderFood WHERE MONTH(CONVERT(date,OrderDate,103))=3 AND CustomerID IN(SELECT CustomerID FROM OrderFood WHERE YEAR(CONVERT(date,OrderDate,102))=2022 GROUP BY CustomerID HAVING COUNT(*)>=2)) 

SELECT * FROM OrderFood
SELECT c.ID_KhachHang,c.FullName FROM Customer c INNER JOIN OrderFood o ON c.ID_KhachHang = o.CustomerID WHERE YEAR(CONVERT(date,OrderDate,102))=2022 GROUP BY c.ID_KhachHang,c.FullName HAVING COUNT(*)>=2

