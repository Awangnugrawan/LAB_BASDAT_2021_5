Create table buku(
id_buku int(255) auto_increment,
judul varchar(255) not null,
`tahun terbit` int(10) not null,
pengarang varchar(255) not null,
primary key (id_buku)
);

desc buku;


Create table mahasiswa(
id_mahasiswa bigint(255) unsigned auto_increment,
nama varchar(255)not null,
nim varchar(10)not null unique,
jk char(1) not null,
primary key (id_mahasiswa)
);


create table pinjam (
id_pinjam int(255) unsigned not null auto_increment,
tgl_pinjam datetime,
status_pengembalian tinyint(1) default'0',
id_buku int(255),
foreign key (id_buku) references buku (id_buku),
id_mahasiswa bigint(255) unsigned,
foreign key (id_mahasiswa) references mahasiswa (id_mahasiswa),
primary key (id_pinjam)
);