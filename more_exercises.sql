### employees database

##How much do the current managers of each department get paid, relative to the average salary for the department? Is there any department where the department manager gets paid less than the average salary?

use easley_1268;
create temporary table depts_avg_sal as (
select ewd.dept_no, avg(salary) as dept_avg
from employees.employees_with_departments as ewd
join employees.salaries using(emp_no)
join employees.employees using (emp_no)
where employees.salaries.to_date > curdate()
group by ewd.dept_no);
select *
from depts_avg_sal;

create temporary table manager_salary as 
(select dept_no, salary
from employees.dept_manager
join employees.salaries using(emp_no)
where salaries.to_date > curdate()
and dept_manager.to_date > curdate());
select *
from manager_salary;

create temporary table manager_vs_dept as(
select *
from depts_avg_sal
join manager_salary using (dept_no));
select *
from manager_vs_dept;


## wolrd db

# What languages are spoken in Santa Monica?
select Name, Language
from city
join countrylanguage using (CountryCode)
where Name = 'Santa Monica'
order by Language asc;