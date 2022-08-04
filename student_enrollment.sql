create database student_enrollment;
use student_enrollment;
show tables;

create table student(
stud_regno varchar(25) primary key,
stud_name varchar(25),
stud_major varchar(25),
stud_bdate date);

create table course(
course_no int primary key,
cname varchar(25),
cdept varchar(25));

create table text_book(
book_ISBN int primary key,
book_title varchar(25),
book_publisher varchar(25),
book_author varchar(25));

create table enroll(
regno varchar(25),
courseno int,
sem int,
marks int,
primary key(regno,courseno,sem),
foreign key(regno) references student(stud_regno),
foreign key(courseno) references course(course_no));

create table book_adoption(
course_no int,
sem int,
book_ISBN int,
primary key(course_no,sem,book_ISBN),
foreign key(course_no) references course(course_no),
foreign key(book_ISBN) references text_book(book_ISBN));





