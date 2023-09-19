create database if not exists  gl;
use gl ;

create table  Employee(
id int primary key,
name varchar(50),
email_id varchar(50),
phone_number varchar(50));



alter table employee modify column email_id varchar(30);
desc employee;
truncate  employee;
