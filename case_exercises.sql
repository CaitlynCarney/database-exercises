--1 Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.

    select employees_with_departments.emp_no, employees_with_departments.dept_no, hire_date, to_date,
        case
            when to_date > curdate() then "1"
            else "0"
            end as is_current_employee
    from employees_with_departments
    join dept_emp using (emp_no)
    join employees using (emp_no);

--2 Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.

    select first_name, last_name,
        case
            when left(last_name, 1) >= 'A' and left(last_name, 1) <= 'H' then 'A-H'
            when left(last_name, 1) >= 'I' and left(last_name, 1) <= 'Q' then 'I-Q'
            else 'R-Z'
            end as alpha_group
    from employees;
		

--3 How many employees (current or previous) were born in each decade?

    select count(emp_no),
        case
            when birth_date like '195%-%%-%%' then '50s'
            else '60s'
            end as decade_of_birth
    from employees
    group by decade_of_birth;

--BONUS What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?
    use employees;
    select
        case
            when dept_name in ('Research', 'Development') then 'R&D'
            when dept_name in ('Sales', 'Marketing') then 'Sales & Marketing'
            when dept_name in ('Production', 'Quality Management') then 'Prod & QM'
            when dept_name in ('Finance', 'Human Resorces') then 'Finance & HR'
            else dept_name
            end as dept_group,
        avg(salary)
    from employees_with_departments
    join salaries using(emp_no)
    where to_date > curdate()
    group by dept_group;
