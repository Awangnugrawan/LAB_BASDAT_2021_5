USE classicmodels;

-- jawaban no 1
select * from offices where city = "San Francisco";

-- jawaban no 2
select * from orderdetails where quantityOrdered > 70 order by orderLineNumber asc;

-- jawaban no 3
select distinct productLine from products;

-- jawaban no 4
select customerNumber as `Nomor Konsumen`, customerName as `Nama Konsumen` from customers 
where customerNumber > 100 and customerNumber < 150;

-- jawaban no 5
select * from customers
where country != "USA" and creditLimit > 0
order by customerName asc
limit 10, 10;
