USE classicmodels;

-- nomor 1
insert into employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
values (1059, "Arif", "M. Erwin", 'x1059', "erwin@mail.com", 5, 1002, "VP Tech"),
(1045, 'Pujaz', "Sofgan", 'x1069', "sofgan@mail.com", 5, 1059, "Sales Rep"),
(1064, 'Ardhiyanda', "Ardhi", 'x1072', "ardh@mail.com", 5, 1059, "Sales Rep");

SELECT * FROM employees;

-- nomor 2
insert into offices 
values (8, "Gowa", "+62 1234 123", "1-A Andi Mallombassang", NULL, "South Sulawesi", "Indonesia", "92111", "APAC");

UPDATE employees
SET officeCode = 8
WHERE officeCode = 4 AND jobTitle = "Sales Rep";

SELECT * FROM offices;
SELECT * FROM employees;