#Jawaban no.1
#SELECT * FROM offices WHERE city = 'san francisco'
#Jawaban no.2
#SELECT * FROM orderdetails WHERE quantityOrdered>70 ORDER BY orderLineNumber asc
#Jawaban no.3
#SELECT Distinct productLine FROM products 
#Jawaban no.4
#SELECT  customerNumber AS 'NomorKostumer',customerName AS 'NamaKostumer'FROM customers WHERE customerNumber>99 AND customerNumber<151
#Jawaban n0.5
#SELECT * FROM customers WHERE country !='USA' AND creditLimit >0 ORDER BY customerName ASC LIMIT 10,10