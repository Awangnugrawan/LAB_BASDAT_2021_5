use classicmodels;

select customerNumber, customerName, max(amount), min(amount) from customers
join payments p
using (customerNumber)
where exists(select amount from payments where amount and customerNumber != 0) 
group by customerNumber;

-- Nomor 2
select e.employeeNumber, e.firstName, e.lastName, o.city, o.officeCode 
from employees e
join offices o 
using (officeCode)
where officeCode in (
	select officeCode from offices
    having max(officeCode)
    );

-- Nomor 3
select productName, productScale
from products
where productName in(
	select productName from products
    where productName like '%Ford%');
    
-- Nomor 4
select customerName, firstName, lastName as 'last name', o.orderNumber,
sum(quantityOrdered * priceEach) as 'Total'
from customers c
join employees e
on c.salesRepEmployeeNumber = e.employeeNumber
join orders o
using (customerNumber)
join orderdetails od
using (orderNumber)
where orderNUmber = (
	select orderNumber
    from orderdetails
    group by orderNumber
    order by sum(quantityOrdered * priceEach)
    desc limit 1);
    
-- Nomor 5
 select c.country as negara, length(c.country) as panjang_karakter
from customers c
having panjang_karakter in (select max(length(country)) from customers)
	or panjang_karakter in (select min(length(country)) from customers)
order by c.country asc
limit 2
;
