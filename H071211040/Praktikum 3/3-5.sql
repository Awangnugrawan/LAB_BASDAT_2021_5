-- no3
use db_praktikum;
select * from mahasiswa;
alter table mahasiswa add No_telp varchar(20) not null;
alter table mahasiswa add Alamat varchar(100);
alter table mahasiswa add Email varchar(50) not null;
alter table mahasiswa add Keterangan varchar(20);
desc mahasiswa;
delete from mahasiswa;


insert into mahasiswa (nama, nim, jk,id_mahasiswa ,No_telp, Alamat, Email, Keterangan)
values
	  ('Muchtar Adam', 				'H071211040', 'L',0,'0895398304141', 'Jl.Yusuf Bauti blok c.27 Gowa', 						'muchtaradam2002@gmail.com', 'semester 3'),
	  ('Nur Aisyah S', 				'H071211054', 'P',1, '085256223076', 'Ramsis Unhas',											'aisyahsahar03@gmail.com', 'semester 3'),
	  ('Firmansyah', 				'H071211070', 'L',2, '085931042162', 'Pinrang', 												'frmnsyah33@gmail.com', 'semester 3'),
	  ('Isra Nirwana Nur N. Kalau', 'H071211036', 'P',3, '089503906266', 'Jl. Tarakan', 											'andiraja954@gmail.com', 'semester 3'),
	  ('Dhiyaa Unnisa', 			'H071211079', 'P',4, '0887435587359', 'Jl. Andi Nurdin Sanrima No. 80/54, Maros', 			'unnisadhiyaa25@gmail.com', 'semester 3'),
	  ('Michiko Tjiang', 			'H071211013', 'P',5, '082335368793', 'Jln Batua Raya',										'michiko.tjiang14@gmail.com', 'semester 3'),
	  ('Arjuna Ribal', 				'H071211032', 'L',6, '082187482003', 'Jl. Telkom 5, No.132, Telkomas', 						'arjuna.ribal@gmail.com', 'semester 3'),
	  ('Muhammad Erwin Arif', 		'H071211059', 'L',7, '081254498373', 'Jl. Manyampa, Desa Bontoala Kec Pallangga',			    'muherwinarif31@gmail.com', 'semester 3'),
	  ('Jones Azarya T',			'H071211050', 'L',8, '085256854637', 'Jln.Pandang Raya, Kompleks Chrysant E18, Panakukkang',  'jonesazarya123@gmail.com', 'semester 3'),
	  ('Edgar Silvanus Limba', 		'H071211026', 'L',9, '081230004236', 'Jl. Parinring I no. 9/17 Perumnas Antang', 				'edgarsilvanus12@gmail.con', 'semester 3'),
	  ('Andi Raja Zulfaqar', 		'H071211057', 'L',10, '081223798112', 'Jl,jalan bloc a', 										'AndiRaja@gmail.com', 'semester 3'),
	  ('Muh.Shofwan Siswandi', 		'H071201090', 'L',11, '082290507134', 'Jl,jalan blok b', 										'ShofwanSiswandi@gmail.com', 'semester 5');


-- no4
delete from buku;
use db_praktikum;
select * from buku;
insert into buku
value('buku1', '2000', 'pengarang1', 1),
	 ('buku2', '201', 'pengarang2', 2),
     ('buku3', '203', 'pengarang3', 3),
     ('buku4', '204', 'pengarang4', 4),
     ('buku5', '205', 'pengarang4', 5);

delete from pinjam;
select * from pinjam;
desc pinjam;
insert into pinjam
value
     ('2022-10-7 02:17:15', 3, 3, null, 2),
     ('2022-10-4 02:14:12', 1, 5, null, 1),
	 ('2022-10-5 02:15:13', 2, 5, null, 3),
	 ('2022-10-6 02:16:14', 3, 2, null, 5),
     ('2022-10-8 02:18:16', 4, 4, null, 4);

-- no5
use db_praktikum;
desc mahasiswa;
select * from mahasiswa;

insert into mahasiswa(nama, nim, jk,id_mahasiswa,No_telp, Alamat, Email, Keterangan)
value('dataBaru1', 'H071211001', 'L', 12,'+62xxx', '', 'test13@gmail.com', 'keterangan13'),
	 ('dataBaru2', 'H071211002', 'P',13, '+62xxx', 'jl.xxxx', 'test13@gmail.com',null);

insert into mahasiswa(nama, nim, jk,id_mahasiswa,No_telp, Email, Keterangan)
value('dataBaru3', 'H071211003', 'L', 14,'+62xxx', 'test134@gmail.com', 'keterangan13');
