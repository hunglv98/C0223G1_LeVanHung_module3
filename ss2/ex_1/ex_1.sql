create database quan_ly_vat_tu;
use quan_ly_vat_tu;

create table nha_cc(
	man_cc int primary key,
    ten_ncc varchar(45),
    dia_chi varchar(45),
    id_sdt int
);

create table sdt(
	man_cc int,
    sdt int primary key,
    foreign key (man_cc) references nha_cc(man_cc)
);

create table phieu_xuat(
	so_px int primary key,
    ngay_xuat date
);

create table vat_tu(
	ma_vtu int primary key,
    ten_vtu varchar(45)
);

create table phieu_xuat_vat_tu(
	dg_xuat int,
    sl_xuat int,
    so_px int,
    ma_vtu int,
    primary key(so_px, ma_vtu),
    foreign key (so_px) references phieu_xuat(so_px),
    foreign key (ma_vtu) references vat_tu(ma_vtu)
);

create table phieu_nhap(
	so_pn int primary key,
    ngay_nhap date
);

create table vat_tu_phieu_nhap(
	dg_nhap int,
    sl_nhap int,
    so_pn int,
    ma_vtu int,
    primary key(so_pn,ma_vtu),
    foreign key (so_pn) references phieu_nhap(so_pn),
    foreign key(ma_vtu) references vat_tu(ma_vtu)
);

create table don_dh(
	so_dh int primary key,
    ngay_dh date,
    man_cc int,
    foreign key (man_cc) references nha_cc(man_cc)
);

create table vat_tu_don_dh(
	so_dh int,
    ma_vtu int,
    primary key(so_dh,ma_vtu),
    foreign key (ma_vtu) references vat_tu(ma_vtu),
    foreign key (so_dh) references don_dh(so_dh)
);

