use appseminar;

-- Nomor 1
select sm.nama , sm.nim , sp.nama 
from ss_mahasiswa sm 
join ss_prodi sp on sm.id_prodi = sp.id_prodi 
where sp.nama = "Ilmu Komputer"
union
select sd.nama , sd.nip , sp.nama 
from ss_dosen sd 
join ss_prodi sp on sd.id_prodi = sp.id_prodi 
where sp.nama = "Ilmu Komputer";

-- Nomor 2
select T1.nama, sp2.nama as `Prodi` , group_concat(status)
from (select distinct sd.id_prodi , sd.nama, 'Pembimbing Utama' as 'Status'
from ss_dosen sd 
join ss_pembimbing sp ON sd.id_dosen = sp.id_pembimbing_utama 
union 
select distinct sd.id_prodi , sd.nama, 'Pembimbing Pertama' as 'Status'
from ss_dosen sd 
join ss_pembimbing sp ON sd.id_dosen = sp.id_pembimbing_pertama 
union 
select distinct sd.id_prodi , sd.nama, 'Penguji 1' as 'Status'
from ss_dosen sd 
join ss_penguji sp  ON sd.id_dosen = sp.id_penguji_1 
union
select distinct sd.id_prodi , sd.nama, 'Penguji 2' as 'Status'
from ss_dosen sd 
join ss_penguji sp  ON sd.id_dosen = sp.id_penguji_2) as T1
left join ss_prodi sp2 using (id_prodi)
group by T1.nama
order by T1.nama desc;

-- Nomor 3
use classicmodels;
select T3.city, count(*), group_concat(T3.nama) 
from (select c.customerName as `Nama` , c.city 
	from customers c 
	where c.customerName like 'l%'
	union
	select concat(e.firstName, ' ', e.lastName) as `Name`, o.city 
	from employees e 
	join offices o using (officeCode)
	having `Name` like 'l%') as T3
group by city
order by count(*) desc;

-- Soal Tambahan (Soal 4)
select c.customerName, o2.quantityOrdered, p.productName, p2.amount  
from customers c 
join orders o using(customerNumber)
join orderdetails o2 using(orderNumber)
join products p using(productCode)
join payments p2 using(customerNumber)
where 	o2.quantityOrdered < (select avg(o3.quantityOrdered) from orderdetails o3) and 
		p2.amount > (select avg(amount) from payments p3)
group by c.customerNumber 
order by p2.amount desc