show databases;
use insurance;
show tables;
drop table person;
create table person
( driver_id char(10) primary key,name1 varchar(50),address varchar(50));
show tables;
create table car
(
regno char(10) primary key,
model varchar(25),
year1 year);

drop table car;

create table accident
(
report_number int(5) primary key,
date1 int(2),
location varchar(25));

drop table accident;

create table owns
(
driver_id char(10),
regno char(10),
primary key(driver_id,regno),
foreign key(driver_id) references person(driver_id) on delete cascade,
foreign key(regno) references car(regno) on delete cascade
);

drop table owns;

create table participated 
(
driver_id char(10),
regno char(10),
report_number int(3),
damage_amount int(5),
primary key(driver_id,regno,report_number),
foreign key(driver_id) references person(driver_id) on delete cascade,
foreign key(regno) references car(regno) on delete cascade,
foreign key(report_number) references accident(report_number) on delete cascade);

show tables;

drop table participated;

insert into person values('DRIVER1','DRIVER_A','Layout1');
insert into person values('DRIVER2','DRIVER_B','Layout2');
insert into person values('DRIVER3','DRIVER_C','Layout3');
insert into person values('DRIVER4','DRIVER_D','Layout4');
insert into person values('DRIVER5','DRIVER_E','Layout5');

insert into car values('KA15ABC15','sedan','2004');
insert into car values('KA15ABC16','suv','2006');
insert into car values('KA15ABC17','hatchback','2008');
insert into car values('KA15ABC18','sedan','2007');
insert into car values('KA15ABC19','suv','2005');
 
select * from person;
select * from car;

insert into accident values('10','15','nagara1');
insert into accident values('11','28','nagara2');
insert into accident values('12','24','nagara3');
insert into accident values('13','27','nagara4');
insert into accident values('14','30','nagara5');

select * from accident;
select * from owns;

insert into owns values('DRIVER1','KA15ABC15');
insert into owns values('DRIVER2','KA15ABC16');
insert into owns values('DRIVER3','KA15ABC17');
insert into owns values('DRIVER4','KA15ABC18');
insert into owns values('DRIVER5','KA15ABC18');

insert into participated values('DRIVER1','KA15ABC15','10','100000');
insert into participated values('DRIVER2','KA15ABC16','11','200000');
insert into participated values('DRIVER3','KA15ABC17','12','300000');
insert into participated values('DRIVER4','KA15ABC18','13','400000');
insert into participated values('DRIVER5','KA15ABC19','14','500000');

select * from participated;

update participated set damage_amount='25000' where report_number='12';

select count(regno) from car where year1=2008;








