--1--
SELECT Title, FirstName, MiddleName, LastName FROM Person.Person;
--2--
SELECT rtrim(concat(FirstName + ' ', MiddleName + ' ', LastName + ' ') FROM Person.Person;
--3--
SELECT AddressLine1 FROM Person.Address;
--4--
SELECT TOP 10 * FROM Person.Address;
--5--
SELECT AVG(Rate) FROM HumanResources.EmployeePayHistory;
--6--

--7--


select count(BusinessEntityID) from HumanResources.Employee


--8--

alter table Person.Person
add FullName nvarchar(150) null 
update Person.Person
set fullname = rtrim(concat(FirstName + ' ', MiddleName + ' ', LastName + ' '))
select d.FullName,count(OrderQty) as quantity from Sales.SalesOrderDetail as a
inner join 	Sales.SalesOrderHeader as b on b.SalesOrderID = a.SalesOrderID
inner join Sales.Customer as c on c.CustomerID = b.CustomerID
inner join Person.Person as d on c.PersonID = d.BusinessEntityID
group by FullName
having count(OrderQty) > 10


--9--

select b.Name,count(OrderQty) as quantity from Sales.SalesOrderDetail as a 
full outer join Production.Product as b on a.ProductID = b.ProductID
group by b.Name
having count(OrderQty) < 1