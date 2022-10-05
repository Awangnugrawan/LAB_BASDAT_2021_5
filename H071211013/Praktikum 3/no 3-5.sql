-- USE db_praktikum;
-- ALTER TABLE mahasiswa
-- ADD No_telp VARCHAR(20) NOT NULL, ADD Alamat VARCHAR (100), ADD Email VARCHAR (50) NOT NULL, ADD Keterangan VARCHAR (20);

-- no 3
-- INSERT INTO mahasiswa (nama,nim,jk,No_telp,Alamat,Email,Keterangan) VALUES 
-- ('Michiko Tjiang', 'H071211013', 'P', '082335368793', 'Jl Batua Raya No 49 C', 'michiko.tjiang@gmail.com', 'Semester 3'),
-- ('Edgar Silvanus Limba', 'H071211026', 'L','081230004236', 'Jl Parinring I no 9/17 Perumnas Antang', 'edgarsilvanus12@gmail.com', 'Semester 3'),
-- ('Dhiyaa Unnisa','H071211079','P','0887435587359','Jl Andi Nurdin Sanrima No 80/54, Maros','unnisadhiyaa25@gmail.com','Semester 3'),
-- ('Isra Nirwana Nur', 'H071211036', 'P','082147121111', 'Jl. Veteran Utara', 'isranirwana2409@gmail.com', 'Semester 3'),
-- ('Arjuna Ribal','H071211032','L','082187482003', 'Jl. Telkom 5, Blok C2, No. 132, Taman Telkomas','arjuna.ribal@gmail.com', 'Semester 3');
-- ('Firmansyah','H071211070','L','085931042162','Pinrang','frmnsyah33@gmail.com', 'Semester 3'),
-- ('Nur Aisyah S.','H071211054','P','085256223076','Ramsis Unhas','aisyahsahar03@gmail.com','Semester 3'),
-- ('Jones Azarya T.','H07121105','L','085256854637','Jln Pandang Raya, Kompleks Chrysant E18, Panakukkang','jonesazarya123@gmail.com','Semester 3'),
-- ('Muhammad Erwin Arif','H071211059','L','081254498373','Jl Manyampa, Desa Bontoala Kec Pallanga','muherwinarif31@gmail.com','Semester 3'),
-- ('Muchtar Adam','H071211040','L','0895398304141','Jl Yusuf Bauti Blok C/27, Gowa','muchtaradamm2002@gmail.com','Semester 3'),
-- ('Andi Raja Zulfaqar','H071211057','L','089503906266','Jl Bandang','andiraja@gmail.com','Semester 3');
-- ('ABC','H038','X','08255677','Jln Muh Yamin','xxxx','Sem');
SELECT * FROM mahasiswa;

-- no 4
-- INSERT INTO buku VALUES 
-- ('','Harry Potter and Goblet of Fire',2000,'JK Rowling'),
-- ('','Supernova: Kesatria, Putri & Bintang Jatuh',2001,'Dee Lestari'),
-- ('','Berani Tidak Disukai',2019,'Ichiro Kishimi & Fumitake Koga'),
-- ('','Filosofi Teras',2018,'Henry Manampiring'),
-- ('','Percy Jackson & The Olympians : The Lightning Thief',2005,'Rick Riordan');
-- (99, 'Antologi Rasa', 2018,'XXXX');
SELECT * FROM buku;

-- INSERT INTO pinjam VALUES
-- ('','2022-09-27 12:56:03',5,3,1),
-- ('','2022-09-28 10:10:12',4,5,''),
-- ('','2022-09-28 15:10:11',3,1,1),
-- ('','2022-09-29 11:58:50',2,4,1),
-- ('','2022-09-30 14:49:15',1,2,'');
SELECT * FROM pinjam;

-- no 5
-- INSERT INTO mahasiswa (nama,nim,jk,No_telp,Email,Keterangan) VALUE 
-- ('','Muh Hudri Perdana Hutba','','L','085156428526','Jl Teuku Umar','muhhudri18@gmail.com','Semester 3'),
-- ('','Fathur Rachman Alamsyah','H071211041','L','082347864893', NULL,'sembarangf135@gamil.com','Semester 3'); 
-- ('Kev','H071211090','L','083256789','56@gmail.com','Semester 7');
-- SELECT * FROM mahasiswa;
-- DESC mahasiswa;

