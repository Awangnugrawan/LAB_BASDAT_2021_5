use db_praktikum;
-- 1
create table offices(
	officeCode varchar(10) not null,
	city varchar(50) not null,
	phone varchar(50) not null,
	addressline1 varchar(50) not null,
	addressline2 varchar(50),
	state varchar(50),
	country varchar(50) not null,
	primary key (officeCode)
    );
-- 2
describe offices;
-- 3
alter table offices
modify column phone int(20) not null;
-- 4
alter table offices
drop column addressline2;
-- 5
use db_praktikum
create table buku(
judul varchar(255),
`tahun terbit` int,
pengarang varchar(255),
id_buku int auto_increment,
primary key(id_buku)
)
create table mahasiswa(
nama varchar(255),
nim varchar(10) not null unique,
jk char(1),
id_mahasiswa bigint unsigned auto_increment,
primary key(id_mahasiswa)
)
create table pinjam(
tgl_pinjam datetime,
id_mahasiswa bigint unsigned,
id_buku int,
status_pengembalian tinyint(1) default 0,
id_pinjam int unsigned,
primary key(id_pinjam),
foreign key (id_buku) references buku(id_buku),
foreign key (id_mahasiswa) references mahasiswa(id_mahasiswa));