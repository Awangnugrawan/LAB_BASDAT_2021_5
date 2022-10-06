SELECT * FROM employees
WHERE jobTitle = 'Sales Rep'

-- # Nomor 1.
-- # menambahkan 3 orang employee baru pada tabel employees, 
-- # salah satu nama employee merupakan nama anda
-- INSERT INTO employees (`employeeNumber`, `lastName`, `firstName`, `extension`, `email`, `officeCode`, `reportsTo`, `jobTitle`)
-- VALUES
-- 	(1024, 'Kalau', 'Rara', 'x1001', 'rara@classicmodelcars.com', '6', 1056, 'Sales Rep'),
-- 	(1512, 'Cang', 'Puput', 'x102', 'putcang@classicmodelcars.com', '7', 1102, 'Sales Rep'),
-- 	(1207, 'Basudara', 'Windah', 'x207', 'windah@classicmodelcars.com', '5', 1621, 'Sales Rep');

-- # Nomor 2.
-- # membuat query untuk memindahkan karyawan berjabatan Sales rep
-- # dari kantor 4, ke kantor yang baru
-- INSERT INTO offices
-- VALUES ('8', 'Makassar', '+6282147121111', 'Veteran Utara', NULL, 'South Sulawesi', 'Indonesia', '90141', 'IDN');

-- UPDATE employees
-- SET `officeCode` = '8'
-- WHERE `officeCode` = '4' AND `jobTitle` = 'Sales Rep';