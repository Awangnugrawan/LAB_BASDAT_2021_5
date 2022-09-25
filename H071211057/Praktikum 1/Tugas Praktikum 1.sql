create database praktikum;
use praktikum;

create table office(
	officeCode varchar(10) not null,
	city varchar(50) not null,
	phone varchar(50) not null,
	addressline1 varchar(50) not null,
	addressline2 varchar(50),
	state varchar(50),
	country varchar(50) not null,
	primary key (officeCode)
);

-- No 2 
desc office;

-- No 3
-- ALTER TABLE office modify phone int(20)

-- No 4
-- ALTER TABLE office DROP addressline2
