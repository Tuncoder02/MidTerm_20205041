 create database qlkh;
 use qlkh;


 create table giangvien (
     GV# varchar(10) primary key,
     HoTen nvarchar(50),
    DiaChi nvarchar(50),
    NgaySinh date
 )

 create table detai (
 DT# varchar(10) primary key,
    TenDT nvarchar(250), 
    Cap nvarchar(20),
   KinhPhi int )

 create table thamgia (
    GV# varchar(10),
    DT# varchar(10),
     SoGio int,    
	 foreign key (GV#) references giangvien(GV#) on delete cascade on update cascade,
     foreign key (DT#) references detai(DT#) on delete cascade on update cascade)



insert into giangvien values
     ('GV01',N'Vũ Tuyết Trinh',N'Hoàng Mai, Hà Nội', '10/10/1975'),
    ('GV02', N'Nguyễn Nhật Quang',N'Hai Bà Trưng, Hà Nội', '03/11/1976'),
	('GV03', N'Trần Đức Khánh', N'Đống Đa, Hà Nội', '04/06/1977'),
    ('GV04', N'Nguyễn Hồng Phương',N'Tây Hồ, Hà Nội', '10/12/1983'),
   ('GV05', N'Lê Thanh Hương', N'Hai Bà Trưng, Hà Nội', '10/10/1976')
select * from giangvien
insert into detai values
         ('DT01', N'Tính toán lưới', N'Nhà nước', 700),
         ('DT02', N'Phát triển tri thức', N'Bộ', 300),
         ('DT03', N'Phân loại văn bản', N'Bộ', 270),
         ('DT04', N'Dịch tự động Anh Việt', N'Trường', 30)
select * from detai

 insert into thamgia values
             ('GV01', 'DT01', 100),
             ('GV01', 'DT02', 80),
             ('GV01', 'DT03', 80),
             ('GV02', 'DT01', 120),
             ('GV02', 'DT03', 140),
             ('GV03', 'DT03', 150),
             ('GV04', 'DT04', 180)

select * from thamgia

--1
 select * from giangvien where DiaChi = N'Hai Bà Trưng, Hà Nội' order by HoTen desc

--2
select d.* from giangvien as d inner join (select a.GV#  from thamgia as a inner join (select DT# from detai where TenDT = N'Tính toán lưới') as b on a.DT# = b.DT#) as c on d.GV# = c.GV#

--3
select d.* from giangvien as d inner join (select a.*  from thamgia as a inner join (select DT# from detai where TenDT = N'Phân loại văn bản' or TenDT = N'Dịch tự động Anh Việt') as b on a.DT# = b.DT#) as c on d.GV# = c.GV#

--4
select a.* from giangvien as a inner join (select GV# from thamgia group by GV# having count(DT#) >= 2) as b on a.GV# = b.GV#

--5
select a.* from giangvien as a inner join (select top 1 count(DT#) as DT_quantity, GV# from thamgia group by GV# order by DT_quantity desc) as b on a.GV# = b.GV#

--6
select a.* from detai as a inner join (select top 1 DT# from detai order by KinhPhi ) as b on a.DT# = b.DT#

--7
select d.GV_HoTen, d.GV_NgaySinh, c.TenDT from detai as c inner join (select a.DT# as DT_ID, b.HoTen as GV_HoTen, b.NgaySinh as GV_NgaySinh from thamgia as a inner join 
(select * from giangvien where DiaChi = N'Tây Hồ, Hà Nội') as b on b.GV# = a.GV#) as d 
on c.DT# = d.DT_ID

--8
select c.* from (select * from giangvien where NgaySinh < '01/01/1980') as c inner join
(select a.GV# as GV_ID from thamgia as a inner join (select * from detai where TenDT = N'Phân loại văn bản') as b on b.DT# = a.DT#) as d on c.GV# = d.GV_ID

--9
select a.GV#, a.HoTen, b.TongSoGio from giangvien as a inner join (select sum(SoGio) as TongSoGio, GV# from thamgia group by GV#) as b on b.GV# = a.GV#

--10
insert into giangvien values ('GV06', N'Ngô Tuấn Phong', N'Đống Đa, Hà Nội', '08/09/1986');

--11
update giangvien set DiaChi = N'Tây Hồ, Hà Nội' where HoTen = N'Vũ Tuyết Trinh';

--12
delete from giangvien where GV# = 'GV02';




