use classicmodels;
 
 -- nomor 1
select amount from payments;
select c.customerName as 'Nama Pelanggan',
sum(p.amount) as 'Total Belanja',
c.creditLimit as 'Batas Kredit',
sum(p.amount)-c.creditLimit as `Selisih`
from customers c 
join payments p 
using (customerNumber)
group by c.customerName
having 'Total Belanja' > 'Batas Kredit'
order by `Selisih` desc;

-- nomor 2
select * from orderDetails;
select concat(c.customerName,' : ', c.contactFirstName,' ', c.contactLastName,' @ ', c.addressLine1) AS `Pelanggan`,
sum(od.quantityOrdered) as `Jumlah Orderan`  
from customers c
join orders o
using (customerNumber)
join orderdetails od 
using (orderNumber)
group by customerName
order by `Jumlah Orderan` desc limit 1;
;

-- Nomor 3
select date_format(p.paymentDate, '%M %Y') as `Hari Pembayaran`,
count(distinct p.customerNumber) as `Jumlah Pelanggan`, 
group_concat(distinct c.customerName order by c.customerName separator ' , ') as `List Pelanggan`,
sum(distinct p.amount) as `Jumlah Pembayaran`
from payments p
join customers c
using (customerNumber)
group by `Hari Pembayaran`
having `Hari Pembayaran` like "Feb%"
order by `Jumlah Pembayaran` desc;

-- Nomor 4

select upper(p.productName) as `Nama Produk`, count(od.orderNumber) as `Jumlah Di Order`, group_concat(o.orderDate, ' ') as `Waktu Orderan`, p.buyPrice as `Harga Beli`,  od.priceEach as `Harga Jual`, sum(od.quantityOrdered) as `Total Jumlah Orderan`,
concat(od.priceEach * sum(od.quantityOrdered), ' - ', p.buyPrice * sum(od.quantityOrdered), ' = ', sum(od.quantityOrdered) * (od.priceEach - p.buyPrice)) as `Pendapatan - Modal = Keuntungan`
from orders o
join orderdetails od
using (orderNumber)
join products p
using (productCode)
group by `Harga Jual`
having `Nama Produk` like '%ENZO'
and sum(od.quantityOrdered) * (od.priceEach - p.buyPrice) > 5000
order by sum(od.quantityOrdered) * (od.priceEach - p.buyPrice) desc;

-- Nomor 5

select o.addressLine1 as Alamat,
replace (o.phone, right(o.phone, 6), '* ****') as `Nomor Telpon`, count(distinct e.employeeNumber) as 'Jumlah Karyawan',
count(distinct c.customerNumber) as `Jumlah Pelanggan`, round (avg(p.amount), 2) as `Rata Rata Penghasilan`
from customers c
join employees e
on e.employeeNumber = c.salesRepEmployeeNumber
join offices o
using (officeCode)
join payments p
using (customerNumber)
group by o.phone;