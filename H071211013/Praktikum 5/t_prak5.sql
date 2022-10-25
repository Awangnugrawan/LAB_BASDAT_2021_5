USE classicmodels;

-- no 1
SELECT c.customerName, o.`status`, o.comments
FROM customers c
JOIN orders o
USING (customerNumber)
WHERE o.comments LIKE "%limit exceeded%";

-- no 2
SELECT c.customerName, o.comments, o.`status` 
FROM customers c
JOIN orders o
USING (customerNumber)
WHERE comments LIKE "%DHL%";

-- no 3
SELECT c.customerName, p.productName, p.productLine, o.`status`, o.shippedDate
FROM orders o
JOIN customers c
USING (customerNumber)
JOIN orderdetails od
USING (orderNumber)
JOIN products p
USING (productCode)
WHERE productName LIKE "%Ferrari%"
ORDER BY o.shippedDate DESC;

-- no 4
INSERT INTO orders 
VALUE (10001, CURRENT_DATE(), ADDDATE(CURRENT_DATE(), INTERVAL 1 YEAR), NULL, "In Process", NULL, 465);
                                                                                                                                                                                                                                                                                                                                                                                                                                                        
INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
VALUES (10001, 'S18_2957', '50', '62.46', '20');

SELECT c.customerName, o.`status`, o.orderDate, o.requiredDate, od.priceEach
FROM orders o
JOIN customers c
USING (customerNumber)
JOIN orderdetails od
USING (orderNumber)
WHERE orderNumber = 10001;


-- SELECT * FROM customers;
-- SELECT * FROM orders;
-- SELECT * FROM orderdetails;
-- SELECT * FROM payments;
