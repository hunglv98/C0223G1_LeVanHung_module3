create database quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer(
	c_id int primary key auto_increment,
    c_name varchar(45),
    c_age int
);

insert into customer(c_name,c_age)
values  ("Minh Quan",10),
		("Ngoc Oanh",20),
		("Hong Ha",	50);


create table orders(
	o_id int primary key auto_increment,
    c_id int,
    o_date date,
    o_total_price int,
    foreign key (c_id) references customer(c_id)
);

insert into orders(c_id,o_date,o_total_price)
values  (1,	20060321,	Null),
		(2,	20060323,	Null),
		(1,	20060316,	Null)
;

create table product(
	p_id int primary key auto_increment,
    p_name varchar(45),
    p_price int
);

insert into product(p_name,p_price)
values  ("May Giat",3),
		("Tu Lanh",	5),
		("Dieu Hoa",7),
		("Quat",	1),
		("Bep Dien",2);


create table order_detail(
	o_id int,
    p_id int,
    od_qty int,
    primary key(o_id,p_id),
    foreign key (o_id) references orders(o_id),
    foreign key (p_id) references product(p_id)
);

insert into order_detail(o_id,p_id,od_qty)
values (1,	1,	3),
(1,	3,	7),
(1,	4,	2),
(2	,1	,1),
(3,	1,	8),
(2,	5,	4),
(2	,3,	3);

select o_id,o_date,o_total_price
from orders ;

select c.c_name, p.p_name
from customer c
join orders o
on c.c_id = o.c_id
join order_detail od
on od.o_id = o.o_id 
join product p
on p.p_id = od.p_id;

select * 
from customer c
left join orders o 
on c.c_id = o.c_id
where o.c_id is null;

select o.o_id, o.o_date , sum(p.p_price* od.od_qty) as total
from orders o 
join order_detail od
on o.o_id = od.o_id
join product p 
on p.p_id = od.p_id
group by o.o_id