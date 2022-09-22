-- use db_praktikum
-- create table buku(
-- judul varchar(255),
-- tahun_terbit int,
-- pengarang varchar(255),
-- id_buku int auto_increment,
-- primary key(id_buku)
-- )
-- select tahun_terbit as 'tahun terbit' from buku;

-- create table mahasiswa(
-- nama varchar(255),
-- nim varchar(10),
-- jk char(1),
-- id_mahasiswa bigint unsigned auto_increment,
-- primary key(id_mahasiswa)
-- )

-- create table pinjam(
-- tgl_pinjam datetime,
-- id_mahasiswa bigint unsigned,
-- id_buku int,
-- status_pengembalian tinyint(1),
-- id_pinjam int unsigned,
-- primary key(id_pinjam)
-- );
-- describe buku
alter table pinjam 
modify column id_pinjam int unsigned auto_increment;