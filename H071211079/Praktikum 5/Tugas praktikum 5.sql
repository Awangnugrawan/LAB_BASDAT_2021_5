use classicmodels;

-- nomor 1
select * from customers;
select * from orders;
select * from payments;

select c.customerName, c.creditLimit, o.status, o.comments
from customers as c
inner join orders as o
using (customerNumber)
where o.comments like 'Customer Credit Limit%';


-- nomor 2
select * from customers;
select * from orders;
select * from orders where comments like '%DHL%';

select c.customerName as `Nama Customers`, o.status as `Status Order`, o.comments `Comments %DHL%`
from customers as c
inner join orders as o
using (customerNumber)
where o.comments like '%DHL%';

-- nomor 3
select * from customers;
select * from orders;
select * from orderdetails;
select * from products where productName like '%Ferrari%';

select c.customerName as `Nama Customers`, p.productName as `Nama Mobil`, o.status as `Status Order`, o.shippedDate as `Tanggal Pengiriman`
from customers as c
inner join orders as o
using (customerNumber)
inner join orderdetails as od
using (orderNumber)
inner join products as p
using (productCode)
where p.productName like '%Ferrari%' 
order by o.shippedDate desc;

-- nomor 4

select * from orders;

insert into orders (orderNumber, status, orderDate, requiredDate, customerNumber)
values ('10450','In Process', current_date(),current_date() + INTERVAL 1 YEAR, '465');

select * from orders where customerNumber = '465';

select * from products where productName like "%Ford v8%";
insert into orderdetails
values ('10450','S18_2957','50','62.46','40');

select * from orderdetails where orderNumber = "10450";

select distinct c.customerNumber, c.customerName, o.status,
o.orderDate, o.requiredDate, od.quantityOrdered, p.productName 
from customers as c
inner join orders as o
using (customerNumber)
inner join orderdetails as od
using (orderNumber)
inner join products as p
using (productCode)
where c.customerNumber = '465';

