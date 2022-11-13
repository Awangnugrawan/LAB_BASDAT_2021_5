select distinct c.customerName,
		(select max(amount) from payments p where p.customerNumber = c.customerNumber),
		(select min(amount) from payments p where p.customerNumber = c.customerNumber)
from customers c
right join payments p2 using (customerNumber);