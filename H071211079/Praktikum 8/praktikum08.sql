#nomor 1
select d.nama as `Nama Dosen`, p.nama as `Nama Prodi`, d.nip as `NIM/NIP`,
'Dosen' as `Keterangan`
from ss_dosen as d
join ss_prodi as p
using (id_prodi)
where p.nama = 'Ilmu Komputer'
union 
select m.nama as `Nama Mahasiswa`, p.nama as `Nama Prodi`, m.nim as `NIM/NIP`,
'Mahasiswa' as `Keterangan`
from ss_mahasiswa as m
join ss_prodi as p
using (id_prodi)
where p.nama = 'Ilmu Komputer';

#nomor 2
select `Nama Dosen`, `Nama prodi`, group_concat(stat) as `Riwayat Status`
from (
	select ss_dosen.nama as `Nama Dosen`, ss_prodi.nama as `Nama Prodi`, 
    (select 'Penguji 1' where ss_penguji.id_penguji_1 = ss_dosen.id_dosen) as stat
    from ss_dosen left join ss_prodi using (id_prodi), ss_penguji
    union
    select ss_dosen.nama as `Nama Dosen`, ss_prodi.nama as `Nama Prodi`, 
    (select 'Penguji 2' where ss_penguji.id_penguji_2 = ss_dosen.id_dosen) as stat
    from ss_dosen left join ss_prodi using (id_prodi), ss_penguji
    union
    select ss_dosen.nama as `Nama Dosen`, ss_prodi.nama as `Nama Prodi`, 
    (select 'Penguji 3' where ss_penguji.id_penguji_3 = ss_dosen.id_dosen) as stat
    from ss_dosen left join ss_prodi using (id_prodi), ss_penguji
    union
    select ss_dosen.nama as `Nama Dosen`, ss_prodi.nama as `Nama Prodi`, 
    (select 'Pembimbing Utama' where ss_pembimbing.id_pembimbing_utama = ss_dosen.id_dosen) as stat
    from ss_dosen left join ss_prodi using (id_prodi), ss_pembimbing
    union
    select ss_dosen.nama as `Nama Dosen`, ss_prodi.nama as `Nama Prodi`, 
    (select 'Pembimbing Pertama' where ss_pembimbing.id_pembimbing_pertama = ss_dosen.id_dosen) as stat
    from ss_dosen left join ss_prodi using (id_prodi), ss_pembimbing
    union
    select ss_dosen.nama as `Nama Dosen`, ss_prodi.nama as `Nama Prodi`, 
    (select 'Pembimbing Kedua' where ss_pembimbing.id_pembimbing_kedua = ss_dosen.id_dosen) as stat
    from ss_dosen left join ss_prodi using (id_prodi), ss_pembimbing
) as a
group by `Nama Dosen`
having `Riwayat Status` is not null
order by `Nama Dosen` desc;

#nomor 3
select dh.city as `Kota`, count(city) as `Jumlah`, group_concat(dh.nama)
from (
	select city, customerName as `Nama`
    from customers where customerName like 'L%'
    union
    select offices.city,
    (select concat(employees.firstName, ' ', employees.lastName)) as b
    from employees
    join offices
    using (officeCode)
	having b like 'L%'
    
) as dh
group by city
order by count(city) desc;