USE appseminar;
-- Nomor 1
SELECT m.nama AS "Nama Dosen dan Mahasiswa", m.nim AS "NIP/NIM", p.nama as"Nama Program Studi"
FROM ss_mahasiswa AS m
JOIN ss_prodi AS p
USING(id_Prodi) 
WHERE p.nama = "Ilmu Komputer"
UNION 
SELECT d.nama, d.nip, p.nama 
FROM ss_dosen AS d
JOIN ss_prodi AS p
USING(id_Prodi)
WHERE p.nama = "Ilmu Komputer";

-- Nomor  2
SELECT nama, `Nama Prodi`, group_concat(`Riwayat`) AS "Riwayat Status"
FROM 
(SELECT distinct d.nama, p.nama AS "Nama Prodi", "Penguji 1" AS Riwayat
FROM ss_dosen AS d
left JOIN ss_prodi AS p
USING(id_Prodi)
JOIN ss_penguji AS Penguji 
ON d.id_dosen= Penguji.id_penguji_1
GROUP BY d.nama

UNION ALL

SELECT distinct d.nama , p.nama AS "Nama Prodi", "Penguji 2" AS Riwayat
FROM ss_dosen AS d
left JOIN ss_prodi AS p
USING(id_Prodi)
JOIN ss_penguji AS Penguji 
ON d.id_dosen= Penguji.id_penguji_2
GROUP BY d.nama

UNION ALL 

SELECT distinct d.nama , p.nama AS "Nama Prodi", "Pembimbing utama" AS Riwayat
FROM ss_dosen AS d
left JOIN ss_prodi AS p
USING(id_Prodi)
JOIN ss_pembimbing AS Pembimbing
ON d.id_dosen= Pembimbing.id_pembimbing_utama
GROUP BY d.nama

UNION ALL 

SELECT distinct d.nama, p.nama AS "Nama Prodi", "Pembimbing Pertama" AS Riwayat
FROM ss_dosen AS d
left JOIN ss_prodi AS p
USING(id_Prodi)
JOIN ss_pembimbing AS Pembimbing 
ON d.id_dosen= Pembimbing.id_pembimbing_pertama
GROUP BY d.nama ) a GROUP BY nama ORDER BY nama DESC;

-- Nomor 3
use classicmodels;
SELECT o.city AS 'Kota', COUNT(city) AS `Jumlah`, GROUP_CONCAT(o.nama)
FROM (
SELECT city, customerName AS `Nama`
FROM customers WHERE customerName LIKE 'L%'
UNION 
SELECT offices.city, 
(SELECT CONCAT(employees.firstName, ' ', employees.lastName)) AS b
FROM employees 
JOIN offices 
USING(officeCode)
HAVING b LIKE 'L%'
) AS o
GROUP BY city
ORDER BY COUNT(city) DESC;


-- Tugas Tambahan
select o.orderNumber, od.quantityOrdered, p.productName, od.priceEach
FROM orderdetails AS od 
JOIN products AS p 
USING(productCode)
JOIN orders AS o
USING(orderNumber)
WHERE od.priceEach > 200 AND productName LIKE '%Ferrari%';
