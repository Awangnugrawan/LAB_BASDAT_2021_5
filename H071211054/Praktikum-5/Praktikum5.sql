USE classicmodels;

-- Nomor 1
SELECT * FROM customers;
SELECT * FROM orders;

SELECT c.customerName, c.creditLimit, o.status, o.comments
FROM customers AS c
INNER JOIN orders AS o
USING (customerNumber)
WHERE o.comments LIKE '%limit exceeded%';

-- Nomor 2
SELECT c.customerName, o.status, o.comments
FROM customers AS c
INNER JOIN orders AS o
USING (customerNumber)
WHERE o.comments LIKE '%DHL%';

-- Nomor 3
SELECT c.customerName, p.productName , o.status, o.shippedDate 
FROM customers AS c
INNER JOIN orders AS o
USING (customerNumber)
INNER JOIN orderdetails AS od
USING (orderNumber)
INNER JOIN products AS p
USING (productCode)
WHERE p.productName LIKE '%Ferrari%' ORDER BY o.shippedDate DESC;

-- Nomor 4
SELECT * FROM orders;

-- memasukkan data baru pada kolom table orders
INSERT INTO orders (orderNumber,status,orderDate,requiredDate,customerNumber)
VALUES ('20000','In Process',current_date(),current_date() + INTERVAL 1 YEAR,'465');
SELECT * FROM orders WHERE customerNumber = '465';

-- memasukkan data baru pada table orderdetails
SELECT * FROM products WHERE productName LIKE "%v8 coupe%";

INSERT INTO orderdetails
VALUES ('20000','S18_2957','50','62.46','40');

SELECT * FROM orderdetails WHERE orderNumber = "20000";

-- HASILNYA
SELECT customers.customerNumber, customers.customerName, orders.status,
orders.orderDate,orders.requiredDate,orderdetails.quantityOrdered, products.productName 
FROM customers
INNER JOIN orders
ON  customers.customerNumber = orders.customerNumber
INNER JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
INNER JOIN products
ON orderdetails.productCode = products.productCode
WHERE  customers.customerNumber = '465';
