--1 Using the example from the lesson, re-create the employees_with_departments table.

    use easley_1268;
    create temporary table emp_with_dept as(
        select *
        from employees.employees_with_departments);
    select *
    from emp_with_dept;

--1a Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns

    select *
    from emp_with_dept;
    alter table emp_with_dept
    add full_name varchar(31);

--1b Update the table so that full name column contains the correct data

    select *
    from emp_with_dept;
    update emp_with_dept
    set full_name = concat(first_name, " ", last_name);

--1c Remove the first_name and last_name columns from the table.

    select *
    from emp_with_dept;
    alter table emp_with_dept
    drop column first_name,
    drop column last_name;


--1d What is another way you could have ended up with this same table?

    use employees;
    select emp_no, concat(first_name, " ", last_name) as full_name, dept_no, dept_name
    from employees_with_departments;

--2 Create a temporary table based on the payment table from the sakila database.

    use easley_1268;
    create temporary table sak_pay2 as (
        select *
        from sakila.payment);
    select *
    from sak_pay2;

--2.5 Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.

    select *
    from sak_pay2;
    alter table sak_pay2
    modify amount decimal(10, 4);
    update sak_pay2
    set amount = amount * 100;
    alter table sak_pay2
    modify amount integer;


--3 Find out how the current average pay in each department compares to the overall, historical average pay. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst?


    use easley_1268;
    create temporary table emp_dept_sal as(
        select *
        from employees.employees_with_departments
        join employees.salaries using(emp_no));
    select *
    from emp_dept_sal;

    create temporary table historic_avg_sal as(
        select dept_name, avg(salary) as historic_salary
        from emp_dept_sal
        where to_date < curdate()
        group by dept_name);
    select *
    from historic_avg_sal;
        
    create temporary table curr_avg_sal as(
        select dept_name, avg(salary) as current_salary
        from emp_dept_sal
        where to_date > curdate()
        group by dept_name);
    select *
    from curr_avg_sal;

    create temporary table average_salaries	as(
        select curr_avg_sal.dept_name, current_salary, historic_salary
        from curr_avg_sal
        join historic_avg_sal on curr_avg_sal.dept_name = historic_avg_sal.dept_name);
    select *
    from average_salaries;

    alter table average_salaries add standard_deciation float(10, 2);
    alter table average_salaries add zscore float(10, 2);
    select *
    from average_salaries;

    update average_salaries
    set standard_deciation = historic_salary;
    select *
    from average_salaries;

    update average_salaries
    set zscore = (current_salary - historic_salary) / standard_deciation;
    select *
    from average_salaries;

    select *
    from current_info
    order by zscore desc;


----------------------------------------Ryans version:---------------------------------------------
    create temporary table hirtoric_aggregates as (
        select avg(salary) as avg_salary, std(salary) as salary
        from employees.salaries);
    select *
    from hirtoric_aggregates;

--obtain dept_name, and dept current avg
    create temporary table current_info as(
        select dept_name, avg(salary) as department_current_average
        from employees.salaries
        join employees.dept_emp using (emp_no)
        join employees.departments using (dept_no)
        where employees.dept_emp.to_date > curdate()
        and employees.salaries.to_date > curdate()
        group by dept_name);
    select *
    from current_info;

--create a column to hold (historic average salary, historic std salary, zscore)
    alter table current_info add average float(10, 2);
    alter table current_info add standard_deciation float(10, 2);
    alter table current_info add zscore float(10, 2);
    select *
    from current_info;

    update current_info
    set average = 100;
    select *
    from current_info;
    --the hard coded get it done before lunch solution

    update current_info
    set standard_deviation = (select salary from historic_aggregates);
    select *
    from current_info;

--now we have to find the zscore
    update current_info
    set zscore = (department_current_average - average) / standard_deviation;
    select *
    from current_info;

    select *
    from current_info
    order by zscore desc;

