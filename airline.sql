create database tushar_airline1;
use tushar_airline1;
create table flights(
flno int primary key,
from1 varchar(20),
to1 varchar(20),
distance int,
departs time,
arrives time,
price int);

create table aircraft(
aid int primary key,
aname varchar(20),
c_range int);

create table employee(
eid int primary key,
ename varchar(20),
salary int);

create table certified(
eid int,
aid int,
primary key(aid,eid),
foreign key(aid) references aircraft(aid) on update cascade,
foreign key(eid) references employee(eid) on update cascade);

insert into flights values(1,'Bengaluru','New Delhi',500,'06:15:45','09:00:00',5000);
insert into flights values(2,'Bengaluru','Chennai',300,'07:00:00','08:30:00',3000);
insert into flights values(3,'Trivandrum','New Delhi',800,'08:00:00','11:30:00',6000);
insert into flights values(4,'Bengaluru','Frankfurt',10000,'06:00:00','23:30:00',50000);
insert into flights values(5,'Kolkota','New Delhi',2400,'11:00:00','03:30:00',9000);
insert into flights values(6,'Bengaluru','Frankfurt',8000,'09:00:00','23:00:00',40000);

insert into employee values(101,'Avinash',50000);
insert into employee values(102,'Lokesh',60000);
insert into employee values(103,'Rakesh',70000);
insert into employee values(104,'Santhosh',82000);
insert into employee values(105,'Tilak',90000);

insert into aircraft values(1,'Airbus',2000);
insert into aircraft values(2,'Boeing',700);
insert into aircraft values(3,'JetAirways',550);
insert into aircraft values(4,'Indigo',5000);
insert into aircraft values(5,'Boeing',4500);
insert into aircraft values(6,'Airbus',2200);

insert into certified values(101,1);
insert into certified values(101,4);
insert into certified values(101,5);
insert into certified values(101,6);
insert into certified values(102,1);
insert into certified values(104,3);
insert into certified values(105,3);
insert into certified values(103,5);
insert into certified values(103,6);
insert into certified values(104,6);
insert into certified values(104,1);
insert into certified values(103,2);

select * from certified;

SELECT  DISTINCT a.aid,A.aname FROM  AIRCRAFT A WHERE  A.Aid IN 
( SELECT C.aid FROM CERTIFIED C, EMPLOYEE E WHERE C.eid = E.eid AND NOT EXISTS 
( SELECT * FROM EMPLOYEE E1 WHERE E1.eid = E.eid AND E1.salary < 80000 )) ;