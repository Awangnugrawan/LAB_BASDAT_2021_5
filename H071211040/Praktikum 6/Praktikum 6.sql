-- No1
use classicmodels;
select c.customerName as `Nama Pelanggan`, sum(amount) as `Total Belanja`, c.creditLimit as `Batas Kredit`, 
abs(sum(amount)-creditLimit) as `Selisih`
from customers c
join payments p
using (customerNumber)
group by customerName
having `Total Belanja` > `Batas Kredit`
order by `Selisih` desc;

-- No2
select concat(c.customerName, ' : ' , c.contactFirstName, ' ' ,c.contactLastName, '@' , c.addressLine1) as `Pelanggan`, 
sum(od.quantityOrdered) as `Jumlah Orderan`
from orders o
join customers c
using (customerNumber)
join orderdetails od
using (orderNumber)
group by customername
order by `Jumlah Orderan` desc limit 1;


-- No3
select date_format(paymentDate,  '%M %Y') as `Hari Pembayaran`, count(p.customerNumber) as `Jumlah Pelanggan`, 
group_concat(distinct customerName order by customerName separator ' , ') as `List Pelanggan`, sum(amount) as `Jumlah Pembayaran`
from payments p
join customers c
using(customerNumber)
group by `Hari Pembayaran`
having `Hari Pembayaran` like 'Fe%'
order by `Jumlah Pembayaran` desc;

-- No4
select upper(productName) as `Nama Produk`, count(orderDate) as `Jumlah di Order`, group_concat(distinct orderDate order by orderDate separator ',') as `Waktu Orderan`, 
buyPrice as `Harga Beli`, priceEach as `Harga Jual`, sum(quantityOrdered) as `Total Jumlah Orderan`, 
concat(priceEach*sum(quantityOrdered), '-' , buyPrice*sum(quantityOrdered),' = ', priceEach*sum(quantityOrdered)-buyPrice*sum(quantityOrdered)) as `Pendapatan - Modal = Keuntungan`
 from products p
 join orderdetails
 using (productCode)
 join orders o
 using (orderNumber)
 where productName like '%2001 Ferrari Enzo%'
 group by `Harga Jual`
 order by `Jumlah di Order` desc;
 
-- No5
select o.addressLine1 as `Alamat`, 
concat(substring(o.phone, 1, 9),"* ***") as `Nomor Telp`, count(distinct e.employeeNumber) as `Jumlah Karyawan`, 
count(distinct c.customerName) as `Jumlah Pelanggan`, round(avg(p.amount),2) as `Rata-rata penghasilan`
from offices o
join employees e
on o.officeCode =  e.officeCode 
join customers c
on e.employeeNumber = c.salesRepEmployeeNumber
join payments p
using (customerNumber)
group by o.officeCode
order by `Nomor Telp` asc;