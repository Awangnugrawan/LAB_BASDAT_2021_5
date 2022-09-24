
-- (Jawaban Nomor 1)
CREATE TABLE offices (
officeCode VARCHAR(10) NOT NULL,
city VARCHAR(50) NOT NULL,
phone VARCHAR(50) NOT NULL,
addressline1 VARCHAR(50) NOT NULL,
addressline2 VARCHAR(50),
state VARCHAR(50),
country VARCHAR(50) NOT NULL,
PRIMARY KEY (officeCode)
) ;

-- (Jawaban nomor 2)
DESCRIBE offices;

-- (Jawaban nomor 3)
ALTER TABLE offices
MODIFY column phone INT (20);

-- (Jawaban nomor 4)
ALTER TABLE offices
DROP addressline2;



