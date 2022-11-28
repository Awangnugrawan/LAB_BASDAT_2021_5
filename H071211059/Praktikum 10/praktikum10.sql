use classicmodels;

select  c.customerName,
        case
           when c.creditLimit - sum(o2.priceEach * o2.quantityOrdered) > 0 then 'You are safe'
           when c.creditLimit - sum(o2.priceEach * o2.quantityOrdered) < 0 then 'You are in debt'
           when c.creditLimit - sum(o2.priceEach * o2.quantityOrdered) = 0 then 'You are running out of credits'
        end 'Are you safe?',
        c.creditLimit - sum(o2.priceEach * o2.quantityOrdered) total
from customers c
join orders o on c.customerNumber = o.customerNumber
right join orderdetails o2 on o.orderNumber = o2.orderNumber
group by o.customerNumber


