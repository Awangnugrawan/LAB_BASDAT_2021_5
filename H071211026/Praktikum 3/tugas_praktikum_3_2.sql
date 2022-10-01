USE db_praktikum;

ALTER TABLE mahasiswa 
ADD No_telp VARCHAR (20) NOT NULL, 
ADD Alamat VARCHAR (100),
ADD Email VARCHAR (50) NOT NULL,
ADD Keterangan VARCHAR (20);


#jawaban no 3
INSERT INTO mahasiswa (nama, nim, jk, id_mahasiswa, NO_telp, Alamat, Email, Keterangan)
VALUES ('Edgar Silvanus Limba', 'H071211026', 'L', '', '081230004236', 'Jl. Parinring I no. 9/17 Perumnas Antang', 'edgarsilvanuslimba@gmail.com', 'semester 3'),
		 ('Firmansyah', 'H071211070', 'L', '', '+62', 'samping rumah tetangganya', 'firmansyah@gmail.com', 'semester 3'),
		 ('Isra Nirwana', 'H071211036', 'P', '', '+62', 'samping rumah tetangganya', 'isra@gmail.com', 'semester 3'),
		 ('Dhiyaa Unnisa', 'H071211079', 'P', '', '+62', 'samping rumah tetangganya', 'dhiyaa@gmail.com', 'semester 3'),
		 ('Michiko Tjiang', 'H071211013', 'P', '', '+62', 'samping rumah tetangganya', 'michiko@gmail.com', 'semester 3'),
		 ('Nur Aisyah S', 'H071211054', 'P', '', '+62', 'samping rumah tetangganya', 'aisyah@gmail.com', 'semester 3'),
		 ('Andi Raja Zulfaqar', 'H071211057', 'L', '', '+62', 'samping rumah tetangganya', 'raja@gmail.com', 'semester 3'),
		 (' Muchtar Adam', 'H071211040', 'L', '', '+62', 'samping rumah tetangganya', 'muchtar@gmail.com', 'semester 3'),
		 ('Muhammad Erwin Arif', 'H071211059', 'L', '', '+62', 'samping rumah tetangganya', 'erwin@gmail.com', 'semester 3'),
		 ('Jones Azarya Tomassoyan', 'H071211050', 'L', '', '+62', 'samping rumah tetangganya', 'jones@gmail.com', 'semester 3'),
		 ('Arjuna Ribal', 'H071211032', 'L', '', '+62', 'samping rumah tetangganya', 'arjunah@gmail.com', 'semester 3'),
		 ('Muh.Shofwan Siswandi', 'H071201090', 'L', '', '+62', 'samping rumah tetangganya', 'shofwan@gmail.com', 'semester 5');



#jawaaban no 4
INSERT INTO buku 
VALUES ('buku 1', '2001', 'anak pertama', ''),
		 ('buku 2', '2002', 'anak kedua', ''),
		 ('buku 3', '2003', 'anak ketiga', ''),
		 ('buku 4', '2004', 'anak keempat', ''),
		 ('buku 5', '2005', 'anak kelima', '');

INSERT INTO pinjam
VALUES ('2022-09-30 00:00:00', '1', '1', '1', ''),
		 ('2022-09-30 00:00:00', '2', '2', '1', ''),
		 ('2022-09-30 00:00:00', '3', '3', '1', ''),
		 ('2022-09-30 00:00:00', '4', '4', '1', ''),
		 ('2022-09-30 00:00:00', '5', '5', '1', '');


#jawaban no 5
INSERT INTO mahasiswa
VALUE ('aku ada blank', '1', 'L', '', '', 'dekat rumah tetangganya', 'blank@gmail.com', 'semester 14');

INSERT INTO mahasiswa (nama, nim, jk, id_mahasiswa, NO_telp, Alamat, Email, Keterangan) 
VALUE ('aku ada null', '2', 'P', '', '+62', 'dekat rumah tetangganya', 'blank@gmail.com');