use classicmodels;

-- desc employees;
select * from employees;
select * from employees where jobTitle='Sales Rep';

-- nomor 1-- 
insert into employees(`employeeNumber`, `lastName`, `firstName`, `extension`, `email`, `officeCode`, `reportsTo`, `jobTitle`)
values (1012, 'Unnisa', 'Dhiyaa', 'x6000', 'dhiyaa@classicmodels.com', '2', 1056, 'Sales Rep'),
(1614, 'Jasmine', 'Danella', 'x103', 'ella@classicmodels.com', '3', 1002, 'Sales Rep'),
(1502, 'Sitti', 'Shireen', 'x2341', 'shireen@classicmodels.com', '4', 1143, 'Sales Rep');

-- nomor 2-- 
desc offices;
Select *from offices;
insert into offices VALUES (8, 'Makassar', '08812345678', 'Maros', NULL, 'IND', 'Indonesia', '23457', 'MNK');
update employees
set officeCode = '8'
where officeCode = '4' AND jobTitle = 'Sales Rep';
