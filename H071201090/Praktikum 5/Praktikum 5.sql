-- Jawaban NO.1
-- SELECT customers.customerName, orders.`status`,orders.comments
-- FROM customers
-- INNER JOIN orders
-- ON customers.customerNumber = orders.customerNumber
-- WHERE orders.comments LIKE '%Customer credit limit%'
-- -- Jawaban no.2
-- SELECT c.customerName , o.`status`, o.comments
-- FROM customers AS c
-- INNER JOIN orders AS o
-- ON c.customerNumber = o.customerNumber
-- WHERE o.comments LIKE '%DHL%'
-- Jawaban NO.3
-- SELECT c.customerName, p.productName , o.`status` , o.shippedDate
-- FROM customers AS c
-- INNER JOIN orders AS o
-- ON c.customerNumber = o.customerNumber
-- INNER JOIN orderdetails AS od
-- ON o.orderNumber = od.orderNumber
-- INNER JOIN products AS p
-- ON od.productCode = p.productCode
-- WHERE productName LIKE '%Ferrari%'
-- ORDER BY o.shippedDate DESC
-- Jawaban no.4
-- INSERT INTO orders VALUE (10090, CURRENT_DATE, ADDDATE(CURRENT_DATE, INTERVAL 1 YEAR), '2022-11-22', 'In Process', NULL, 465);
-- INSERT INTO orderdetails VALUE (10090, 'S18_2957', 50, 62.46, 90);

-- SELECT c.customerName, d.quantityOrdered, p.productName, o.`status`, o.orderDate, o.requiredDate, d.priceEach, p.MSRP
-- FROM customers c
-- JOIN orders o
-- USING (customerNumber)
-- JOIN orderdetails d
-- USING (orderNumber)
-- JOIN products p
-- USING (productCode)
-- WHERE c.customerNumber = 465;















