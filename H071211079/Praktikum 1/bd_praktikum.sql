SHOW DATABASES;

CREATE DATABASE db_praktikum;

USE db_praktikum;

CREATE TABLE buku (
judul VARCHAR(255) not null,
`tahun terbit` int,
pengarang VARCHAR(255) not null,
id_buku int auto_increment,
primary key(id_buku)
);

desc buku;

CREATE TABLE mahasiswa (
nama VARCHAR(255) not null,
nim VARCHAR(10) not null unique,
jk CHAR(1) not null,
id_mahasiswa bigint unsigned auto_increment,
primary key(id_mahasiswa)
);

CREATE TABLE pinjam (
tgl_pinjam datetime,
id_mahasiswa bigint unsigned,
id_buku int,
status_pengembalian tinyint(1) default'0',
id_pinjam int unsigned auto_increment,
primary key(id_pinjam),

foreign key (id_mahasiswa) references mahasiswa (id_mahasiswa),
foreign key (id_buku) references buku (id_buku)
);


