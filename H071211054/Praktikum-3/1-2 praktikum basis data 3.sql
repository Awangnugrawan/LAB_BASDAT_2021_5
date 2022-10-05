use classicmodels;

DESC employees;
select * from employees;
-- nomor 1
INSERT INTO employees
VALUES ('1032', 'Aisyah', 'Nur', 'x1000','aisyahsah@gmail.com', '1', '1002', 'Sales Rep'),
('1033', 'Caca', 'Nurul', 'x1001', 'caca03@gmail.com', '2', '1002', 'Sales Rep'),
(1034, 'Fikri', 'Sandi', 'x1002', 'sandi03@gmail.com', '3', '1002', 'Sales Rep');
select * from employees where jobTitle = "Sales Rep" and officeCode = "4";


-- nomor 2
desc offices;
select * from offices;
insert into offices (officeCode, city, phone, addressLine1, addressLine2, state, country, postalCode, territory)
values ('8', 'Paris', '+3 133 123 1234', '20 lambara', '20 harapan', null, 'France', '12345', 'EMEA');
update employees
set officeCode = '8'
where officeCode = '4' and jobTitle = 'Sales Rep';
select * from offices;
