#Jawaban no.1
#USE classicmodels
-- INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, 
-- officeCode, reportsTo, jobTitle ) VALUE 
-- (2002,'Siswandi','Muh.Shofwan','x2022','shofwan@gmail.com',1,1002,'Directur'),
-- (2003,'Uzumaki','Naruto','x2000','naruto@gmail.com',1,1002,'Manager'),
-- (1998,'Son','Goku','x1999','goku@gmail.com',6,1056,'Body Guard');
#SELECT* FROM offices
#Jawaban no.2
-- INSERT INTO offices (officeCode,city,phone,addressLine1,addressLine2,state,country,postalCode,territory)
-- VALUE ('8','Sudiang','+62','99jakarta','bekasi',NULL,'INA','9182','JK');
-- UPDATE employees
-- SET officeCode = '8'
-- WHERE (jobTitle = 'Sales Rep'and officeCode = '4');
SELECT* FROM employees WHERE jobtitle ='Sales Rep'



