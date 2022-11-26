SELECT firstname,lastname
FROM employees
WHERE reportsTo IN(
SELECT employeeNumber FROM employees
WHERE firstName = "Mary" AND lastname = "Patterson")