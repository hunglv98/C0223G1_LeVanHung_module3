create database quan_ly_vat_tu;
use quan_ly_vat_tu;

create table nhacc(
	mancc int primary key,
    tenncc varchar(45),
    diachi varchar(45),
    id_sdt int
);

create table sdt(
	mancc int,
    sdt int primary key,
    foreign key (mancc) references nhacc(mancc)
);

create table phieuxuat(
	sopx int primary key,
    ngayxuat date
);

create table vattu(
	mavtu int primary key,
    tenvtu varchar(45)
);

create table phieuxuat_vattu(
	dgxuat int,
    slxuat int,
    sopx int,
    mavtu int,
    primary key(sopx, mavtu),
    foreign key (sopx) references phieuxuat(sopx),
    foreign key (mavtu) references vattu(mavtu)
);

create table phieunhap(
	sopn int primary key,
    ngaynhap date
);

create table vattu_phieunhap(
	dgnhap int,
    slnhap int,
    sopn int,
    mavtu int,
    primary key(sopn,mavtu),
    foreign key (sopn) references phieunhap(sopn),
    foreign key(mavtu) references vattu(mavtu)
);

create table dondh(
	sodh int primary key,
    ngaydh date,
    mancc int,
    foreign key (mancc) references nhacc(mancc)
);

create table vattu_dondh(
	sodh int,
    mavtu int,
    primary key(sodh,mavtu),
    foreign key (mavtu) references vattu(mavtu),
    foreign key (sodh) references dondh(sodh)
);

