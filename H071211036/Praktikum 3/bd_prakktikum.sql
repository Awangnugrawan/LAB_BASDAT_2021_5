-- SELECT * FROM mahasiswa

-- ALTER TABLE mahasiswa
-- ADD no_telp VARCHAR(20) NOT NULL

-- ALTER TABLE mahasiswa
-- ADD alamat VARCHAR(100)

-- ALTER TABLE mahasiswa
-- ADD email VARCHAR(50) NOT NULL

-- ALTER TABLE mahasiswa
-- ADD keterangan VARCHAR(20)

# Jawaban no. 3
-- INSERT INTO mahasiswa (nama, nim, jk, id_mahasiswa, no_telp, alamat, email, keterangan)
-- VALUES
-- 	('Isra Nirwana Nur', 'H071211036', 'P', '1', '082147121111', 'Jl. Veteran Utara', 'isranirwana2409@gmail.com', 'Semester 3'),
-- 	('Dhiyaa Unnisa', 'H071211079', 'P', '2', '0887435587359', 'Jl. Andi Nurdin Sanrima No. 80/54, Maros', 'unnisadhiyaa25@gmail.com', 'Semester 3'),
-- 	('Michiko Tjiang', 'H071211013', 'P', '3', '082335368793', 'Jl. Batua Raya', 'michiko.tjiang14@gmail.com', 'Semester 3'),
-- 	('Nur Aisyah S', 'H071211054', 'P', '4', '085256223076', 'Ramsis Unhas', 'aisyahsahar03@gmail.com', 'Semester 3'),
-- 	('Andi Raja Zulfaqar', 'H071211057', 'L', '5', '089503906266', 'Makassar', 'andirajaz@gmail.com', 'Semester 3'),
-- 	('Muchtar Adam', 'H071211040', 'L', '6', '0895398304141', 'Jl. Yusuf Bauti Blok C 27 Gowa', 'muchtaradam2002@gmail.com', 'Semester 3'),
-- 	('Muhammad Erwin Arif', 'H071211059', 'L', '7', '081254498373', 'Makassar', 'muherwin@gmail.com', 'Semester 3'),
-- 	('Jones Azarya T', 'H071211050', 'L', '8', '085256854637', 'Makassar', 'jonesazarya@gmail.com', 'Semester 3'),
-- 	('Firmansyah', 'H071211070', 'L', '9', '085931042162', 'Pinrang', 'frmnsyah33@gmail.com', 'Semester 3'),
-- 	('Edgar Silvanus Limba', 'H071211026', 'L', '10', '081230004236', 'Makassar', 'edgarsilvanus@gmail.com', 'Semester 3'),
-- 	('Muh. Shofwan Siswandi', 'H071201090', 'L', '11', '082290507134', 'Makassar', 'muhsofwan@gmail.com', 'Semester 5'),
-- 	('Arjuna Ribal', 'H071211032', 'L', '12', '082187482003', 'Jl. Telkom 5, Blok C2, No. 132, Taman Telkomas', 'arjuna.ribal@gmail.com', 'Semester 3');

-- UPDATE mahasiswa
-- SET alamat = 'Jl. Parinring I no. 9/17 Perumnas Antang'
-- WHERE id_mahasiswa = 10;
-- UPDATE mahasiswa
-- SET email = 'edgarsilvanus12@gmail.com'
-- WHERE id_mahasiswa = 10;
-- UPDATE mahasiswa
-- SET alamat = 'Jl. Manyampa, Desa Bontoala Kec Pallangga', email = 'muherwinarif31@gmail.com'
-- WHERE id_mahasiswa = 7;

# Jawaban no. 4
-- SELECT * FROM buku

-- INSERT INTO buku
-- VALUES
-- 	('It Ends with Us', 2016, 'Colleen Hoover', 1),
--     ('Laut Bercerita', 2017, 'Leila Salikha Chudori', 2),
--     ('The Summer I Turned Pretty', 2009, 'Jenny Han', 3),
--     ('Prince Caspian', 1951, 'C. S. Lewis', 4),
--     ('Harry Potter and the Order of the Phoenix', 2003, 'J. K. Rowling', 5);

-- SELECT * FROM pinjam
-- INSERT INTO pinjam
-- VALUES
-- 	('2022-09-24 09:37:00', 1, 1, 1, 1),
--     ('2022-09-27 12:49:44', 2, 3, 1, 2),
--     ('2022-09-29 14:08:09', 6, 4, 1, 3),
--     ('2022-09-30 08:08:30', 3, 5, 1, 4),
--     ('2022-10-01 16:09:40', 4, 2, 0, 5);


# Jawaban No. 5
-- SELECT * FROM mahasiswa
-- INSERT INTO mahasiswa (nama, nim, jk, id_mahasiswa, no_telp, alamat, email, keterangan)
-- VALUES
-- 	('Putri Aulia Nur Salsabila', 'H071211046', 'P', '13', '082190632664', NULL, 'ptrslsbl15@gmail.com', 'Semester 3');

-- INSERT INTO mahasiswa (nama, nim, jk, id_mahasiswa, no_telp, alamat, email, keterangan)
-- VALUES
-- 	('Indah Kurnia Ilahi', 'H071211001', 'P', '14', '082193119187', 'Jl. Sejati', 'indahkurnia07@gmail.com', 'Semester 3');

-- INSERT INTO mahasiswa (nama, nim, jk, id_mahasiswa, no_telp, email, keterangan)
-- VALUES
-- 	('Muhammad Khaibar Akbar', 'H071211020', 'L', '15', '082193121763', 'khaibarakbar@gmail.com', 'Semester 3');
    
-- INSERT INTO mahasiswa (nama, nim, jk, id_mahasiswa, no_telp, alamat, email, keterangan)
-- VALUES
-- 	('Fadhilah', 'H071211023', 'P', '16', '085242354032', ' ', 'fadhilah@gmail.com', 'Semester 3');

-- INSERT INTO mahasiswa (nama, nim, jk, no_telp, alamat, email, keterangan)
-- VALUES ('Abcd', 'H071211081', 'P', '0812345678', 'Jl. Sahabat', 'abcd@gmail.com', 'Semester 3');

-- INSERT INTO mahasiswa (nama, nim, jk, no_telp, alamat, email, keterangan)
-- VALUES
-- 	('Fad', 'H071211037', 'L', ' ', 'Jl. Sahabat', 'fadhilah@gmail.com', 'Semester 3');

-- DESC mahasiswa

-- INSERT INTO mahasiswa (nama, nim, jk, no_telp, email, keterangan)
-- VALUES
-- 	('Putri', 'H071211090', 'P', '082190632664', 'ptrslsbl15@gmail.com', 'Semester 3');