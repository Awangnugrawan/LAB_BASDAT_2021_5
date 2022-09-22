no. 1 
create table offices(
	officeCode varchar(50) not null,
    city varchar(50) not null,
    phone varchar(50) not null,
    addresline1 varchar(50) not null,
    addresline2 varchar(50),
    state varchar(50),
    country varchar(50) not null,
    primary key(officecode)
)

no.2 
describe offices

no.3
alter table offices
modify phone int(30);

no.4 
alter table offices
drop  addresline2;