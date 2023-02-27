-- UC 1---
create database employee_payroll_service;
use employee_payroll_service;

----- UC2 -----
create table employee_payroll (
id int not null auto_increment,
name varchar(50) not null,
salary Double not null,
startDate Date not null,
primary key(id)
);
desc employee_payroll;

----- UC3 -----
insert into employee_payroll (name, salary, startDate)
values ('Shubham', 900000.0, '2021-04-10');
insert into employee_payroll (name, salary, startDate)
values ('Durgesh', 700000.0, '2021-09-10');
insert into employee_payroll (name, salary, startDate)
values ('Rohini', 800000.0, '2021-02-10');
insert into employee_payroll (name, salary, startDate)
values ('Julekha', 600000.0, '2021-05-10');

----- UC4 -----
select * from employee_payroll;

----- UC5 -----
select * from employee_payroll where id = 'Durgesh';

select * from employee_payroll where startDate between '2021-04-10' and Date(now());

----- UC6 -----
alter table employee_payroll add gender char(1);

update employee_payroll set gender  = 'M' where id;
update employee_payroll set gender = 'F' where id=3;
update employee_payroll set gender = 'F' where id=4;

----- UC7 -----
select sum(salary) from employee_payroll;

select gender, sum(salary) from employee_payroll group by gender;

-- UC-8 --    
alter table employee_payroll
add phone_number varchar(30),
add department varchar(30) not null;

alter table employee_payroll
add address varchar(250) default 'ABC';

select * from employee_payroll;

----- UC9 -----
alter table employee_payroll
rename column salary to basic_pay;

alter table employee_payroll
add deductions int,
add taxable_pay int,
add income_tax int,
add net_pay int;

select * from employee_payroll;

SELECT SUM(basic_pay) FROM employee_payroll WHERE gender = 'F' GROUP by gender;

-- UC-10 --
insert into employee_payroll
(name, basic_pay, startDate, department)
values ('Terrisa', 500000.0, '2021-01-10', 'Sales');
insert into employee_payroll
(name, basic_pay, startDate, gender, phone_number, department, deductions, taxable_pay, income_tax, net_pay)
values ('Terrisa', 500000.0, '2021-01-10', 'F', '456765', 'Marketing', 30000, 400, 756, 857);

select * from employee_payroll;

-- UC-11 --
create table employee(
id int not null auto_increment primary key,
name varchar(50) not null,
gender varchar(1),
phone_number varchar(13),
address varchar(200),
startDate Date not null
);
desc employee;
select * from employee;

create table payroll(
id int not null auto_increment primary key,
basic_pay double,
deductions double,
income_tax double,
taxable_pay double,
tax double,
net_pay double,
emp_ID int,
foreign key(emp_ID) references employee(id)
);
desc payroll;
select * from payroll;

create table department(
  id int not null auto_increment primary key,
  dept_name varchar(20) not null
  );

desc department;

create table employee_department(
  employee_id int not null,
  department_id int not null,
  foreign key(employee_id) references employee(id),
  foreign key(department_id) references department(id),
  primary key(employee_id,department_id)
);

desc employee_department;

select * from employee;
select * from payroll;
select * from department;
select * from employee_department;
show tables;

insert into employee(name, gender, phone_number, address,startDate)
values ('Shubham', 'M','989656565','Ambala','2021-01-10');
insert into employee(name, gender, phone_number, address,startDate)
values ('Karan', 'M','8686868686','Yamunanagar','2021-10-01');
insert into employee(name, gender, phone_number, address,startDate)
values ('Riya', 'F','9835464678','Patiala','2021-01-04');
insert into employee(name, gender, phone_number, address,startDate)
values ('Rashmi', 'F','6464646445','Delhi','2021-04-10');

ALTER TABLE employee ADD salary varchar(50);

select * from employee;

insert into employee(name, gender, phone_number, address,startDate, salary)
values ('Terrisa', 'F','888888885','USA','2021-04-16', 3000000);
insert into employee(name, gender, phone_number, address,startDate, salary)
values ('Neha', 'F','453637475','Dwarka','2021-04-17', 5000000);


insert into payroll(basic_pay, deductions, income_tax, taxable_pay, tax, net_pay,emp_ID)
values (400000,1000,500,5000,600,350000,1);
insert into payroll(basic_pay, deductions, income_tax, taxable_pay, tax, net_pay,emp_ID)
values (500000,2000,500,5000,600,450000,2);
insert into payroll(basic_pay, deductions, income_tax, taxable_pay, tax, net_pay,emp_ID)
values (600000,3000,500,5000,600,550000,3);
insert into payroll(basic_pay, deductions, income_tax, taxable_pay, tax, net_pay,emp_ID)
values (700000,4000,500,5000,600,650000,4);

insert into department(dept_name)
values('Sales'),('Marketing');
insert into department(dept_name)
values('HR');

select sum(basic_pay) from payroll;
select gender, sum(basic_pay) from payroll join employee group by gender;
select gender, avg(basic_pay) from payroll join employee group by gender ;
select gender, max(basic_pay) from payroll join employee group by gender ;
select gender, min(basic_pay) from payroll join employee group by gender ;

select gender, count(*) from employee group by gender;

insert into employee(name, gender, phone_number, address,startDate)
values ('Terissa', 'F','9895689865','NY','2021-04-10');
insert into payroll(basic_pay, deductions, income_tax, taxable_pay, tax, net_pay,emp_ID)
values (300000,1000,500,5000,600,350000,5);
insert into employee_department(employee_id,department_id)values(1,1);

-- person belong to both department---
select * from employee inner join payroll inner join
department ON employee.id = 5 and payroll.id =5 and department.id IN (1,2);