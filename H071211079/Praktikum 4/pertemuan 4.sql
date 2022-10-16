use classicmodels;
use appseminar;

-- nomor 1
select * from products where productName = '1940 Ford Pickup Truck';
select * from orders;
select * from orderdetails;

select p.productCode, p.productName, o.orderDate
from orderdetails as od
right join products as p 
using(productCode) 
right join orders as o
using(orderNumber) 
where p.productName = '1940 Ford Pickup Truck'
order by o.orderDate desc;

-- nomor 2
select * from products;
select * from orderdetails;
select * from orders;

select p.productName, od.priceEach, p.MSRP as '80% MSRP'
from products as p
inner join orderdetails as od
on od.productCode = p.productCode
where od.priceEach < (p.MSRP*0.8); 

-- nomor 3
select * from ss_mahasiswa;
select * from ss_pembimbing;
select * from ss_dosen;

select sp.id_pembimbing_utama as `Id Pembimbing Utama`, sd.nama as `Nama Dosen`, sm.nama as `Nama Mahasiswa`
from ss_mahasiswa as sm
right join ss_pembimbing as sp
using (id_mahasiswa)
right join ss_dosen as sd
on sp.id_pembimbing_utama = sd.id_dosen
where sm.nama = 'Sulaeman';

-- nomor 4
select * from customers;

ALTER TABLE customers
ADD Status varchar (100) DEFAULT 'Regular';

SET SQL_SAFE_UPDATES = 0;
update customers join payments
on customers.customerNumber = payments.customerNumber
join orders 
using (customerNumber)
join orderdetails 
using (orderNumber)
set customers.`status` = 'VIP'
where payments.amount > 100000 OR orderdetails.quantityOrdered >= 50;
SET SQL_SAFE_UPDATES = 1;

select distinct c.customerName, p.customerNumber, c.Status
from customers as c
inner join payments as p
using (customerNumber)
inner join orders as o
inner join orderdetails
using (orderNumber);

-- nomor 5
select TABLE_NAME, CONSTRAINT_NAME, referenced_column_name, referenced_table_name
FROM information_schema.key_column_usage
where TABLE_NAME = 'orders';

ALTER TABLE orders
DROP CONSTRAINT orders_ibfk_1;

select TABLE_NAME, CONSTRAINT_NAME, referenced_column_name, referenced_table_name
from information_schema.key_column_usage
where TABLE_NAME = 'payments'; 

ALTER TABLE payments
DROP CONSTRAINT payments_ibfk_1;

select customers.customerNumber, orders.status
from customers
join orders
using (customerNumber)
where orders.status = 'cancelled';

SET SQL_SAFE_UPDATES = 0;
delete customers
from customers
join orders
using (customerNumber)
where orders.status = 'cancelled';
SET SQL_SAFE_UPDATES = 1;

select * from orders 
where status = 'cancelled';

select * from orders
where customerNumber = '448';










