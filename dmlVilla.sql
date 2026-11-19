use villa;

insert into tipeVilla (namaTipe, kapasitas, hargaPerMalam) values
('Studio Garden', 2, 600000),
('One Bedroom Pool', 2, 1000000),
('Two Bedroom Pool', 4, 1800000),
('Family Villa', 6, 2500000),
('Royal Villa', 8, 4000000);

insert into unitVilla (namaUnit, statusVilla, idTipe) values
('Villa Melati', true, 1),
('Villa Kamboja', false, 2),
('Villa Teratai', true, 2),
('Villa Cempaka', false, 3),
('Villa Jempiring', false, 4),
('Villa Sandat', true, 5);

insert into tamu (namaTamu, negara, noTlp, email) values
('Lebron James', 'United States', '+12125550147', 'james@mail.com'),
('Chamber', 'Prancis', '+33698765432', 'chamber@mail.com'),
('Made Geblag', 'Indonesia', '081337654321', 'made@mail.com'),
('Uciha Eddy', 'Jepang', '+81355501234', 'eddy@mail.com'),
('Charles Lecrec', 'Monaco', '+37798123456', 'charles@mail.com'),
('Harry Kane', 'Inggris', '+447700900123', 'kane@mail.com');

insert into reservasi (tglCheckin, tglCheckout, jumlahTamu, totalBiaya, idTamu, idUnit) values
('2026-11-01', '2026-11-05', 2, 4000000, 1, 2),
('2026-11-03', '2026-11-06', 4, 5400000, 2, 4),
('2026-11-10', '2026-11-12', 2, 1200000, 3, 1),
('2026-11-15', '2026-11-20', 6, 20000000, 4, 6),
('2026-11-18', '2026-11-21', 2, 3000000, 5, 3),
('2026-11-22', '2026-11-25', 5, 7500000, 6, 5);

insert into pembayaran (tglBayar, metode, jumlahBayar, idReservasi) values
('2026-10-20', 'Transfer', 2000000, 1),
('2026-11-01', 'Kartu Kredit', 2000000, 1),
('2026-10-25', 'Transfer', 5400000, 2),
('2026-11-10', 'Tunai', 1200000, 3),
('2026-11-01', 'Transfer', 10000000, 4),
('2026-11-05', 'Transfer', 3000000, 6);

insert into layananTambahan (namaLayanan, harga) values
('Airport Transfer', 350000),
('Spa Massage', 450000),
('Sarapan Tambahan', 100000),
('Sewa Motor', 150000),
('Private Chef', 800000);

insert into detailLayanan (jumlah, tglLayanan, idReservasi, idLayanan) values
(2, '2026-11-01', 1, 1),
(2, '2026-11-03', 1, 2),
(4, '2026-11-04', 2, 3),
(1, '2026-11-17', 4, 5),
(3, '2026-11-18', 4, 2),
(2, '2026-11-18', 5, 4);

update unitVilla set statusVilla = true where idUnit = 5;

delete from reservasi where idReservasi = 5;
