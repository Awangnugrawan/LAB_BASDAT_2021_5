USE classicmodels;

#jawaban no 1
INSERT INTO employees 
VALUES (1, 'Silvanus', 'Edgar', 'x1234', '@', 1, 1002, 'Chief Executive Officer'),
		 (2, 'Pujas', 'Sofyan', 'x2345', '@',  1, 1002, 'Chief Executive Officer'),
		 (3, 'Mustamin', 'Mukram', 'x3456', '@',  1, 1002, 'Chief Executive Officer');

#jawaban no 2
INSERT INTO offices VALUE (10, 'Makassar', '081234567890', 'Universitas Hasanuddin', 'FMIPA', 'Sulawesi Selatan', 'Indonesia', '90123', 'SEA');
UPDATE employees SET officeCode = 10 WHERE officeCode = 4 AND jobTitle = 'sales rep';