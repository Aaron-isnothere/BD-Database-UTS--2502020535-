select r.idReservasi, t.namaTamu, u.namaUnit, r.tglCheckin, r.tglCheckout,
       datediff(r.tglCheckout, r.tglCheckin) as lamaMalam
from reservasi r
join tamu t on r.idTamu = t.idTamu
join unitVilla u on r.idUnit = u.idUnit
order by r.tglCheckin;

select u.namaUnit, tv.namaTipe, tv.kapasitas, tv.hargaPerMalam
from unitVilla u
join tipeVilla tv on u.idTipe = tv.idTipe
where u.statusVilla = true
order by tv.hargaPerMalam desc;

select tv.namaTipe, count(r.idReservasi) as jumlahReservasi,
       sum(r.totalBiaya) as totalPendapatan
from tipeVilla tv
join unitVilla u on tv.idTipe = u.idTipe
join reservasi r on u.idUnit = r.idUnit
group by tv.namaTipe
order by totalPendapatan desc;

select t.negara, avg(datediff(r.tglCheckout, r.tglCheckin)) as rataRataMalam
from tamu t
join reservasi r on t.idTamu = r.idTamu
group by t.negara
having avg(datediff(r.tglCheckout, r.tglCheckin)) > 2;

select r.idReservasi, t.namaTamu,
       r.totalBiaya + ifnull(sum(d.jumlah * l.harga), 0) as totalBiaya
from reservasi r
join tamu t on r.idTamu = t.idTamu
left join detailLayanan d on r.idReservasi = d.idReservasi
left join layananTambahan l on d.idLayanan = l.idLayanan
group by r.idReservasi, t.namaTamu, r.totalBiaya;

select t.namaTamu, t.negara, r.totalBiaya
from reservasi r
join tamu t on r.idTamu = t.idTamu
where t.negara <> 'Indonesia'
  and r.totalBiaya > (select avg(totalBiaya) from reservasi)
order by r.totalBiaya desc;