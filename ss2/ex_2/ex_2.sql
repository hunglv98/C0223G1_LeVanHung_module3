create database quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer(
	cid int primary key,
    cname varchar(45),
    cage int
);

create table orders(
	oid int primary key,
    cid int,
    odate date,
    ototalprice int,
    foreign key (cid) references customer(cid)
);

create table product(
	pid int primary key,
    pname varchar(45),
    pprice int
);

create table oder_detail(
	oid int,
    pid int,
    odqty int,
    primary key(oid,pid),
    foreign key (oid) references orders(oid),
    foreign key (pid) references product(pid)
)