-- USE appseminar;
-- -- No 1
-- SELECT d.nama AS Nama, d.nip AS 'NIP/NIM', p.nama
-- FROM ss_dosen d
-- JOIN ss_prodi p
-- ON d.id_prodi = p.id_prodi
-- WHERE p.id_prodi = 'H07'
-- UNION
-- SELECT m.nama, m.nim, p.nama
-- FROM ss_mahasiswa m
-- JOIN ss_prodi p
-- ON m.id_prodi = p.id_prodi
-- WHERE p.id_prodi = 'H07';
-- 
-- -- No 2
-- SELECT `Nama Dosen`, `Nama Prodi`, GROUP_CONCAT( " ", stat) AS `Riwayat Status`
-- FROM (
-- 		SELECT DISTINCT ss_dosen.nama AS `Nama Dosen`, ss_prodi.nama AS `Nama Prodi`, (
-- 			SELECT 'Penguji 1' WHERE ss_penguji.id_penguji_1 = ss_dosen.id_dosen) AS stat
-- 		FROM ss_dosen LEFT JOIN ss_prodi USING(id_prodi), ss_penguji 
-- 		UNION 
-- 		SELECT DISTINCT ss_dosen.nama AS `Nama Dosen`, ss_prodi.nama AS `Nama Prodi`, (
-- 			SELECT 'Penguji 2' WHERE ss_penguji.id_penguji_2 = ss_dosen.id_dosen) AS stat
-- 		FROM ss_dosen LEFT JOIN ss_prodi USING(id_prodi), ss_penguji
-- 		UNION 
-- 		SELECT DISTINCT ss_dosen.nama AS `Nama Dosen`, ss_prodi.nama AS `Nama Prodi`, (
-- 			SELECT 'Penguji 3' WHERE ss_penguji.id_penguji_3 = ss_dosen.id_dosen) AS stat
-- 		FROM ss_dosen LEFT JOIN ss_prodi USING(id_prodi), ss_penguji
-- 		UNION 
-- 		SELECT DISTINCT ss_dosen.nama AS `Nama Dosen`, ss_prodi.nama AS `Nama Prodi`, (
-- 			SELECT 'Pembimbing Utama' WHERE ss_pembimbing.id_pembimbing_utama = ss_dosen.id_dosen) AS stat
-- 		FROM ss_dosen LEFT JOIN ss_prodi USING(id_prodi), ss_pembimbing
-- 		UNION 
-- 		SELECT DISTINCT ss_dosen.nama AS `Nama Dosen`, ss_prodi.nama AS `Nama Prodi`, (
-- 			SELECT 'Pembimbing Pertama' WHERE ss_pembimbing.id_pembimbing_pertama = ss_dosen.id_dosen) AS stat
-- 		FROM ss_dosen LEFT JOIN ss_prodi USING(id_prodi), ss_pembimbing
-- 		UNION 
-- 		SELECT DISTINCT ss_dosen.nama AS `Nama Dosen`, ss_prodi.nama AS `Nama Prodi`, (
-- 			SELECT 'Pembimbing Kedua' WHERE ss_pembimbing.id_pembimbing_kedua = ss_dosen.id_dosen) AS stat
-- 		FROM ss_dosen LEFT JOIN ss_prodi USING(id_prodi), ss_pembimbing
-- 	) AS riwayat
-- GROUP BY `Nama Dosen`
-- HAVING `Riwayat Status` IS NOT NULL 
-- ORDER BY `Nama Dosen` DESC;

-- No 3
-- USE classicmodels;
-- SELECT city AS Kota, COUNT(city) AS Jumlah, GROUP_CONCAT(nama)
-- FROM
-- (SELECT city, customerName AS Nama
--  FROM customers 
--  WHERE customerName LIKE 'L%'
--  UNION
--  SELECT offices.city, 
--  (SELECT CONCAT(employees.firstName, ' ',employees.lastName)) AS b
--  FROM employees  
--  JOIN offices
--  USING (officeCode)
--  HAVING b LIKE 'L%'
--  ) AS dh
--  GROUP BY city
--  ORDER BY COUNT(city) DESC;

-- NO 1
-- SELECT e.firstName, o.phone, CONCAT(LEFT(o.phone, LENGTH(o.phone)-8),'*** ****') AS no_telp 
-- FROM employees e
-- JOIN offices o
-- USING (officeCode)
-- WHERE o.phone LIKE '+33%';

-- NO 9
-- (SELECT c.customerName,p.productName, (SELECT p.buyPrice * SUM(od.quantityOrdered)) AS `modal` 
-- FROM customers c
-- JOIN orders o 
-- USING(customerNumber)
-- JOIN orderdetails od 
-- USING(orderNumber)
-- JOIN products p 
-- USING(productCode)
-- GROUP BY customerName
-- ORDER BY modal DESC
-- LIMIT 3)
-- UNION
-- (SELECT customerName,p.productName, (SELECT p.buyPrice * SUM(od.quantityOrdered)) AS `modal` 
-- FROM customers c
-- JOIN orders o 
-- USING(customerNumber)
-- JOIN orderdetails od 
-- USING(orderNumber)
-- JOIN products p 
-- USING(productCode)
-- GROUP BY customerName
-- ORDER BY modal ASC
-- LIMIT 3); 