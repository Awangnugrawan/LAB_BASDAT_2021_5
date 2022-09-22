create database db_praktikum
use db_praktikum 

create table buku(
	judul varchar(255),
	'tahun terbit' int(4),
    pengarang varchar(255),
    id_buku int auto_increment,
    primary key(id_buku)
)

create table mahasiswa(
	nama varchar(255),
    nim varchar(10) UNIQUE not null,
    jk char(1),
    id_mahasiswa bigint unsigned auto_increment,
    primary key(id_mahasiswa)
) 

create table pinjam(
	tgl_pinjam datetime,
    id_mahasiswa bigint unsigned not null,
    id_buku int not null,
    status_pengembalian tinyint(1) default'0',
	foreign key(id_mahasiswa) references mahasiswa(id_mahasiswa),
    foreign key (id_buku) references buku(id_buku),
    id_pinjam int unsigned,
    primary key(id_pinjam)
)