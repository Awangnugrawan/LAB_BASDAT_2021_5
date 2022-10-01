USE db_praktikum;

ALTER TABLE mahasiswa
ADD no_telp VARCHAR(20) NOT NULL,
ADD alamat VARCHAR(100), 
ADD email VARCHAR(50) NOT NULL, 
ADD keterangan VARCHAR(20);

-- Nomor 3
INSERT INTO mahasiswa (nama, nim ,jk, no_telp, alamat, email, keterangan)
VALUES
('Muhammad Erwin Arif', 'H071211059', 'L', '081212341234', 'Jl. Jalan No 1', 'erwin@maill.com', 'Semester 3'),
('Michiko Tjiang', 'H071211013', 'P', '081212341235', 'Jl. Jalan No 2', 'michiko@maill.com', 'Semester 3'),
('Arjuna Ribal', 'H071211032', 'L', '081212341236', 'Jl. Jalan No 3', 'arjuna@maill.com', 'Semester 3'),
('Dhiyaa Unnisa', 'H071211079', 'P', '081212341237', 'Jl. Jalan No 4', 'dhiyaa@maill.com', 'Semester 3'),
('Firmansyah', 'H071211070', 'L', '081212341238', 'Jl. Jalan No 5', 'firman@maill.com', 'Semester 3'),
('Edgar Silvanus Limba', 'H071211026', 'L', '081212341239', 'Jl. Jalan No 6', 'edgar@maill.com', 'Semester 3'),
('Muchtar Adam Al-Hamid', 'H071211040', 'L', '081212341230', 'Jl. Jalan No 7', 'adam@maill.com', 'Semester 3'),
('Isra Nirwana N Kalau', 'H071211036', 'P', '081212341231', 'Jl. Jalan No 8', 'isra@maill.com', 'Semester 3'),
('Andi Raja Zulfaqar', 'H071211057', 'L', '081212341232', 'Jl. Jalan No 9', 'raja@maill.com', 'Semester 3'),
('Muh. Shofwan Siswandi', 'H071201090', 'L', '081212341233', 'Jl. Jalan No 10', 'sofwan@maill.com', 'Semester 3'),
('Jones Azarya Tomassoyan', 'H071211050', 'L', '081212341245', 'Jl. Jalan No 11', 'jones@maill.com', 'Semester 3'),
('Nur Aisyah S', 'H071211054', 'P', '081212341246', 'Jl. Jalan No 12', 'aisyah@maill.com', 'Semester 3');
SELECT * FROM mahasiswa;

-- Nomor 4
INSERT INTO buku 
VALUES ("To Kill A Mockingbird", 1960, "Harper Lee", '')
("One Hundred Years of Solitude", 1967, "Gabriel García Márquez", ''),
("The Feynman Lectures on Physics", 1963, "Richard Feynman", ''),
("A Brief History of Time", 1988, "Stephen Hawking", ''),
("One Piece", 1997, "Eiichiro Oda", '');

SELECT * FROM buku;

INSERT INTO pinjam 
VALUES ('2022-10-11 15:32:06', 2, 3, 0, ''),
('2022-10-11 15:32:06', 3, 1, 0, ''),
('2022-10-11 15:32:06', 4, 5, 0, ''),
('2022-10-11 15:32:06', 5, 2, 0, ''),
('2022-10-11 15:32:06', 6, 4, 0, '');

SELECT * FROM pinjam;

-- nomor 5
INSERT INTO mahasiswa (nama, nim, jk, alamat, email, keterangan)
VALUES ("Budi", "H071211099","L", "Jl. Jalan 99", "agung@mail.com", "Semester 3");

INSERT INTO mahasiswa (nama, nim, no_telp, alamat, email, keterangan)
VALUES ("Andi", "H071211198", "+621235352511", "Jl. Jalan 98", "sofyan@mail.com", "Semester 3");
SELECT * FROM mahasiswa;




