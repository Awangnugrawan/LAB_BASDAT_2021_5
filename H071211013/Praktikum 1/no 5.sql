-- CREATE DATABASE db_praktikum;
-- USE db_praktikum;

CREATE TABLE buku (
	id_buku INT AUTO_INCREMENT PRIMARY KEY,
	judul VARCHAR(255),
	`tahun terbit` INT,
	pengarang VARCHAR(255)
);

CREATE TABLE mahasiswa (
	id_mahasiswa BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nama VARCHAR (255),
	nim VARCHAR (10) NOT NULL UNIQUE,
	jk CHAR (1)
);

CREATE TABLE pinjam (
	id_pinjam INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	tgl_pinjam DATETIME,
	id_mahasiswa BIGINT UNSIGNED,
	id_buku INT,
	status_pengembalian TINYINT(1) DEFAULT 0,
	FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa (id_mahasiswa),
	FOREIGN KEY (id_buku) REFERENCES buku (id_buku)
);