USE appseminar;

-- No 1
SELECT d.nama, d.nip, p.nama 'Program Studi' 
FROM ss_dosen d
JOIN ss_prodi p
USING(id_prodi)
WHERE p.nama LIKE '%Komp%'
UNION 
SELECT m.nama, m.nim, p.nama 'Program Studi'
FROM ss_mahasiswa m
JOIN ss_prodi p
USING(id_prodi)
WHERE p.nama LIKE '%Komp%';


-- No 2
SELECT `Nama Dosen`, `Prodi`, GROUP_CONCAT(riwayat) `Riwayat Status` 
FROM (
	SELECT DISTINCT d.nama 'Nama Dosen', p.nama 'Prodi',
  		(SELECT 'penguji 1' WHERE d.id_dosen = pe.id_penguji_1) `riwayat` 
	FROM ss_dosen d
	LEFT JOIN ss_prodi p
	USING(id_prodi), ss_penguji pe
UNION
	SELECT DISTINCT d.nama 'Nama Dosen', p.nama 'Prodi',
  		(SELECT 'penguji 2' WHERE d.id_dosen = pe.id_penguji_2) `riwayat` 
	FROM ss_dosen d LEFT JOIN ss_prodi p
	USING(id_prodi), ss_penguji pe
UNION 
	SELECT DISTINCT d.nama 'Nama Dosen', p.nama 'Prodi',
  		(SELECT 'pembimbing utama' WHERE d.id_dosen = pm.id_pembimbing_utama) `riwayat` 
	FROM ss_dosen d LEFT JOIN ss_prodi p
	USING(id_prodi), ss_pembimbing pm
UNION 
	SELECT DISTINCT d.nama 'Nama Dosen', p.nama 'Prodi',
  		(SELECT 'pembimbing pertama' WHERE d.id_dosen = pm.id_pembimbing_pertama) `riwayat` 
	FROM ss_dosen d LEFT JOIN ss_prodi p
	USING(id_prodi), ss_pembimbing pm
) chi
GROUP BY `Nama Dosen`
HAVING `Riwayat Status` IS NOT NULL
ORDER BY `Nama Dosen` DESC;

-- No 3
USE classicmodels;
SELECT `city`, COUNT(`city`) `jumlah`, GROUP_CONCAT(`nama`) `name`
FROM ( 
	SELECT c.city, c.customerName 'nama'
	FROM customers c
	WHERE c.customerName LIKE 'L%'
	UNION
	SELECT o.city, CONCAT(e.firstName,' ', e.lastName) 'nama'
	FROM employees e
	JOIN offices o
	USING (officeCode)
	WHERE e.firstName LIKE 'L%' 
) k
GROUP BY `city`
ORDER BY COUNT(`city`) DESC;
