
--Mid-Term: Thuc tap CSDL 

--Class ID: 130989

--Student ID: 20205041 

--Student Name: Trần Anh Tuấn

--Source File: Trần_Anh_Tuấn_20205041_Midterm.sql

--1 Tao CSDL QLKH:
create database qlkh;
use qlkh
create table giangvien (
    GV# varchar(10) primary key,
    HoTen Nvarchar(30),
	NamSinh int,
	DiaChi Nvarchar(50)
   
 )
insert into giangvien values
('GV001'	,N'Trần Hồng Việt'	,1979	,N'Hà Nội'),
('GV002'	,N'Lê Duy Quý'	,1982	,N'Thái Bình'),
('GV003'	,N'Nguyễn Thị Thanh Nga'	,1988	,N'Hà Nội'),
('GV004'	,N'Nguyễn Văn Thủy'	,1980	,N'Hà Nam'),
('GV005'	,N'Trần Lâm Quân'	,1982	,N'Huế'),
('GV006'	,N'Nguyễn Duy Tiến'	,1988	,N'Hà Tĩnh'),
('GV007'	,N'Phạm Việt Cường'	,1983	,N'Nam Định'),
('GV008'	,N'Nguyễn Giang Nam'	,1979	,N'Bắc Giang'),
('GV009'	,N'Trần Văn Minh'	,1974	,N'Hà Tĩnh'),
('GV012'	,N'Võ Thị Hằng'	,1977	,N'Hưng Yên')
 select * from giangvien
create table detai (
     DT# varchar(10) primary key,
     TenDT Nvarchar(50), 
     TheLoai Nvarchar(20)
 )
insert into detai values 
('DT001'	,N'Đề tài 1'	,N'Ứng dụng'),
('DT002'	,N'Đề tài 2'	,N'Phát minh'),
('DT003'	,N'Đề tài 3'	,N'Ứng dụng'),
('DT004'	,N'Đề tài 4'	,N'Phát minh'),
('DT005'	,N'Đề tài 5'	,N'Ứng dụng'),
('DT006'	,N'Đề tài 6'	,N'Phát minh'),
('DT007'	,N'Đề tài 7'	,N'Ứng dụng'),
('DT008'	,N'Đề tài 8'	,N'Ứng dụng'),
('DT009'	,N'Đề tài 9'	,N'Phát minh'),
('DT010'	,N'Đề tài 0'	,N'Phát minh')

 select * from detai
create table sinhvien(
    SV# varchar(10) primary key,
	TenSV Nvarchar(30),
	NgaySinh date,
	QueQuan Nvarchar(20),
	Lop Nvarchar(20)
)
insert into sinhvien values
('SV001'	,N'Trần Anh Tuấn'	,'08/01/2002'	,N'Hà Tĩnh'	,N'Việt Nhật 05'),
('SV002'	,N'Lê Minh Vũ'	,'08/02/2002'	,N'Nam Định'	,N'Việt Nhật 01'),
('SV003'	,N'Nguyễn Xuân Dũng'	,'08/03/2002'	,N'Hà Nam'	,N'Việt Nhật 02'),
('SV004'	,N'Hồ Việt Trung'	,'08/04/2002'	,N'Hà Nội'	,N'Việt Nhật 02'),
('SV005'	,N'Lê Duy Quý'	,'08/05/2002'	,N'Hà Nam'	,N'Việt Nhật 03'),
('SV006'	,N'Hoàng Mai Thùy Linh'	,'08/06/2002'	,N'Hải Phòng'	,N'Việt Nhật 02'),
('SV007'	,N'Lê Đình Thiện'	,'08/07/2002'	,N'Hải Phòng'	,N'Việt Nhật 05'),
('SV008'	,N'Nguyễn Văn Nam'	,'08/08/2002'	,N'Bắc Giang'	,N'Việt Nhật 03'),
('SV009'	,N'Nguyễn Quỳnh Nga'	,'08/09/2002'	,N'Bắc Cạn'	,N'Việt Nhật 04'),
('SV010'	,N'Nguyễn Tiến Dũng'	,'08/10/2002'	,N'Bắc Cạn'	,N'Việt Nhật 01'),
('SV011'	,N'Hoàng Thị Tú'	,'08/11/2002'	,N'Điện Biên'	,N'Việt Nhật 03'),
('SV012'	,N'Hoàng Minh Ngọc'	,'08/12/2002'	,N'Hà Nội'	,N'Việt Nhật 04'),
('SV013'	,N'Lê Văn Tuyên'	,'08/13/2002'	,N'Quảng Ninh'	,N'Việt Nhật 05'),
('SV014'	,N'Bùi Xuân Huấn'	,'08/14/2002'	,N'Ninh Bình'	,N'Việt Nhật 04'),
('SV015'	,N'Hà Huy Tập'	,'08/15/2002'	,N'Hà Nội'	,N'Việt Nhật 01')
 select * from sinhvien
create table huongdan(
    GV# varchar(10),
	DT# varchar(10),
	SV# varchar(10),
	NamThucHien int,
	KetQua real,
	foreign key (GV#) references giangvien(GV#) on delete cascade on update cascade,
	foreign key (DT#) references detai(DT#) on delete cascade on update cascade,
	foreign key (SV#) references sinhvien(SV#) on delete cascade on update cascade
	)
insert into huongdan values
('GV001'	,'DT001'	,'SV001'	,2021,	10),
('GV001'	,'DT003'	,'SV002'	,2020,	9),
('GV001'	,'DT009'	,'SV003'	,2021,	8),
('GV002'	,'DT001'	,'SV004'	,2020,	5),
('GV002'	,'DT004'	,'SV005'	,2021,	6),
('GV003'	,'DT003'	,'SV006'	,2020,	8),
('GV003'	,'DT006'	,'SV007'	,2021,	7),
('GV003'	,'DT007'	,'SV008'	,2020,	7),
('GV004'	,'DT003'	,'SV009'	,2021,	9),
('GV012'	,'DT007'	,'SV010'	,2021,	10),
('GV012'	,'DT009'	,'SV011'	,2020,	6),
('GV005'	,'DT008'	,'SV012'	,2020,	7),
('GV005'	,'DT006'	,'SV013'	,2021,	8),
('GV008'	,'DT003'	,'SV014'	,2020,	5),
('GV008'	,'DT008'	,'SV015'	,2020,	10)

select * from huongdan
--2 Biểu diễn truy vấn:
--dua ra thong tin ve giang vien co ma la GV001

select * from giangvien where GV#='GV001'

--Cho biet bao nhieu de tai thuoc the loai Ứng dụng

select count(DT#) as sodetaiungdung from detai where TheLoai=N'Ứng dụng'

-- cho biet sinh vien co ma GV012 huong dan bao nhieu sinh vien co que quan o Hai Phong

select count(SV#) as sosinhvien from huongdan where GV#='GV012' AND SV# in( select SV# from sinhvien where QueQuan=N'Hải Phòng')

-- cho biet ten de tai chua co sinh vien nao thuc hien

select TenDT as detaikhongduocthuchien from detai where DT# not in( select distinct DT# from huongdan)

-- cap nhat ngay sinh cho sinh vien ten la Nguyễn Văn Dũng quê quán Hà Nam thành 12/11/1991

update sinhvien set NgaySinh='12/11/1991' where TenSV=N'Nguyễn Xuân Dũng' and QueQuan=N'Hà Nam' 

-- Nguyễn Văn Nam quê ở Bắc Giang đã xin thôi học xóa toàn bộ thông tin liên quan đến sinh viên này

delete from sinhvien where TenSV=N'Nguyễn Văn Nam'and QueQuan=N'Bắc Giang' -- comment vì có khóa ngoại nên xóa ở bảng sinh viên nó sẽ tự mất ở bảng còn lại

-- Tạo view đưa ra các thông tin về đề tài hướng dẫn sinh viên của các giảng viên

create view v_huongdan(GV#, DT#, SV#, NamThucHien, KetQua, TenGV, TenDT, TenSV) 
    as
		select e.*, f.TenSV from
		(select c.*, d.TenDT from (select a.*, b.HoTen as TenGV from HuongDan as a inner join GiangVien as b on a.GV# = b.GV#) as c
		inner join DeTai as d on c.DT# = d.DT#) as e inner join SinhVien as f on e.SV# = f.SV#
drop view v_huongdan
-- su dung view dua ra cac thong tin nam 2022

select * from v_huongdan where NamThucHien=2021

-- tạo index 

create clustered index idx_masv on huongdan(SV#)
select * from huongdan where SV#='SV001'
create nonclustered index idx_madt on huongdan(DT#)
select * from huongdan where DT#='DT003'

--3 Backup database
 
backup database qlkh to disk = 'H:\backupsql\Tran_Anh_Tuan_20205041_QLKH.bak' 
--restore
  
Restore database qlkh from disk = 'H:\backupsql\Tran_Anh_Tuan_20205041_QLKH.bak' with replace
--4 phan quyen
--a
USE [master]
CREATE LOGIN [ThuyNV] WITH PASSWORD=N'thuy123' MUST_CHANGE, DEFAULT_DATABASE=[qlkh], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
CREATE LOGIN [QuanTL] WITH PASSWORD=N'quan123' MUST_CHANGE, DEFAULT_DATABASE=[qlkh], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
--Nguyen Van Thuy co quyen SELECT trên bảng GiangVien va Huongdan
use qlkh
grant select on giangvien to ThuyNV
grant select on Huongdan to ThuyNV
-- cap quyen tao bang, khung nhin cho Trần Lâm Quân
CREATE ROLE testing
grant create table, create view to testing
grant testing to QuanTL
--b
