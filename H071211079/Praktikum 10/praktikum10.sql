select c.customerName, (c.creditLimit - sum(od.quantityOrdered * od.priceEach)) as `Total`,
case
when (c.creditLimit - sum(od.quantityOrdered * od.priceEach)) > 0 then 'you are safe'
when (c.creditLimit - sum(od.quantityOrdered * od.priceEach)) < 0 then 'you are in debt'
else 'you are running out of credits'
end as "Are you safe?"

from customers as c
join orders as o 
using(customerNumber)
join orderdetails as od
using (orderNumber)
group by customerName
order by c.customerName
desc;