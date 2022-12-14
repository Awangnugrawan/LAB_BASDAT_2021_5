#Jawaban no.1
-- SELECT m.nama AS "Mahasiswa dan Dosen", m.nim AS "NIM/NIP", p.nama as"Prodi"
-- FROM ss_mahasiswa AS m
-- JOIN ss_prodi AS p
-- USING(id_Prodi) 
-- WHERE p.nama = "Ilmu Komputer"
-- UNION 
-- SELECT d.nama, d.nip, p.nama 
-- FROM ss_dosen AS d
-- JOIN ss_prodi AS p
-- USING(id_Prodi)
-- WHERE p.nama = "Ilmu Komputer";
#Jawaban no.2
-- SELECT nama AS "Nama", `Prodi`, group_concat(`status`) AS "Riwayat Status"
-- FROM 
-- (SELECT distinct d.nama, p.nama AS "Prodi", "Penguji 1" AS status
-- FROM ss_dosen AS d
-- left JOIN ss_prodi AS p
-- USING(id_Prodi)
-- JOIN ss_penguji AS Penguji 
-- ON d.id_dosen= Penguji.id_penguji_1
-- GROUP BY d.nama
-- UNION
-- SELECT distinct d.nama , p.nama AS "Prodi", "Penguji 2" AS status
-- FROM ss_dosen AS d
-- left JOIN ss_prodi AS p
-- USING(id_Prodi)
-- JOIN ss_penguji AS Penguji 
-- ON d.id_dosen= Penguji.id_penguji_2
-- GROUP BY d.nama
-- UNION
-- SELECT distinct d.nama , p.nama AS "Prodi", "Pembimbing utama" AS status
-- FROM ss_dosen AS d
-- left JOIN ss_prodi AS p
-- USING(id_Prodi)
-- JOIN ss_pembimbing AS Pembimbing
-- ON d.id_dosen= Pembimbing.id_pembimbing_utama
-- GROUP BY d.nama
-- UNION
-- SELECT distinct d.nama, p.nama AS "Prodi", "Pembimbing Pertama" AS status
-- FROM ss_dosen AS d
-- left JOIN ss_prodi AS p
-- USING(id_Prodi)
-- JOIN ss_pembimbing AS Pembimbing 
-- ON d.id_dosen= Pembimbing.id_pembimbing_pertama
-- GROUP BY d.nama ) a GROUP BY nama ORDER BY nama DESC;
#Jawaban no.3
-- SELECT o.city , GROUP_CONCAT(o.nama) AS `Pelanggan`
-- FROM (
-- SELECT city, customerName AS `Nama`
-- FROM customers WHERE customerName LIKE 'L%'
-- UNION 
-- SELECT offices.city, 
-- (SELECT CONCAT(employees.firstName, ' ', employees.lastName)) AS a
-- FROM employees 
-- JOIN offices 
-- USING(officeCode)
-- HAVING a LIKE 'L%'
-- ) AS o
-- GROUP BY city