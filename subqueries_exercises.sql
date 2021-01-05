##1 Find all the current employees with the same hire date as employee 101010 using a sub-query.

select *
from employees
join dept_emp on dept_emp.emp_no = employees.emp_no
where hire_date in (
	select hire_date
	from employees
	where hire_date = "1990-10-22"
)
and to_date > curdate();

##2 Find all the titles ever held by all current employees with the first name Aamod.
select *
from employees
join titles on employees.emp_no = titles.emp_no
where first_name in (
	select first_name
	from employees
	where first_name = 'Aamod'
)
and to_date > curdate()
order by last_name;

##3 How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.

select first_name, last_name, to_date
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
where to_date in (
	select to_date
	from employees
	where to_date < curdate()
);

##4 Find all the current department managers that are female. List their names in a comment in your code.

select first_name, last_name, gender, to_date
from dept_manager
join employees using(emp_no)
where gender in (
	select gender
	from employees
	where gender = 'F')
and to_date > curdate();
#Isamu	Legleitner	F	9999-01-01
#Karsten	Sigstam	F	9999-01-01
#Leon	DasSarma	F	9999-01-01
#Hilary	Kambil	F	9999-01-01

##5 Find all the employees who currently have a higher salary than the companies overall, historical average salary.

select first_name, last_name, salary, to_date
from employees
join salaries using(emp_no)
where salary > (
	select avg(salary)
	from salaries)
and to_date > curdate()
order by salary;
# 154,543 employees

##6 How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?

select stddev(salary)
from salaries
where to date > curdate()
and salary in (
	select max(salary)
	from sdalaries
	where to_date > curdate)
and
	select count (*)
	from salaries
	where salary >=
	((select max (salary)
	from salaries) -
	(select stddev(salary)
	from salaries))
and 
salaries.to_date > curdate()
and
	select count(*);
	
##Find all the department names that currently have female managers.

select *
from dept_manager
join employees using (emp_no)
join departments on dept_manager.dept_no = departments.dept_no
where gender in (
	select gender
	from employees
	where gender = 'F')
and dept_manager.to_date > curdate();

##Find the first and last name of the employee with the highest salary.

select *
from employees
join salaries on employees.emp_no = salaries.emp_no
where salary in (
	select max(salary)
	from salary)
and to_date > curdate();

##Find the department name that the employee with the highest salary works in.