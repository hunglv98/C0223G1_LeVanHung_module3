create database product_management;
use product_management;

-- Bước 2

create table products(
id int primary key auto_increment,
product_code int unique,
product_name varchar(45),
product_price double,
product_amount int,
product_description varchar(45),
product_status int
);

insert into products(product_code,product_name,product_price,product_amount,product_description,product_status)
values (1,"abc",12500,12,"normal",1),
(2,"bcd",25000,13,"dangerous",2)
;

-- Bước 3

create unique index uni_index on products(product_code);

-- drop index uni_index on products;

create index composite_index on products(product_name,product_price);

-- drop index composite_index on products;

explain select * from products;

-- Bước 4

create view view_product as
select product_code,product_name,product_price,product_status
from products;

select * from view_product;

update view_product
set product_code = 3
where product_name = "abc";

drop view view_product;

-- Bước 5

delimiter //
create procedure procedure_show ()
begin
	select * from products;
end //
delimiter ;

call procedure_show;

delimiter //
create procedure procedure_add (product_code int,
product_name varchar(45),
product_price double,
product_amount int,
product_description varchar(45),
product_status int)
begin
	insert into products(product_code ,
product_name ,
product_price ,
product_amount,
product_description,
product_status)
    values (product_code ,
product_name ,
product_price ,
product_amount,
product_description,
product_status);
end //
delimiter ;

call procedure_add(5,"def",30000,25,"dangerous",3);

delimiter //
create procedure procedure_detete (id int )
begin
	delete from products where products.id = id;
end //
delimiter ;

call procedure_detete(2);

delimiter //
create procedure procedure_edit (id int , product_name varchar(45) )
begin
	update products
    set products.product_name = product_name
    where products.id = id;
end //
delimiter ;

call procedure_edit(1, "hung");