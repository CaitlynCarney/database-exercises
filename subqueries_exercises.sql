--1 Find all the current employees with the same hire date as employee 101010 using a sub-query.

	select hire_date
	from employees
	where emp_no = 101010;

	select *
	from employees
	join dept_emp on dept_emp.emp_no = employees.emp_no
	where hire_date in (
		select hire_date
		from employees
		where hire_date = "1990-10-22")
	and to_date > curdate();
	# this one is a short answer that would not be applicable to just change to whatever emp_no but the next one is able to do that
	
	#or

	select hire_date
	from employees
	where emp_no = 101010;
	#this part is creating subquery before creating the initial query
	select *
	from employees
	join dept_emp on dept_emp.emp_no = employees.emp_no
	where hire_date = (
		select hire_date
		from employees
		where emp_no = 101010)
	and to_date > curdate();
	#This one can be used many times with any number of employee numbers and would be better for the long term

--2 Find all the titles ever held by all current employees with the first name Aamod.

	select title
	from employees
	join titles on employees.emp_no = titles.emp_no
	where first_name in (
		select first_name
		from employees
		where first_name = 'Aamod')
	and to_date > curdate()
	group by title;

--3 How many people in the employees table are no longer working for the company? Give the answer 
--in a comment in your code.

	select count(emp_no)
	from employees
	where emp_no not in (
		select emp_no
		from salaries
		where to_date > curdate()
	);
			--59,900

--4 Find all the current department managers that are female. List their names in a comment in 
--your code.

	select first_name, last_name, gender, to_date
	from dept_manager
	join employees using(emp_no)
	where gender in (
		select gender
		from employees
		where gender = 'F')
	and to_date > curdate();
			--Isamu	Legleitner	F	9999-01-01
			--Karsten	Sigstam	F	9999-01-01
			--Leon	DasSarma	F	9999-01-01
			--Hilary	Kambil	F	9999-01-01

--5 Find all the employees who currently have a higher salary than the companies overall, historical 
--average salary.

	select first_name, last_name, salary, to_date
	from employees
	join salaries using(emp_no)
	where salary > (
		select avg(salary)
		from salaries)
	and to_date > curdate()
	order by salary;
		--154,543 employees

--6 How many current salaries are within 1 standard deviation of the current highest salary? (Hint: 
--you can use a built in function to calculate the standard deviation.) What percentage of all salaries 
--is this?

	select (select count(salary)
	from salaries
	where salary > (
		select max(salary) - STDDEV(salary)
		from salaries
		where to_date > curdate())
	and to_date > curdate())/
	(select count(salary)
	from salaries
	where to_date > curdate()) *100;
			--0.0346%

--BONUS 1 Find all the department names that currently have female managers.

	select departments.dept_no, departments.dept_name, concat(employees.first_name, " ", employees.last_name) as "Manager Name", gender
	from dept_manager
	join employees using (emp_no)
	join departments using (dept_no)
	where gender in (
		select gender
		from employees
		where gender = 'F')
	and dept_manager.to_date > curdate();
			--d002	Finance	Isamu Legleitner	F
			--d003	Human Resources	Karsten Sigstam	F
			--d005	Development	Leon DasSarma	F
			--d008	Research	Hilary Kambil	F

--BONUS 2 Find the first and last name of the employee with the highest salary.

	select concat(first_name, " ", last_name) as "Employee Name", salary
	from employees
	join salaries using (emp_no)
	where salary = (
		select max(salary)
		from salaries)
	and to_date > curdate();
			--Tokuyasu Pesch	158220

--BONUS 3 Find the department name that the employee with the highest salary works in.

	select dept_emp.dept_no as dept_no, dept_name, first_name, last_name, salary
	from employees
	join salaries using (emp_no)
	join dept_emp using (emp_no)
	join departments on dept_emp.dept_no = departments.dept_no
	where salary = (
		select max(salary)
		from salaries);
			--d007	Sales	Tokuyasu	Pesch	158220