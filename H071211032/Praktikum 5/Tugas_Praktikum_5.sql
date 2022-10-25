USE classicmodels;


#Nomor 1
SELECT c.customerName, o.comments
FROM customers AS c
INNER JOIN orders AS o
USING (customerNumber)
WHERE comments LIKE "%credit limit exceeded%"


#Nomor 2
SELECT c.customerName, o.`status`, o.comments
FROM customers AS c
INNER JOIN orders AS o
USING (customerNumber)
WHERE comments LIKE "%DHL%"


#Nomor 3
SELECT c.customerName, p.productName, o.`status`, o.shippedDate
FROM customers AS c
INNER JOIN orders AS o
USING (customerNumber)
INNER JOIN orderdetails AS od
USING (orderNumber)
INNER JOIN products AS p
USING (productCode)
WHERE productName LIKE "%Ferrari%"
ORDER BY shippedDate DESC;


#Nomor 4
INSERT INTO orders (orderNumber, orderDate, requiredDate, `status`, customerNumber)
VALUE (10465,CURRENT_DATE,ADDDATE(CURRENT_DATE, Interval 1 Year), "In Process", 465);

ALTER TABLE orderdetails
DROP CONSTRAINT orderdetails_ibfk_1;

INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
VALUE (10465,"S18_2957", 50, 62.46*0.75, 1)

-- Cek Nomor 4
SELECT * 
FROM orders 
INNER JOIN orderdetails
USING (orderNumber)
WHERE orderNumber = 10465

