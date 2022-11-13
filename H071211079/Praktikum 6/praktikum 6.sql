# nomor 1
select c.customerName as `Nama Pelanggan`, sum(p.amount) as `Total Belanja`, c.creditLimit as `Batas Kredit`, 
sum(p.amount)-c.creditLimit as `Selisih`
from customers as c
join payments as p
using (customerNumber)
group by c.customerNumber
having `Total Belanja` > `Batas Kredit`
order by `Selisih` desc;

# nomor 2
select concat(c.customerName, ' : ', c.contactFirstName, c.contactLastName, '@', c.addressLine1) as `Pelanggan`, 
sum(od.quantityOrdered) as `Jumlah Orderan`
from customers as c
join orders as o 
using (customerNumber)
join orderdetails as od
using (orderNumber)
group by `Pelanggan`
order by `Jumlah Orderan` desc
limit 1;

# nomor 3
select concat(monthname(p.paymentDate), ' ', year(p.paymentDate)) as `Hari Pembayaran`, 
count(c.customerName) as `Jumlah Pelanggan`, group_concat(c.customerName, ' ') as `List Pelanggan`, sum(p.amount) as `Jumlah Pembayaran`
from customers as c
join payments as p
using (customerNumber)
group by `Hari Pembayaran`
having `Hari Pembayaran` like "Feb%"
order by `Jumlah Pembayaran` desc;

# nomor 4
select * from products;
select * from orders;
select * from orderdetails;
select upper(p.productName) as `Nama Produk`, count(od.quantityOrdered) as `Jumlah diorder`, group_concat(o.orderDate) as `Waktu Orderan`,
p.buyPrice as `Harga Beli`, od.priceEach as `Harga Jual`, 
sum(od.quantityOrdered) as `Total Jumlah Orderan`, 
concat(od.priceEach*sum(od.quantityOrdered), ' - ', p.buyPrice*sum(quantityOrdered), ' = ', 
od.priceEach*sum(od.quantityOrdered) - p.buyPrice*sum(od.quantityOrdered)) as `Pendapatan - Modal = Keuntungan`
from products as p
join orderdetails as od
using (productCode)
join orders as o
using (orderNumber)
where p.productName like '%enzo'
group by `Harga Jual`
HAVING od.priceEach*sum(od.quantityOrdered) - p.buyPrice*sum(od.quantityOrdered) > 5000
order by od.priceEach*sum(od.quantityOrdered) - p.buyPrice*sum(od.quantityOrdered) desc;

# nomor 5
select o.addressLine1 as `Alamat`, concat(left(o.phone, 9), '* ****') as `Nomor Telp`, 
count(distinct e.employeeNumber) as `Jumlah Karyawan`, count(distinct c.customerNumber) as `Jumlah Pelanggan`, round(avg(p.amount), 2) as `Rata-rata Penghasilan`
from offices as o
join employees as e
using (officeCode)
join customers as c
on e.employeeNumber = c. salesRepEmployeeNumber
join payments as p
using (customerNumber)
group by `Alamat`
order by `Nomor Telp` asc;
