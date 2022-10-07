use db_praktikum;

desc mahasiswa;
select * from mahasiswa;

-- menambahkan atribut untuk db_praktikum-- 
ALTER TABLE Mahasiswa
ADD No_telp varchar(20) NOT NULL;

ALTER TABLE Mahasiswa
ADD Alamat varchar(100);

ALTER TABLE Mahasiswa
ADD Email varchar(50) NOT NULL;

ALTER TABLE Mahasiswa
ADD Keterangan varchar(20);

-- nomor 3-- 
insert into mahasiswa (nama, nim, jk, No_telp, Alamat, Email, Keterangan)
values ('Dhiyaa Unnisa', 'H071211079', 'P', '0887435587359', 'Jl. Andi Nurdin Sanrima No80/54, Maros', 'unnisadhiyaa25@gmail.com', 'Semester 3'),
('Isra Nirwana Nur', 'H071211036', 'P', '082147121111', 'Jl. Veteran Utara', 'isranirwana2409@gmail.com', 'Semester 3'),
('Michiko Tjiang', 'H071211013', 'P', '082335368793', 'Batua Raya', 'michiko.tjiang14@gmail.com', 'Semester 3'),
('Nur Aisyah S', 'H071211054', 'P', '085256223076', 'Ramsis Unhas', 'aisyahsahar03@gmail.com', 'Semester 3'),
('Andi Raja Zulfaqar', 'H071211057', 'L', '089503906266', 'Makassar', 'raja@gmail.com', 'Semester 3'),
('Muchtar Adam', 'H071211040', 'L', '0895398304141', 'Jl. Yusuf BautiBlok c 27, Gowa', 'muchtaradam2002@gmail.com', 'Semester 3'),
('Muhammad Erwin Arif', 'H071211059', 'L', '081254498373', 'Jl. Manyampa, Desa Bontoala Kec Pallangga', ' muherwinarif31@gmail.com', 'Semester 3'),
('Jones Azarya T', 'H071211050', 'L', '085256854637', 'Makassar', 'jones@gmail.com', 'Semester 3'),
('Firmansyah', 'H071211070', 'L', '085931042162', 'Pinrang', 'frmnsyah33@gmail.com', 'Semester 3'),
('Edgar Silvanus Limba', 'H071211026', 'L', '081230004236', 'Jl. Parinring I no. 9/17 Perumnas Antang', 'edgarsilvanus12@gmail.com', 'Semester 3'),
('Muh. Shofwan Siswandi', 'H071201090', 'L', '082290507134', 'Makassar', 'EMAIL', 'Semester 5'),
('Arjuna Ribal', 'H071211032', 'L', '082187482003', 'Jl. Telkom 5, Blok C2, No. 132, Taman Telkomas', 'arjuna.ribal@gmail.com', 'Semester 3');
    
    insert into mahasiswa (nama, nim, jk, No_telp, Alamat, Email, Keterangan)
    values ('Liska Dewi', 'H071211066', 'P', '08123456789', 'Makassar', 'liska@gmail.com', 'Semester3');

-- nomor 4-- 
desc buku;
select * from buku;
insert into buku values ('Cantik Itu Luka', 2002, 'Eka Kurniawan', 1),
('Hujan', 2016, 'Tere Liye', 2),
('Laut Bercertita', 2017, 'Leila S. Chudori', 3),
('Bumi Manusia', 1980, 'Pramoedya Ananta Toer',4),
('Dilan', 1990, 'Pidi Baiq', 5);

desc pinjam;
select * from pinjam;
insert into pinjam 
values('2022-09-12 09:10:00', 1, 1, 1, 1),
('2022-09-13 10:20:00', 2, 2, 1, 2),
('2022-09-15 02:30:00', 3, 3, 1, 3),
('2022-09-20 11:18:00', 4, 4, 1, 4),
('2022-09-24 03:25:00', 5, 5, 1, 5);

-- nomor 5-- 
insert into mahasiswa (nama, nim, jk, id_mahasiswa, No_telp, Alamat, Email, Keterangan)
values ('Eka Hanny Octavia', 'H071211058', 'P', 13, ' ', 'Makassar', 'ekahanny@gmail.com', 'Semester 3'),
('WD. Ananda Lesmono', 'H071211074', 'P', 14, '082271041877', 'Makassar', 'ananda@gmail.com', NULL);

-- contoh-- 
insert into mahasiswa (nama, nim, jk, Email, Keterangan)
values ('Finka', 'H071211087', 'P', 'asas', 'Semester 3');