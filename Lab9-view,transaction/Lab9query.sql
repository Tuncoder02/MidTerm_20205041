create database production
use production
create table categories
( category_id int primary key,
  category_name varchar(50))
insert into categories values
(1,'Loai 1'),
(2,'loai 2'),
(3,'loai 3'),
(4,'loai 4'),
(5,'loai 5'),
(6,'loai 6'),
(7,'loai 7'),
(8,'loai 8'),
(9,'loai 9'),
(10,'loai 10')
select * from categories
create table brands(
  brand_id int primary key,
  brand_name varchar(50))
insert into brands values
(1,'brand 1'),
(2,'brand 2'),
(3,'brand 3'),
(4,'brand 4'),
(5,'brand 5')
select * from brands
create table products(
 product_id int primary key,
 product_name varchar(50),
 brand_id int,
 category_id int,
 model_year int,
 list_price int,
 foreign key (brand_id) references brands(brand_id) on delete cascade on update cascade,
 foreign key (category_id) references categories(category_id) on delete cascade on update cascade )
 insert into products values
(1,	'name 1'	,1	,1	,2022	,80000),
(2,	'name 2'	,2	,2	,2021	,100001),
(3,	'name 3'	,3	,3	,2019	,120000),
(4,	'name 4'	,4	,4	,2022	,99000),
(5,	'name 5'	,5	,5	,2020	,200000),
(6,	'name 6'	,1	,6	,2021	,100000),
(7,	'name 7'	,2	,7	,2019	,300000),
(8,	'name 8'	,3	,8	,2022	,50000),
(9,	'name 9'	,4	,9	,2022	,60000),
(10,'name 10'	,5	,10	,2019	,110000),
(11,'name 11'	,1	,1	,2020	,205000),
(12,'name 12'	,2	,2	,2022	,70000),
(13,'name 13'	,3	,3	,2021	,89000),
(14,'name 14'	,4	,4	,2020	,99999),
(15,'name 15'	,5	,5	,2019	,512000),
(16,'name 16'	,1	,6	,2022	,61200),
(17,'name 17'	,2	,7	,2021	,85000),
(18,'name 18'	,3	,8	,2020	,321000),
(19,'name 19'	,4	,9	,2022	,98000),
(20,'name 20'	,5	,10	,2019	,74000)
select * from products
--b
create view v_product(product_id, product_name, models_year, list_price, brand_name, category_name)
as
 select a.product_id,a.product_name,a.model_year,a.list_price,b.brand_name,c.category_name from products as a inner join brands as b on a.brand_id=b.brand_id inner join categories as c on c.category_id=a.category_id
                                                                              
select * from v_product where models_year=2022
alter view v_product(product_id, product_name, models_year, list_price, brand_name, category_name)
as
  select a.product_id,a.product_name,a.model_year,a.list_price,b.brand_name,c.category_name from products as a inner join brands as b on a.brand_id=b.brand_id inner join categories as c on c.category_id=a.category_id
   where a.list_price>100000
--c
create procedure ok1 
 @id int
 as
declare @tranname1 varchar(30);
select @tranname1='printf_product'
begin transaction @tranname1
select * from products where brand_id=@id;
commit transaction @tranname1
exec ok1 1;

declare @tranname2 varchar(30)
select @tranname2='update'
begin transaction @tranname2;
    save transaction sp1;
   update products set list_price=list_price+100000 where product_name='name 2';
   select * from products
   save transaction sp2;
rollback transaction sp1;
select * from products
