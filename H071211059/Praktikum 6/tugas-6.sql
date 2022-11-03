use classicmodels;

-- Nomor 1
select c.customerName as `Nama Pelanggan`, 
		sum(p.amount ) as `Total Belanja`,
		format(c.creditLimit, 2) as `Batas Kredit`,
		sum(p.amount) - c.creditLimit  as `Selisih`
from customers c 
join payments p using (customerNumber)
group by customerNumber 
order by `Selisih` desc
limit 5
;

-- Nomor 2
select concat(c.customerName, ' : ', c.contactFirstName, ' ', c.contactLastName , '@', c.addressLine1) as Pelanggan,
	sum(o2.quantityOrdered) as `Jumlah Orderan`
from customers c 
join orders o using(customerNumber)
join orderdetails o2 using(orderNumber)
group by c.customerNumber
order by `Jumlah Orderan` desc
limit 1
;

-- Nomor 3
select concat(monthname(p.paymentDate), ' ', year(p.paymentDate)) as `Hari Pembayaran`,
	count(c.customerNumber ) as `Jumlah Pelanggan`,
	group_concat(c.customerName order by c.customerName) as `List Pelanggan`,
	sum(p.amount) as `Jumlah Pembayaran`
from payments p
left join customers c using(customerNumber)
group by `Hari Pembayaran`
having `Hari Pembayaran` like 'February%'
order by `Jumlah Pembayaran` desc
;

-- Nomor 4
select p.productName as `Nama Produk`, 
	count(*) as `Jumlah di Order`, 
	group_concat(o2.orderDate) as `Waktu Orderan`,
	p.buyPrice as `Harga Beli`, 
	o.priceEach as `Harga Jual`, 
	sum(o.quantityOrdered) as `Total Jumlah Orderan`,
	concat((o.priceEach * sum(o.quantityOrdered)), ' - ', (p.buyPrice * sum(o.quantityOrdered)), ' = ', (o.priceEach * sum(o.quantityOrdered)) - (p.buyPrice * sum(o.quantityOrdered))) as `Pendapatan - Modal = Keuntungan`
from products p 
right join orderdetails o using(productCode)
join orders o2 on o.orderNumber  = o2.orderNumber 
group by o.priceEach 
having p.productName like '%Enzo%' and (o.priceEach * sum(o.quantityOrdered)) - (p.buyPrice * sum(o.quantityOrdered)) > 5000
order by (o.priceEach * sum(o.quantityOrdered)) - (p.buyPrice * sum(o.quantityOrdered)) desc
;

-- Nomor 5
select o.addressLine1 as `Alamat`, 
	concat(left(o.phone, length(o.phone) - 6), '*****') as `Nomor Telp`, 
	count(distinct e.employeeNumber) as `Jumlah Karyawan`,
	count(distinct c.customerNumber) as `Jumlah Pelanggan`,
	format(avg(amount), 2) as `Rata-Rata Penghasilan`
from employees e 
join offices o using (officeCode)
join customers c on e.employeeNumber = c.salesRepEmployeeNumber 
join payments p using(customerNumber)
where e.jobTitle = "sales rep"
group by officeCode 
order by `Nomor telp`
;