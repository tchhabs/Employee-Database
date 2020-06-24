--Drop all tables if they exist

drop table departments
drop table dept_emp
drop table dept_manager
drop table employees
drop table salaries
drop table titles


CREATE TABLE departments (
dept_no varchar primary key not null,
dept_name varchar not null);


create table titles (
title_id varchar primary key not null,
title varchar not null);


create table employees (
emp_no int primary key not null,
emp_title varchar not null,
birth_date date not null,
first_name varchar not null,
last_name varchar not null,
sex varchar not null,
hire_date date not null,
foreign key (emp_title) references titles (title_id)
);


create table dept_emp (
emp_no int not null,
dept_no varchar not null,
foreign key (emp_no) references employees (emp_no),
foreign key (dept_no) references departments (dept_no),
primary key (emp_no, dept_no));


create table dept_manager(
dept_no varchar not null,
emp_no int not null,
foreign key (emp_no) references employees (emp_no),
foreign key (dept_no) references departments (dept_no),
primary key (emp_no, dept_no));


create table salaries (
emp_no int not null,
salary int not null,
foreign key (emp_no) references employees (emp_no),
primary key (emp_no));

