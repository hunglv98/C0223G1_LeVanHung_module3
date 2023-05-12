CREATE DATABASE `student-management`;
use `student-management`;
CREATE TABLE CLASS(
ID INT PRIMARY KEY,
`NAME` VARCHAR(45)
);
CREATE TABLE TEACHER(
ID INT PRIMARY KEY,
`NAME` VARCHAR(45),
AGE int,
COUNTRY varchar(45)
);
insert into class (id,name)
value (1,"hung"),(2,"kiet");
insert into teacher(id,`name`,age,country)
value (1,"CongNT",31,"VietNam");
select * from class;
select * from teacher;
