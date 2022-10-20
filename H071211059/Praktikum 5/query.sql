-- Active: 1665285648409@@127.0.0.1@3306@classicmodels
-- NOMOR 1
SELECT c.customerName, o.`status`, o.comments
FROM customers AS c
JOIN orders AS o
USING (customerNumber)
-- WHERE o.`status` = "on hold";
WHERE o.comments LIKE "%credit limit exceeded%";

-- NOMOR 2
SELECT c.customerName, o.status, o.comments
FROM customers AS c
JOIN orders AS o USING (customerNumber)
WHERE o.comments LIKE "%DHL%";

-- NOMOR 3
SELECT o.orderNumber, c.customerName, p.productName, o.status, o.shippedDate
FROM orders AS o
INNER JOIN orderdetails AS od USING (orderNumber)
INNER JOIN products AS p USING (productCode)
INNER JOIN customers AS c USING (customerNumber)
WHERE p.productName LIKE "%ferrari%"
ORDER BY o.shippedDate DESC;


-- nomor 4
insert into orders VALUES (10501, current_date, ADDDATE(current_date, interval 1 year), "2022-10-23", "In Process", null, 465) ;
insert into orderdetails values (10501, "S18_2957", 50, 62.46, 2);

select c.customerName, p.productName, od.quantityOrdered, o.status, o.orderDate, o.requiredDate, od.priceEach, p.MSRP
from customers as c
join orders as o USING (customerNumber)
join orderdetails as od USING (orderNumber)
join products as p USING (productCode)
where customerName like "%anton%";


