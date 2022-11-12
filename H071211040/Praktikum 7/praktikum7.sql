-- No1
use classicmodels;
select customerNumber, customerName,
(select max(amount) from payments) as max_amount, 
(select min(amount)) as min_amount
from customers
join payments
using(customerNumber)	
group by customerNumber; 

-- No2
select e.employeeNumber, e.lastName, e.firstName, o.city, o.officeCode
from employees e
join offices o
using(officeCode)
where city in (
	select city
    from offices
    group by city
    having max(officeCode));

-- Nomor 3
select productName, productScale 
from products
where productName in (
	select productName
    from products
    where productName like "%Ford%");

-- Nomor 4
select customerName, firstName, lastName , 
o.orderNumber, sum(quantityOrdered * priceEach) as 'total_order'
from customers c
join employees e
on c.salesRepEmployeeNumber = e.employeeNumber
join orders o
using (customerNumber)
join orderdetails od
using (orderNumber)
where od.orderNumber = 
	(select orderNumber 
    from orderdetails 
    group by orderNumber 
    order by sum(quantityOrdered * priceEach)
    desc limit 1);

-- Nomor 5
select distinct country as `negara`, char_length(country) as `panjang_karakter`
from customers
group by country
having 
char_length(country) = (select max(char_length(country)) from customers) 
or 
char_length(country) = (select min(char_length(country)) from customers)
order by country;