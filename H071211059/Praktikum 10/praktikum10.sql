use classicmodels;

select customerName,
       case
           when c.creditLimit - sum(o2.quantityOrdered * o2.priceEach) = 0 then 'You are running out of credits'
            when c.creditLimit - sum(o2.quantityOrdered * o2.priceEach) < 0 then 'You are in debts'
            when c.creditLimit - sum(o2.quantityOrdered * o2.priceEach) > 0 then 'You are safe'
        end 'Are you safe',
    c.creditLimit - sum(o2.quantityOrdered * o2.priceEach) total
from customers c
join orders o on c.customerNumber = o.customerNumber
join orderdetails o2 on o.orderNumber = o2.orderNumber
group by c.customerNumber
order by c.customerName desc;