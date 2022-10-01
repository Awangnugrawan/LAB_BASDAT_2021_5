#Jawaban No.1
-- CREATE DATABASE Praktikum1
-- USE Praktikum1
-- CREATE TABLE offices (
-- officeCode VARCHAR(10) NOT NULL,
-- city VARCHAR(50) NOT NULL,
-- phone VARCHAR(50) NOT NULL,
-- addressline1 VARCHAR(50) NOT NULL,
-- addressline2 VARCHAR(50),
-- state VARCHAR(50),
-- country VARCHAR(50) NOT NULL,
-- PRIMARY KEY(officeCode)
-- )
#Jawaban no.2
-- DESC offices
#Jawaban no.3
-- ALTER TABLE offices
-- MODIFY phone INT(20)
#Jawaban no.4
-- ALTER TABLE offices
-- DROP addressline2
#Jawaaban no.5
-- CREATE DATABASE db_praktikum;
-- USE db_praktikum;
-- CREATE TABLE `mahasiswa` (
-- 	`nama` VARCHAR(255),
--     `id_mahasiswa` BIGINT UNSIGNED AUTO_INCREMENT,
--     `nim` VARCHAR(10) NOT NULL UNIQUE,
--     `jk` CHAR(1),
-- 	PRIMARY KEY (id_mahasiswa)
-- );
-- 
-- CREATE TABLE `buku` (
-- 	`judul` VARCHAR(255),
--     `id_buku` INT AUTO_INCREMENT,
--     `pengarang` VARCHAR(255),
--     `tahun terbit` INT,
--     PRIMARY KEY (id_buku)
-- );
-- 
-- CREATE TABLE `pinjam` (
-- 	`tgl_pinjam` DATETIME,
--     `id_mahasiswa` BIGINT UNSIGNED,
--     `id_buku` INT ,
--     `status_pengembalian` TINYINT(1) DEFAULT 0,
--     `id_pinjam` INT UNSIGNED AUTO_INCREMENT,
--     PRIMARY KEY (id_pinjam),
--     FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa (id_mahasiswa),
-- 	FOREIGN KEY (id_buku) REFERENCES buku (id_buku)
-- )
