use AdventureWorksLT2019
-- task1 :retrieve customer data
--retrieve name customer data
-- Create a list of all customer contact names
--   that includes the title, first name, middle name (if any), last 
--   name, and suffix (if any) of all customers
---------------------
select Title, FirstName, MiddleName , LastName, Suffix
from SalesLT.Customer;


-- retrieve customer data names and phone numbers
select SalesPerson, Title + ' ' + LastName AS CustomerName, Phone
from SalesLT.Customer;


-- Task 2 : Retrieve customer order data
-- retrieve a list of customer companies
SELECT CONVERT(varchar, CustomerID)+ ': ' + CompanyName
from SalesLT.Customer;

-- retrieve a list of sales order revisions 
-- salesLT.SalesOrderHeader 

select SalesOrderNumber + ' (' + CONVERT(nvarchar, RevisionNumber) + ')', 
CONVERT(nvarchar, OrderDate, 102) AS ISOFormatDate
from SalesLT.SalesOrderHeader;



-- task3 : retrieve customer contact details
-- retrieve customer contact names with middle names if know

SELECT FirstName + ' ' + ISNULL(MiddleName, '') + ' ' + LastName AS CustomerName
FROM SalesLT.Customer;

-- 2. Retrieve primary contact details
UPDATE SalesLT.Customer 
SET EmailAddress = NULL 
WHERE CustomerID % 7 = 1;

SELECT CustomerID, COALESCE(EmailAddress, Phone) As PrimaryContact
FROM SalesLT.Customer;


-- 3. Retrieve shipping status

SELECT SalesOrderID,
	CASE
		WHEN ShipDate IS NULL THEN 'Awaiting Shipment'
		ELSE 'Shipped'
	END AS ShippingStatus
FROM SalesLT.SalesOrderHeader;