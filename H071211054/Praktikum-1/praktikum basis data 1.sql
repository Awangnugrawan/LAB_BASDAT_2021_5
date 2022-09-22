-- jawaban no 1
CREATE TABLE offices (
	officeCode varchar(10) NOT NULL PRIMARY KEY,
    city varchar(50) NOT NULL,
    phone varchar(50) NOT NULL,
    addressline1 varchar(50) NOT NULL,
    addressline2 varchar(50),
    state varchar(50),
    country varchar(50) NOT NULL
);
-- jawaban no 2
DESC offices;
-- jawaban no 3
ALTER TABLE offices MODIFY COLUMN phone int(20);
-- jawaban no 4
ALTER TABLE offices DROP COLUMN addressline2;