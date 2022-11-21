use master;
use DeThiThu;

SELECT * FROM NHACUNGCAP; 
SELECT * FROM MUCPHI;
SELECT * FROM LOAIDICHVU;
SELECT * FROM DONGXE;
SELECT * FROM DANGKYCUNGCAP;

 --cau 3--Liệt kê những dòng xe có số chỗ ngồi trên 5 chỗ-
SELECT DongXe AS N'Dòng xe có trên 5 chỗ ngồi' 
	FROM DONGXE 
	WHERE SoChoNgoi >=5;

--Cau 4---Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp những dòng xe
		--thuộc hãng xe “Toyota” với mức phí có đơn giá là 15.000 VNĐ/km hoặc những dòng xe
		--thuộc hãng xe “KIA” với mức phí có đơn giá là 20.000 VNĐ/km
SELECT ncc.MaNhaCC, ncc.TenNhaCC, ncc.DiaChi, ncc.SoDT, ncc.MaSoThue, dx.HangXe, mp.DonGia 
	FROM NHACUNGCAP ncc 
	INNER JOIN DANGKYCUNGCAP dkcc ON ncc.MaNhaCC = dkcc.MaNhaCC
	INNER JOIN DONGXE dx ON dkcc.DongXe = dx.DongXe
	INNER JOIN MUCPHI mp ON dkcc.MaMP = mp.MaMP 
	WHERE (dx.HangXe ='Toyota' AND mp.DonGia = 15000) OR (dx.HangXe ='KIA' AND mp.DonGia = 10000) 
	ORDER BY ncc.MaNhaCC;

--cau 5---Liệt kê thông tin toàn bộ nhà cung cấp được sắp xếp tăng dần theo tên nhà cung
		--cấp và giảm dần theo mã số thuế---
SELECT * FROM NHACUNGCAP 
	ORDER BY TenNhaCC ASC, MaSoThue DESC

--Cau 6---Đếm số lần đăng ký cung cấp phương tiện tương ứng cho từng nhà cung cấp với
		--yêu cầu chỉ đếm cho những nhà cung cấp thực hiện đăng ký cung cấp có ngày bắt đầu
		--cung cấp là “20/11/2015”-
SELECT MaNhaCC AS N'Mã nhà cung cấp', COUNT(*) AS N'Số lần đăng ký cung cấp' 
	FROM DANGKYCUNGCAP 
	WHERE NgayBatDauCungCap = CONVERT(DATE,'20/11/2015',103)
	GROUP BY MANhaCC;

---Cau 7----
SELECT HangXe AS N'Tất cả hãng xe' 
	FROM DONGXE
	GROUP BY HangXe;

---Cau 8- tất cả các lần đăng ký cung cấp phương
		--tiện với yêu cầu những nhà cung cấp nào chưa từng thực hiện đăng ký cung cấp phương
		--tiện thì cũng liệt kê thông tin những nhà cung cấp đó ra--
SELECT ncc.MaNhaCC, ncc.TenNhaCC, ncc.DiaChi, ncc.MaSoThue, dkcc.MaDKCC, ldv.TenLoaiDV, dx.HangXe, mp.DonGia, dkcc.NgayBatDauCungCap, dkcc.NgayKetThucCungCap 
	FROM NHACUNGCAP ncc 
	LEFT JOIN DANGKYCUNGCAP dkcc ON ncc.MaNhaCC = dkcc.MaNhaCC 
	LEFT JOIN LOAIDICHVU ldv ON dkcc.MaLoaiDV = ldv.MaLoaiDV
	LEFT JOIN DONGXE dx ON dkcc.DongXe = dx.DongXe
	LEFT JOIN MUCPHI mp ON dkcc.MaMP = mp.MaMP
	ORDER BY ncc.MaNhaCC;

---Cau 9 Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp phương tiện
		--thuộc dòng xe “Hiace” hoặc từng đăng ký cung cấp phương tiện thuộc dòng xe “Cerato”----
SELECT ncc.MaNhaCC, ncc.TenNhaCC, ncc.DiaChi, dkcc.DongXe AS N'Dòng xe đã đăng ký' 
	FROM NHACUNGCAP ncc 
	INNER JOIN DANGKYCUNGCAP dkcc ON ncc.MaNhaCC = dkcc.MaNhaCC 
	AND dkcc.DongXe IN('Cerato','Hiace')
	ORDER BY ncc.MaNhaCC;

----Cau 10 Liệt kê thông tin của các nhà cung cấp chưa từng thực hiện đăng ký cung cấp phương tiện lần nào cả.----
SELECT ncc.MaNhaCC AS N'Nhà CC chưa ĐK lần nào', ncc.TenNhaCC, ncc.DiaChi, ncc.SoDT,ncc.MaSoThue 
	FROM NHACUNGCAP ncc 
	LEFT JOIN DANGKYCUNGCAP dkcc ON ncc.MaNhaCC = dkcc.MaNhaCC 
	WHERE dkcc.MaDKCC IS NULL;



