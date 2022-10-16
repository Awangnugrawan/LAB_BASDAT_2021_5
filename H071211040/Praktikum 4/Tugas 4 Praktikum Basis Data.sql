-- No1
use classicmodels;
select o.orderDate, p.productName
from orders o 
inner join orderdetails od
using(orderNumber)
-- on od.orderNumber = o.orderNumber
inner join products p
using(productCode)
where productName = '1940 Ford Pickup Truck'
order by orderDate desc;


-- No2
use classicmodels;
select p.productName, p.MSRP, p.buyPrice, od.priceEach
from products p
inner join orderdetails od
using(productCode)
where priceEach < (80/100)*MSRP;

-- No3
use appseminar;
select * from ss_mahasiswa;
select * from ss_pembimbing;
select * from ss_dosen;

select sm.nama, sd.nama
from ss_mahasiswa sm
right join ss_pembimbing sp
using(id_mahasiswa)
right join ss_dosen sd
on sp.id_pembimbing_utama = sd.id_dosen
where sm.nama = 'Sulaeman';

-- No4
use classicmodels;
select * from customers;
select * from orders;
select * from orderdetails;

alter table customers
add status varchar(255);

update customers c
inner join orders o
on c.customerNumber = o.customerNumber
inner join orderdetails od
on o.orderNumber = od.orderNumber
inner join payments p
on c.customerNumber = p.customerNumber
set c.status = 'VIP'
where amount > 100000 or quantityOrdered > 50;

select distinct c.customerName, c.customerNumber, c.status
from customers c
inner join orders o
on c.customerNumber = o.customerNumber
inner join orderdetails od
on o.orderNumber = od.orderNumber
inner join payments p
on c.customerNumber = p.customerNumber;


update customers c
inner join orders o
on c.customerNumber = o.customerNumber
inner join orderdetails od
on o.orderNumber = od.orderNumber
inner join payments p
on c.customerNumber = p.customerNumber
set c.status = 'Regular'
where amount < 100000 or quantityOrdered < 50;

-- No5
use classicmodels;
select column_name, constraint_name, REFERENCED_COLUMN_NAME, REFERENCED_TABLE_NAME
from information_schema.KEY_COLUMN_USAGE
where table_name = 'payments';

-- alter table orders drop constraint orders_ibfk_1;
-- alter table orderdetails drop constraint orderdetails_ibfk_1;
-- alter table payments drop constraint payments_ibfk_1;

select c.customerName, o.status
from customers c
inner join orders o
using (customerNumber)
where o.status = 'Cancelled';

delete customers 
from customers 
inner join orders  
using (customerNumber)
where orders.status = 'Cancelled';

select * from orders o
where status = 'Cancelled';

select * from orders
where customerNumber = 496;