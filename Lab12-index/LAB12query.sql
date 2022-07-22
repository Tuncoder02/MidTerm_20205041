--LAB 12
--1
create index idx_country on customers(country)
select * from customers
where country = 'Canada'

--2
create index idx_cost on orders(netamount)
select * from orders 
where netamount > 100

--3
create index idx_total on orders(totalamount)
select * from orders
where totalamount > 100

--4
select p.title, count(ol.prod_id) as quantities
from orderlines ol inner join  products p on ol.prod_id = p.prod_id
group by ol.prod_id,p.title

--5
select o.customerid, concat(firstname,' ', lastname) as fullname from customers c
inner join orders o on c.customerid = o.customerid

--6
select c.customerid, concat(firstname,' ', lastname) as fullname from customers c left join orders o on c.customerid = o.customerid
where o.customerid is NULL

--7
select o.customerid, concat(firstname,' ', lastname) as fullname, sum(o.totalamount)
from customers c
inner join orders o on c.customerid = o.customerid group by o.customerid, concat(firstname,' ', lastname) 

--8
select prod_id, sum(quantity) from orderlines
group by prod_id order by prod_id