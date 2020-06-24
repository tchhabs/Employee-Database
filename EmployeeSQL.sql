--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select emp.emp_no as "Employee Number",
		emp.last_name as "Last Name",
		emp.first_name as "First Name",
		emp.sex as "Sex",
		sal.salary as "Salary"
from employees as emp
	left join salaries as sal
	on (emp.emp_no = sal.emp_no)
order by emp.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.

select first_name as "First Name",last_name as "Last Name", employees.hire_data as "Hire Date"
from employees
where hire_data between '1986-01-01' and '1986-12-31'


--3. List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name.
select dep_man.emp_no as "Employee Number",
		emp_info.last_name as "Last Name",
		emp_info.first_name as "First Name",
		dep_man.dept_no as "Department Number",
		dep.dept_name as "Department Name"
from departments as dep
	left join dept_emp 
	on (dep.dept_no = dept_emp.dept_no)
	left join employees as emp_info
	on (emp_info.emp_no = dept_emp.emp_no)
	left join dept_manager as dep_man
	on (emp_info.emp_no = dep_man.emp_no)
order by dep_man.emp_no;

--4.List the department of each employee with the following information: employee number, 
--last name, first name, and department name

select dep.dept_name as "Department Name",
		dep_em.emp_no as "Employee Number",
		emp.last_name as "Last Name",
		emp.first_name as "First Name"
from departments as dep
	left join dept_emp as dep_em
	on (dep.dept_no = dep_em.dept_no)
	left join employees as emp
	on (dep_em.emp_no = emp.emp_no)
order by emp.emp_no;
		
--5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name as "First Name", last_name as "Last Name", sex as "Sex"
from employees
where first_name = 'Hercules' and last_name like 'B%'


--6.List all employees in the Sales department, including their employee number, last name, first name, and department name.

select dep_em.emp_no as "Employee Number",
		dep.dept_name as "Department Name",
		emp.last_name as "Last Name",
		emp.first_name as "First Name"
from dept_emp as dep_em
	left join departments as dep
	on (dep_em.dept_no = dep.dept_no)
	left join employees as emp
	on (dep_em.emp_no = emp.emp_no)
where dep.dept_name = 'Sales'

--7.List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.

select dep_em.emp_no as "Employee Number",
		dep.dept_name as "Department Name",
		emp.last_name as "Last Name",
		emp.first_name as "First Name"
from dept_emp as dep_em
	left join departments as dep
	on (dep_em.dept_no = dep.dept_no)
	left join employees as emp
	on (dep_em.emp_no = emp.emp_no)
where dep.dept_name = 'Sales' or dep.dept_name ='Development'
order by dep.dept_name

--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name as "Last Name", count(last_name) as "Frequency"
from employees
group by last_name
order by "Frequency" DESC 