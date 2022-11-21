USE MASTER
GO
DROP DATABASE IF EXISTS LECTURE5_PRATICE_JOIN
GO
CREATE DATABASE LECTURE5_PRATICE_JOIN
GO

USE LECTURE5_PRATICE_JOIN
GO

CREATE TABLE Customer
(
	ID_KhachHang		int		IDENTITY(1,1)	NOT NULL,
	FirstName			nvarchar(10)	NOT NULL,
	LastName			nvarchar(10)	NOT NULL,
	Gender				nvarchar(10)	NOT NULL,
	FullName			AS	(FirstName + ' ' +LastName),
	DateOfBirth			date,
	Address				nvarchar(100)	NOT NULL,
	CONSTRAINT	pk_ID_KhachHang	PRIMARY KEY (ID_KhachHang)
);
GO

CREATE TABLE OrderFood
(
	ID_DonHang			int		IDENTITY(1,1)	NOT NULL,
	CustomerID			int		NOT NULL,
	Total				money	NOT NULL,
	DeliveryAddress		nvarchar(100)	NOT NULL,
	OrderDate			date,
	CONSTRAINT	ck_Total		CHECK (Total > 0),
	CONSTRAINT	pk_ID_DonHang	PRIMARY KEY (ID_DonHang),
);
GO

INSERT INTO Customer
(FirstName, LastName, Gender, DateOfBirth,	Address)
VALUES
(N'NGUYỄN', N'HUỆ'	, N'NAM', '1/10/1992', N'THỦ ĐỨC - TP.HCM'),
(N'PHÙNG', N'ĐẠO'	, N'NAM', '2/13/1993', N'THỦ ĐỨC - TP.HCM'),
(N'TRỊNH', N'HOÀN'	, N'NAM', '2/15/1994', N'THỦ ĐỨC - TP.HCM'),
(N'TRƯƠNG', N'THÍ'	, N'NAM', '2/17/1995', N'THỦ ĐỨC - TP.HCM'),
(N'HOÀNG', N'HUÂN'	, N'NAM', '4/13/1995', N'QUẬN 9 - TP.HCM'),
(N'LÊ'	 , N'HẬU'	, N'NAM', '5/19/1994', N'QUẬN 10 - TP.HCM'),
(N'VÕ'	 , N'TÀI'	, N'NỮ', '10/22/1997', N'QUẬN 11 - TP.HCM'),
(N'VŨ'	 , N'NAM'	, N'NỮ', '11/21/1990', N'QUẬN 12 - TP.HCM'),
(N'NGION', N'HÒA'	, N'NỮ', '9/21/1991', N'QUẬN 11 - TP.HCM'),
(N'VUAIS', N'ĐÀO'	, N'NỮ', '8/21/1993', N'BA ĐÌNH - TP.HN'),
(N'TINKS', N'HOÀNG'	, N'NỮ', '12/21/1994', N'BA ĐÌNH - TP.HN'),
(N'TRUNG', N'THI'	, N'NỮ', '3/21/1995', N'BA ĐÌNH - TP.HN'),
(N'HUIAN', N'HÀO'	, N'NỮ', '7/21/1995', N'BA VÌ - TP.HN'),
(N'LIANG', N'HIẾU'	, N'NỮ', '6/12/1994', N'BA VÌ - TP.HN'),
(N'VIỄN' , N'TOÀN'	, N'NỮ', '10/16/1997', N'BA VÌ - TP.HN'),
(N'LONG' , N'PHONG'	, N'NỮ', '11/19/1990', N'BA VÌ - TP.HN')
GO

INSERT INTO OrderFood
(CustomerID, Total, DeliveryAddress, OrderDate)
VALUESABCD
(13		   , 99000, N'THỦ ĐỨC - TP.HCM', '3/10/2022'),
(13		   , 88000, N'THỦ ĐỨC - TP.HCM', '3/11/2022'),
(13		   , 79000, N'THỦ ĐỨC - TP.HCM', '3/12/2022'),
(13		   , 88000, N'THỦ ĐỨC - TP.HCM', '6/13/2022'),
(2		   , 98000, N'QUẬN 9 - TP.HCM', '4/10/2022'),
(2		   , 89000, N'QUẬN 9 - TP.HCM', '4/11/2022'),
(2		   , 77000, N'QUẬN 9 - TP.HCM', '5/12/2022'),
(3		   , 87000, N'QUẬN 9 - TP.HCM', '5/13/2022'),
(3		   , 96000, N'QUẬN 9 - TP.HCM', '4/10/2022'),
(4		   , 88000, N'QUẬN 9 - TP.HCM', '4/11/2022'),
(4		   , 79500, N'QUẬN 9 - TP.HCM', '5/12/2022'),
(4		   , 81200, N'QUẬN 9 - TP.HCM', '5/13/2022'),
(6		   , 94500, N'THỦ ĐỨC - TP.HCM', '3/10/2022'),
(5		   , 86700, N'THỦ ĐỨC - TP.HCM', '3/11/2022'),
(7		   , 72300, N'THỦ ĐỨC - TP.HCM', '3/12/2022'),
(7		   , 82300, N'THỦ ĐỨC - TP.HCM', '6/13/2022'),
(8		   , 93400, N'QUẬN 9 - TP.HCM', '1/10/2022'),
(8		   , 87300, N'QUẬN 9 - TP.HCM', '7/11/2022'),
(9		   , 71900, N'QUẬN 9 - TP.HCM', '8/12/2022'),
(10		   , 83900, N'QUẬN 9 - TP.HCM', '9/13/2022'),
(11		   , 93800, N'QUẬN 9 - TP.HCM', '10/10/2022'),
(11		   , 81500, N'QUẬN 9 - TP.HCM', '11/11/2022'),
(12		   , 72700, N'QUẬN 9 - TP.HCM', '12/12/2022'),
(12		   , 82800, N'QUẬN 9 - TP.HCM', '1/13/2022')
GO


----Câu 1---- Tỷ Lệ Giới tính-----
SELECT N'Giới Tính', N'Tỷ Lệ'
UNION ALL
SELECT N'NỮ',CAST(CONVERT(DECIMAL(5,2),(CONVERT(DECIMAL(5,2),COUNT(IIF(Gender = N'NỮ', 1, NULL)))/CONVERT(DECIMAL(5,2),COUNT(*)))*100) AS nvarchar(5)) +'%' FROM Customer
UNION ALL
SELECT N'NAM', CAST(CONVERT(DECIMAL(5,2),(CONVERT(DECIMAL(5,2),COUNT(IIF(Gender = N'NAM', 1, NULL)))/CONVERT(DECIMAL(5,2),COUNT(*)))*100) AS nvarchar(5))+'%' FROM Customer;
GO


---Select FullName from Customer where Address LIKE '%TP.HCM';
---Select FullName from Customer where Address LIKE '%TP.HN';
---SELECT COUNT(IIF(PARSENAME(Address,1)='HCM',1,null)) from Customer;
---SELECT COUNT(IIF(PARSENAME(Address,1)='HN',1,null)) from Customer;


----Câu 2: Số Lượng Khách Hàng của mỗi thành phố----------
SELECT N'THÀNH PHỐ', N'TỔNG SỐ KHÁCH HÀNG'
UNION ALL
SELECT N'TP.HCM', CAST(COUNT(IIF(Address LIKE '%TP.HCM',1,NULL)) AS NVARCHAR(15)) FROM Customer
UNION ALL
SELECT N'TP.HN', CAST(COUNT(IIF(Address LIKE '%TP.HN',1,NULL)) AS NVARCHAR(15)) FROM Customer;
GO


----Câu 3: Số lượng khách hàng sinh vào các tháng trong năm-----
SELECT MONTH(CONVERT(DATE,DateofBirth,103)) AS N'THÁNG', COUNT(*) 'TỔNG KHÁCH SINH TRONG THÁNG' from Customer GROUP BY MONTH(CONVERT(DATE,DateofBirth,103)) ORDER BY N'THÁNG';
GO


----Câu 4: Số lượng đơn hàng phát sinh trong các tháng---------
SELECT MONTH(CONVERT(DATE,OrderDate,103)) AS N'THÁNG', COUNT(*) N'TỔNG SỐ ĐƠN HÀN TRONG THÁNG' from OrderFood GROUP BY MONTH(CONVERT(DATE,OrderDate,103)) ORDER BY N'THÁNG';
GO


----Câu 5: Thông tin khách hàng có đơn hàng giá trị nhất-----
SELECT c.ID_KhachHang AS N'MÃ KH', c.FullName AS N'TÊN KHÁCH HÀNG', IIF(MAX(o.Total) IS NOT NULL, MAX(o.Total),0) AS N'ĐƠN HÀNG GIÁT TRỊ NHẤT' FROM Customer c 
LEFT JOIN OrderFood o ON c.ID_KhachHang = o.CustomerID 
GROUP by c.ID_KhachHang, c.FullName 
ORDER BY N'ĐƠN HÀNG GIÁT TRỊ NHẤT' DESC ;
GO


---Câu 6: Thông tin khách hàng và tổng giá trị đươn hàng của từng khách hàng----------------
SELECT c.ID_KhachHang AS N'MÃ KH', c.FullName AS N'TÊN KHÁCH HÀNG', IIF(SUM(o.Total) IS NOT NULL, SUM(o.Total),0) AS N'Tổng giá trị đơn hàng' FROM Customer c 
LEFT JOIN OrderFood o ON c.ID_KhachHang = o.CustomerID 
GROUP by c.ID_KhachHang, c.FullName 
ORDER BY N'Tổng giá trị đơn hàng' DESC ;
GO


-----Câu 7: Thông tin khách hàng chưa đặt đơn hàng nào-------------
SELECT c.ID_KhachHang AS N'MÃ KHÁCH HÀNG', c.FullName AS N'TÊN KHÁCH CHƯA ĐẶT ĐƠN NÀO' FROM Customer c 
LEFT JOIN OrderFood o ON c.ID_KhachHang = o.CustomerID 
WHERE o.ID_DonHang IS NULL;
GO

---Câu 8: báo cáo danh sách khách hàng:  mã khách hàng, (FullName) và số lượng đơn hàng đặt theo tháng KHÔNG bao gồm khách hàng chưa đặt đơn nào-----------
SELECT c.ID_KhachHang AS N'MÃ KH',c.FullName AS N'TÊN KHÁCH HÀNG', MONTH(CONVERT(DATE,OrderDate,103)) as N'THÁNG', COUNT(*) as N'SỐ LƯỢNG ĐƠN HÀNG' FROM Customer c 
JOIN OrderFood o ON c.ID_KhachHang = o.CustomerID 
GROUP BY  c.ID_KhachHang,c.FullName, MONTH(CONVERT(DATE,OrderDate,103))
ORDER BY N'TÊN KHÁCH HÀNG';
GO


---Câu 9: lấy ra danh sách khách hàng đặt ít nhất 2 đơn hàng trong cùng 1 năm -----------
SELECT c.ID_KhachHang AS N'MÃ KH',c.FullName AS 'TÊN KHÁCH HÀNG' FROM Customer c 
JOIN OrderFood o ON c.ID_KhachHang = o.CustomerID 
GROUP BY  c.ID_KhachHang,c.FullName, YEAR(CONVERT(DATE,OrderDate,103))
HAVING COUNT(*)>=2;
GO




