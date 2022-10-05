use db_praktikum;
select * from mahasiswa;
desc mahasiswa;
-- nomor 3
alter table mahasiswa
add column No_telp varchar(20) not null,
add column Alamat varchar(100),
add column Email varchar(50) not null,
add column Keterangan varchar(20) not null;

insert into mahasiswa (nama, nim, jk, No_telp, Alamat, Email, Keterangan)
values
('Nur Aisyah S', 'H071211054', 'F', '085256223076', 'Luwu Timur', 'aisyahsahar03@gmail.com', 'mahasiswa'),
('Dhiyaa Unnisa', 'H071211079', 'F', '085256223071', 'Maros', 'dhiya22@gmail.com', 'mahasiswa'),
('Michiko', 'H071211013', 'F', '085256223072', 'Makassar', 'chiko2gmail.com', 'mahasiswa'),
('Arjuna', 'H071211032', 'M', '085256223073', 'Maros', 'arjuna@gmail.com', 'mahasiswa'),
('Erwin', 'H071211059', 'M', '085256223074', 'Makassar', 'erwin@gmail.com', 'mahasiswa'),
('Edgar', 'H071211026', 'M', '085256223075', 'Maros', 'edgar@gmail.com', 'mahasiswa'),
('Isra', 'H071211036', 'F', '085256223060', 'Maros', 'isra@gmail.com', 'mahasiswa'),
('Jones', 'H071211050', 'M', '085256223050', 'Maros', 'jones@gmail.com', 'mahasiswa'),
('Firman', 'H071211070', 'M', '085256223051', 'Pinrang', 'firman@gmail.com', 'mahasiswa'),
('Adam', 'H071211040', 'M', '085256223053', 'Makassar', 'adamm@gmail.com', 'mahasiswa'),
('Shofwan', 'H071201090', 'M', '085256223090', 'Makassar', 'shofwan@gmail.com', 'mahasiswa'),
('Raja', 'H071211001', 'M', '085256223057', 'Makassar', 'raja@gmail.com', 'mahasiswa');
select * from mahasiswa;

-- nomor 4
insert into buku
values ('1', 'saya', '2010', 'aisyah'),
('2', 'aku', '2011', 'nur'),
('3', 'hujan', '2013', 'caca'),
('4', 'angin', '2013', 'afika'),
('5', 'badai', '2015', 'anisa');
select * from buku;

insert into pinjam
values 
('1', '2020-08-10 11:10:09', null, '2', '1'),
('2', '2020-09-10 11:10:09', null, '2', '1'),
('3', '2020-10-10 11:10:09', null, '1', '1'),
('4', '2021-08-10 11:10:09', null, '3', '1'),
('5', '2021-04-10 11:10:09', null, '4', '1'),
('6', '2020-10-12 10:10:12', '1', '2', '3'),
('7', '2019-11-12 10:09:08', '0', '1', '3');
select * from pinjam;

-- nomor 5
-- kolom yang blank
insert into mahasiswa (nama, nim, jk, No_telp, Alamat, Email, Keterangan)
values ('30', 'Anisa', 'H071211080', '', '085256223000', 'Luwu Timur', 'anisa03@gmail.com', 'mahasiswa'),
('31', 'afifa', 'H071211004', 'F', '082256223070', '', 'afifa2@gmail.com', 'mahasiswa');

-- kolom yang null
insert into mahasiswa (nama, nim, jk, No_telp, Email, Keterangan)
values ('Citra', 'H071211002', 'F', '085256223001', 'citra03@gmail.com', 'mahasiswa');
select * from mahasiswa;
desc mahasiswa;

