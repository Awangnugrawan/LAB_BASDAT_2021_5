create database theworld;
use theworld;

create table office(
	officecode varchar (10) not null,
    city varchar (50) not null,
    phone varchar (50) not null,
    addressline1 varchar (50) not null,
    addressline2 varchar (50) not null,
    state varchar (50) not null,
    country varchar (50) not null,
    primary key (officecode)
);

-- No. 2 
describe office

-- No. 3
-- ALTER TABLE office modify phone int(20)

-- No. 4
-- ALTER TABLE office DROP addressline2;