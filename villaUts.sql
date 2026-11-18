create database	villa;

use villa;
create table tipeVilla(
idTipe int auto_increment not null,
namaTipe varchar(50) not null,
kapasitas int not null,
hargaPerMalam float not null,
primary key(idTipe)
);

create table unitVilla(
idUnit int auto_increment not null,
namaUnit varchar(50) not null,
statusVilla boolean not null,
idTipe int not null,
constraint pk_unitVilla primary key(idUnit),
constraint fk_tipeVilla_unitVilla foreign key(idTipe)
	references tipeVilla(idTipe)
    on delete restrict on update cascade
);

create table tamu(
idTamu int auto_increment not null,
namaTamu varchar(50) not null,
negara varchar(50) not null,
noTlp varchar(50),
email varchar(50),
primary key(idTamu)
);

create table reservasi(
idReservasi int auto_increment not null,
tglCheckin date not null,
tglCheckout date not null,
jumlahTamu int not null,
totalBiaya float not null,
idTamu int not null,
idUnit int not null,
constraint pk_reservasi primary key(idReservasi),
constraint fk_unitVilla_reservasi foreign key(idUnit)
	references unitVilla(idUnit)
    on delete restrict on update cascade,
constraint fk_tamu_reservasi foreign key(idTamu)
	references tamu(idTamu)
    on delete restrict on update cascade
);

create table pembayaran(
idPembayaran int auto_increment not null,
tglBayar date not null,
metode varchar(50) not null,
jumlahBayar float not null,
idReservasi int not null,
constraint pk_pembayaran primary key(idPembayaran),
constraint fk_reservasi_pembayaran foreign key(idReservasi)
	references reservasi(idReservasi)
    on delete restrict on update cascade
);

create table layananTambahan(
idLayanan int auto_increment not null,
namaLayanan varchar(50) not null,
harga float not null,
constraint pk_layananTambahan primary key(idLayanan)
);

create table detailLayanan(
idLayananDetail int auto_increment not null,
jumlah int not null,
tglLayanan date not null,
idReservasi int not null,
idLayanan int not null,
constraint pk_detailLayanan primary key(idLayananDetail),
constraint fk_reservasi_detailLayanan foreign key(idReservasi)
	references reservasi(idReservasi)
    on delete cascade on update cascade,
constraint fk_layananTambahan_detailLayanan foreign key(idLayanan)
	references layananTambahan(idLayanan)
	on delete restrict on update cascade
);