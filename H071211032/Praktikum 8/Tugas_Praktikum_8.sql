


# Nomor 1
USE appseminar;

SELECT d.nama, d.nip, p.nama `Program Studi` 
FROM ss_dosen AS d
JOIN ss_prodi AS p
USING(id_prodi)
WHERE p.nama LIKE '%Komputer%'
UNION 
SELECT m.nama, m.nim, p.nama `Program Studi`
FROM ss_mahasiswa AS m
JOIN ss_prodi AS p
USING(id_prodi)
WHERE p.nama LIKE '%Komputer%';



# Nomor 2
SELECT `Nama Dosen`, `Prodi`, GROUP_CONCAT(riwayat) `Riwayat Status` 
FROM (
	SELECT DISTINCT d.nama AS `Nama Dosen`, p.nama `Prodi`,
  		(SELECT 'penguji 1' WHERE d.id_dosen = pe.id_penguji_1) `riwayat` 
	FROM ss_dosen AS d
	LEFT JOIN ss_prodi AS p
	USING(id_prodi), ss_penguji AS pe
UNION
	SELECT DISTINCT d.nama AS `Nama Dosen`, p.nama AS `Prodi`,
  		(SELECT 'penguji 2' WHERE d.id_dosen = pe.id_penguji_2) `riwayat` 
	FROM ss_dosen AS d 
	LEFT JOIN ss_prodi AS p
	USING(id_prodi), ss_penguji AS pe
UNION 
	SELECT DISTINCT d.nama AS `Nama Dosen`, p.nama AS `Prodi`,
  		(SELECT 'pembimbing utama' WHERE d.id_dosen = pm.id_pembimbing_utama) `riwayat` 
	FROM ss_dosen AS d 
	LEFT JOIN ss_prodi AS p
	USING(id_prodi), ss_pembimbing AS pm
UNION 
	SELECT DISTINCT d.nama AS `Nama Dosen`, p.nama AS `Prodi`,
  		(SELECT 'pembimbing pertama' WHERE d.id_dosen = pm.id_pembimbing_pertama) `riwayat` 
	FROM ss_dosen AS d 
	LEFT JOIN ss_prodi AS p
	USING(id_prodi), ss_pembimbing AS pm) AS nomor2
GROUP BY `Nama Dosen`
HAVING `Riwayat Status` IS NOT NULL
ORDER BY `Nama Dosen` DESC;



# Nomor 3
USE classicmodels;

SELECT `city`, COUNT(`city`) AS `jumlah`, GROUP_CONCAT(`nama`) AS `ini nama na`
FROM ( 
	SELECT c.city, c.customerName 'nama'
	FROM customers AS c
	WHERE c.customerName LIKE 'L%'
	UNION
	SELECT o.city, CONCAT(e.firstName,' ', e.lastName) 'nama'
	FROM employees AS e
	JOIN offices AS o
	USING (officeCode)
	WHERE e.firstName LIKE 'L%' ) AS isi
GROUP BY `city`
ORDER BY COUNT(`city`) DESC;


