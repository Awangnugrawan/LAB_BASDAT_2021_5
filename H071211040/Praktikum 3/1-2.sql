-- no1
use classicmodels;
desc employees;
select * from employees;
insert into employees
value(1234, 'Adam', 'Muchtar', 'x1234', 'test123@gmail.com', 2, 1143, 'Sales Rep'),
	 (3412, 'Fikri', 'Nur', 'x3412', 'test312@gmail.com', 4, 1088, 'Sales Rep'),
	 (2341, 'Fikra', 'Muhammad', 'x2341', 'test231@gmail.com', 3, 1102, 'Sales Rep');
     

-- no2
use classicmodels;
select * from offices;
select * from employees where jobTitle = 'Sales Rep';
insert into offices
value(8, 'Gowa', '0895398304141', 'Yusuf Bauti', null, 'INA','Indonesia','93211', 'MNK' );
update employees set officeCode = 8 where jobTitle = 'Sales Rep' and officeCode = 4;