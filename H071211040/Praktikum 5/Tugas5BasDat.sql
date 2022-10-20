-- No1
use classicmodels;
select c.customerName, o.status, o.comments
from orders o
inner join customers c
using (customerNumber)
where comments like '%credit limit exceeded%' and o.status = 'On Hold';

-- No2 
select c.customerName, o .status, o.comments
from customers c
inner join orders o
using (customerNumber)
where comments like '%DHL%';

-- No3
select  c.customerName, p.productName, o.status, o.shippedDate
from orders o
inner join customers c
using (customerNumber)
inner join orderdetails od
using (orderNumber)
inner join products p
using (productCode)
where productName like '%Ferrari%' order by o.shippedDate desc;

-- No4
insert into orders
value (2133,current_date(),adddate((current_date),interval 1 year), null,'In Process',null,465);

select * from  products where productName = '1934 Ford V8 Coupe';

insert into orderdetails (orderNumber, productCode, quantityOrdered, priceEach)
value (2133,'S18_2957', '50', 62.46);

select c.customerName, o.status, o.orderDate, o.requiredDate, od.priceEach
from orders o
join customers c
using (customerNumber)
join orderdetails od
using (orderNumber)
where orderNumber = 2133;