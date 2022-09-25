SHOW DATABASES;

CREATE DATABASE KANTOR;

USE KANTOR;
-- jawaban nomor 1-- 
CREATE TABLE offices (
officeCode VARCHAR(10) NOT NULL,
city VARCHAR(50) NOT NULL,
phone VARCHAR(50) NOT NULL,
addressline1 VARCHAR(50) NOT NULL,
addressline2 VARCHAR(50),
state VARCHAR(50) NOT NULL,
country VARCHAR(50) NOT NULL,
primary key(officeCode)
);
-- nomor 2-- 
DESCRIBE OFFICES;
-- nomor 3-- 
ALTER TABLE offices MODIFY phone int(20);
-- nomor 4-- 
ALTER TABLE offices DROP COLUMN addressline2;
