USE appseminar;

-- NO 1
SELECT d.nama, p.nama, d.nip
FROM ss_dosen d
JOIN ss_prodi p
USING (id_prodi)
WHERE p.nama = 'ilmu komputer'
	UNION
SELECT m.nama, p.nama, m.nim
FROM ss_mahasiswa m
JOIN ss_prodi p
USING (id_prodi)
WHERE p.nama = 'ilmu komputer';

-- NO 2
SELECT `Nama`, 
		 `Prodi`, 
		 GROUP_CONCAT(' ', stat) AS `Riwayat Status`
FROM (SELECT DISTINCT d.nama AS `Nama`,
				 p.nama AS `Prodi`,
				 (SELECT 'Pembimbing Utama' WHERE pem.id_pembimbing_utama = d.id_dosen) AS stat
		FROM ss_dosen d
		LEFT JOIN ss_prodi p
		USING (id_prodi), ss_pembimbing pem
			UNION
		SELECT DISTINCT d.nama AS `Nama`,
				 p.nama AS `Prodi`,
				 (SELECT 'Pembimbing Pertama' WHERE pem.id_pembimbing_pertama = d.id_dosen) AS stat
		FROM ss_dosen d
		LEFT JOIN ss_prodi p
		USING (id_prodi), ss_pembimbing pem
			UNION
		SELECT DISTINCT d.nama AS `Nama`,
				 p.nama AS `Prodi`,
				 (SELECT 'Penguji 1' WHERE peng.id_penguji_1 = d.id_dosen) AS stat
		FROM ss_dosen d
		LEFT JOIN ss_prodi p
		USING (id_prodi), ss_penguji peng
			UNION
		SELECT DISTINCT d.nama AS `Nama`,
				 p.nama AS `Prodi`,
				 (SELECT 'Penguji 2' WHERE peng.id_penguji_2 = d.id_dosen) AS stat
		FROM ss_dosen d
		LEFT JOIN ss_prodi p
		USING (id_prodi), ss_penguji peng
		) AS `Riwayat`
GROUP BY `Nama`
HAVING `Riwayat Status` IS NOT NULL
ORDER BY `Nama` DESC;

-- No 3
USE classicmodels;

SELECT `Kota`, SUM(`Jumlah`) AS `Jumlah`, GROUP_CONCAT(`Nama`)
FROM (SELECT city AS  `Kota`, COUNT(CustomerNumber) AS `Jumlah`, GROUP_CONCAT(customerName) AS `Nama`
		FROM customers 
		WHERE customerName LIKE 'L%'
		GROUP BY city 
		UNION 
		SELECT o.city AS `Kota`, COUNT(e.firstName) AS `Jumlah`, GROUP_CONCAT(CONCAT(e.firstName, ' ', e.lastName)) AS `Nama`
		FROM employees e
		JOIN offices o
		USING (officeCode)
		WHERE e.firstName LIKE 'L%'
		GROUP BY city
		) `hahaha`
GROUP BY `Kota`
ORDER BY `Jumlah` DESC;