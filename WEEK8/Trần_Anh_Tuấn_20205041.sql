--a tao csdl

create database DBHousing
use DBHousing
create table khachhang
( MaKH int primary key,
  Hoten Nvarchar(25),
  SDT int,
  Coquan Nvarchar(25))

create table nhachothue(
  MaN int primary key,
  Diachi Nvarchar(25),
  Giathue int,
  Tenchunha Nvarchar(25))

create table hopdong(
    MaN int,
	MaKH int,
	ngaybatdau date,
	ngayketthuc date,
    foreign key (MaN) references nhachothue(MaN) on delete cascade on update cascade,
	foreign key (MaKH) references khachhang(MaKH) on delete cascade on update cascade)
insert into khachhang values
    (1,N'Nông Văn Dền',974283412,N'Anh Hùng Vũ Trang'),
    (2,N'Nông Văn Duyên',974192421,N'Anh Hùng Vũ Trang'),
    (3,N'Trần Anh Tuấn',983124912,N'Việt Nhật 05'),
    (4,N'Lê Văn Hoan',842323412,N'VNUA'),
    (5,N'Hoàng Thị Tú',892323234,N'Hợp tác xã'),
    (6,N'Nguyễn Thị Nguyệt',987654321,N'Anh Hùng Vũ Trang'),
    (7,N'Hoàng Xuân Hãn',999999999,N'Anh Hùng Vũ Trang'),
    (8,N'Chí Phèo',982129999,N'Làng Vũ Đại'),
    (9,N'Thị Nở',921328888,N'Làng Vũ Đại'),
    (10,N'Lão Hạc',678923456,N'Nam Cao'),
    (11,N'Cậu Vàng',843868686,N'Nam Cao'),
    (12,N'Hai Đứa Trẻ',123454321,N'Nguyên Hồng'),
    (13,N'Trà Long',678910111,N'Mắt Biếc'),
    (14,N'Hà Lan',888888888,N'Mắt Biếc'),
    (15,N'Ngạn',666666666,N'Mắt Biếc')
update khachhang set Hoten=N'Bùi Xuân Huấn',Coquan=N'Mafia internet' where MaKH=1
select * from khachhang
insert into nhachothue values
(1,N'Hai Bà Trưng',	7000000	,N'Hồ Việt Trung'),
(2,N'Hoàng Mai',	6000000	,N'Châu Khải Phong'),
(3,N'Thanh Xuân',	6500000	,N'Khắc Việt'),
(4,N'Hoàng Mai',	8500000	,N'Tiến Bịp'),
(5,N'Thanh Xuân',	5500000	,N'Huấn Hoa Hồng'),
(6,N'Cầu Giấy',	5000000	,N'Lương Sơn Bá'),
(7,N'Hai Bà Trưng',	7000000	,N'Chúc Anh Đài'),
(8,N'Cầu Giấy',	6500000	,N'Nông Văn Dền'),
(9,N'Hoàng Mai',	8000000	,N'Du Thiên'),
(10,N'Thanh Xuân',	7500000	,N'Triệu Quân Sự')
select * from nhachothue
insert into hopdong values (1,3,'2016-10-5','2022-10-20')
insert into hopdong values 
(2,	2	,'2016-9-2'	,'2022-9-2'),
(3,	7	,'2017-8-4'	,'2023-1-3'),
(4,	9	,'2019-10-11'	,'2022-8-24'),
(5,	11	,'2016-3-11'	,'2022-12-31'),
(6,	13	,'2015-8-25'	,'2023-2-14'),
(7,	12	,'2017-10-20'	,'2022-11-20'),
(8,	6	,'2018-3-8'	,'2022-10-19'),
(9,	1	,'2019-2-3'	,'2022-12-18'),
(10,	10	,'2018-9-28'	,'2023-4-6')
--b Truy van
--1 dua ra diachi,tenchunha nhung can nha co gia thue <10000000
select * from hopdong
select Diachi,Tenchunha from nhachothue
where Giathue < 10000000
--2 dua ra ma KH,hoten, coquan cua khac hang thue nha Nong Van Den
select k.maKH, k.hoten, k.coquan from khachhang k
join hopdong h
on k.maKH = h.maKH
join nhachothue n
on h.maN = n.maN
where n.Tenchunha = N'Nông Văn Dền'
--3 nha chua duoc ai thue
select n.MaN 
from nhachothue n
right join hopdong h
on h.MaN = n.MaN
where h.MaN = NULL
--4 nha co gia thue cao nhat
select max(nhachothue.Giathue) as GiaThueCaoNhat
from nhachothue
inner join hopdong
on hopdong.MaN = nhachothue.MaN
having count(hopdong.MaN) >= 1
--c index
create index Idx_KhachHang_CoQuan on KhachHang(CoQuan);
select * from KhachHang where Coquan = N'Mắt Biếc';

create index Idx_NhaChoThue_MaN on NhaChoThue(MaN);
select a.MaN, a.TenChuNha, b.SoNhaChoThue from NhaChoThue as a inner join (
select MaN, count(MaN) as SoNhaChoThue from HopDong group by MaN ) as b on a.MaN = b.MaN;
--d procedure
create procedure HopDongProcedure @Nguong int
 as
begin

select * from HopDong where MaN in (
 	select MaN from NhaChoThue where GiaThue > @Nguong)
end
exec HopDongproce 800000   
drop proc HopDongProcedure