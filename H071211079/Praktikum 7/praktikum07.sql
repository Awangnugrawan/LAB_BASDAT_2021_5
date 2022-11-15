# nomor 1
select customerNumber, customerName,
	(select max(amount) from payments as p where c.customerNumber = p.customerNumber) as 'Terbesar',
    (select min(amount) from payments as p where c.customerNumber = p.customerNumber) as 'Terkecil'
from customers as c
join payments as p
using (customerNumber)
group by customerNumber;

# nomor 2
select * from employees 
where officeCode =
	(select officeCode from employees group by officeCode order by count(employeeNumber) desc limit 1);
    
# nomor 3
select productName, productScale from products as b
where exists 
	(select * from products where b.productName like '%Ford%');
    
# nomor 4
select c.customerName as `Nama Pelanggan`, e.firstName, e.lastName, 
o.orderNumber as `Nomor Pesanan`, sum(quantityOrdered * priceEach) as `Biaya Pesanan`
from customers as c
join employees as e
on c.salesRepEmployeeNumber = e.employeeNumber
join orders as o
using (customerNumber)
join orderdetails as od
using (orderNumber)
where od.orderNumber =
	(select orderNumber from orderdetails group by orderNumber order by sum(quantityOrdered * priceEach) desc limit 1);

# nomor 5
select distinct country as `Negara`, length(country) as `Panjang Karakter` from customers
where length(country) =
    (select max(length(country)) from customers) or
    length(country) =
    (select min(length(country)) from customers)
order by `Panjang Karakter` desc;
