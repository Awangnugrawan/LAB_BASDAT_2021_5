USE appseminar;

	#NOMOR 1
SELECT m.nama, p.nama prodi, m.nim 'NIM/NIP'
FROM ss_mahasiswa m
JOIN ss_prodi p
USING(id_prodi)
WHERE p.nama = 'Ilmu Komputer'
UNION
SELECT d.nama, p.nama, d.nip
FROM ss_dosen d
JOIN ss_prodi p 
USING(id_prodi)
WHERE p.nama = 'Ilmu Komputer'; 

	#NOMOR 2
SELECT nama AS 'Nama', prodi AS 'Prodi', GROUP_CONCAT(STATUS ORDER BY STATUS DESC) AS 'Riwayat Status'
FROM 
	(SELECT DISTINCT d.nama, p.nama prodi, 'pembimbing utama' STATUS
	FROM ss_dosen d
	LEFT JOIN ss_prodi p 
	USING(id_prodi)
	JOIN ss_pembimbing pb
	ON pb.id_pembimbing_utama = d.id_dosen
	UNION ALL
	SELECT DISTINCT d.nama, p.nama, 'pembimbing pertama' STATUS
	FROM ss_dosen d
	LEFT JOIN ss_prodi p 
	USING(id_prodi)
	JOIN ss_pembimbing pb
	ON pb.id_pembimbing_pertama = d.id_dosen
	UNION ALL
    SELECT DISTINCT d.nama, p.nama, 'penguji 1' STATUS
	FROM ss_dosen d
	LEFT JOIN ss_prodi p 
	USING(id_prodi)
	JOIN ss_penguji pj
	ON pj.id_penguji_1 = d.id_dosen
	UNION ALL
	SELECT DISTINCT d.nama, p.nama, 'penguji 2' STATUS
	FROM ss_dosen d
	LEFT JOIN ss_prodi p 
	USING(id_prodi)
	JOIN ss_penguji pj
	ON pj.id_penguji_2 = d.id_dosen) a
	GROUP BY nama
	ORDER BY nama DESC; 
    
	#NOMOR 3	
USE classicmodels;

SELECT city, COUNT(NAME) AS 'Jumlah', GROUP_CONCAT(NAME ORDER BY NAME DESC) AS 'Ini nama na'
FROM
	(SELECT o.city, e.firstName AS NAME
	FROM offices o
	LEFT JOIN employees e
    USING(officeCode)
	WHERE e.firstName LIKE 'L%'
	UNION ALL
	SELECT city, customerName FROM customers
    WHERE customerName LIKE 'L%') s
GROUP BY city
ORDER BY COUNT(NAME) DESC;

	#SOAL TAMBAHAN NO. 5
SELECT CONCAT(firstName, " ",lastname) AS 'employee'
FROM employees
WHERE reportsTo IN
	(SELECT reportsTo
    FROM employees
    WHERE reportsTo = 1056);