-- Use the join_example_db. Select all the records from both the users and roles tables.

-- Use join, left join, and right join to combine results from the users and roles tables as we did in 
the lesson. Before you run each query, guess the expected number of results.

# Join
    select *
    from users
    join roles;

# Left Join
    select *
    from users
    left join roles
    on users.role_id = roles.id;

# Right Join
    select *
    from users
    right join roles
    on users.role_id = roles.id;

-- Although not explicitly covered in the lesson, aggregate functions like count can be used with join  
-- queries. Use count and the appropriate join type to get a list of roles along with the number of users 
-- that has the role. Hint: You will also need to use group by in the query.
    select roles.name as role_name, count(users.id)
    from users
    right join roles
    on users.role_id = roles.id
    group by role_name;
        -- The reason count has roles.name is because role_name has not finished running.
        -- By useing users.id it wont be counting NUll as a user but rather count NULL as 0.

--Use the employees database.

--Using the example in the Associative Table Joins section as a guide, write a query that shows each 
--department along with the name of the current manager for that department.
    select first_name, last_name, to_date, dept_manager.dept_no, departments.dept_name
    from employees
    join dept_manager on employees.emp_no = dept_manager.emp_no
    join departments on dept_manager.dept_no = departments.dept_no
    where to_date > curdate();
        -- We have to have a key in common between tables in order to join
        -- Title is not nesicarily important to this query

--Find the name of all departments currently managed by women.
    select first_name, last_name, to_date, dept_manager.dept_no, departments.dept_name, gender
    from employees
    join dept_manager on employees.emp_no = dept_manager.emp_no
    join departments on dept_manager.dept_no = departments.dept_no
    where to_date > curdate()
    and gender = 'F';

--Find the current titles of employees currently working in the Customer Service department.
    select dept_emp.to_date, title, dept_emp.emp_no, dept_name
    from dept_emp
    join titles on titles.emp_no = dept_emp.emp_no
    join departments on dept_emp.dept_no = departments.dept_no
    where dept_emp.to_date > curdate()
    and titles.to_date > curdate()
    and dept_name = 'Customer Service';
    -- There is not one to_date to rule them all. This aint Lord of the Rings. Make sure that to_date is > 
        curdate for all to_date options.

-OR-

    select title, count(*)
    from dept_emp
    join titles on titles.emp_no = dept_emp.emp_no
    join departments on dept_emp.dept_no = departments.dept_no
    where dept_emp.to_date > curdate()
    and titles.to_date > curdate()
    and dept_name = 'Customer Service'
    group by titles.title;
        -- This one counts the number of employees with a specific title.
        -- This question can be taken in 2 different ways

--Find the current salary of all current managers.
    select dept_manager.emp_no, dept_manager.dept_no, dept_manager.to_date, salary, title
    from dept_manager
    join salaries on salaries.emp_no = dept_manager.emp_no
    join titles on titles.emp_no = dept_manager.emp_no
    where titles.to_date > curdate()
    and salaries.to_date > curdate()
    and dept_manager.to_date > curdate();
        #It helps to start a query with select * then change later

--Find the number of current employees in each department.
    select emp_no, dept_emp.dept_no, dept_name, to_date
    from dept_emp
    join departments on departments.dept_no = dept_emp.dept_no
    where dept_emp.to_date > curdate();

--Which department has the highest average salary? Hint: Use current not historic information.
    select departments.dept_name, avg(salary)
    from dept_emp
    join salaries on salaries.emp_no = dept_emp.emp_no
    join departments on dept_emp.dept_no = departments.dept_no
    where salaries.to_date > curdate()
    and dept_emp.to_date > curdate()
    group by dept_name desc
    limit 1;

--Who is the highest paid employee in the Marketing department?
    select salaries.emp_no, salary, dept_name
    from dept_emp
    join salaries on salaries.emp_no = dept_emp.emp_no
    join departments on dept_emp.dept_no = departments.dept_no
    where salaries.to_date > curdate()
    and dept_emp.to_date > curdate()
    and dept_name = 'Marketing'
    order by salary desc
    limit 1;

--Which current department manager has the highest salary?
    select dept_manager.emp_no, dept_manager.dept_no, dept_manager.to_date, salary, title
    from dept_manager
    join salaries on salaries.emp_no = dept_manager.emp_no
    join titles on titles.emp_no = dept_manager.emp_no
    where titles.to_date > curdate()
    and salaries.to_date > curdate()
    and dept_manager.to_date > curdate()
    order by salary desc
    limit 1;

-- Create query to get current employee names and dept names and manager names by joining subquery above.

    select concat(employees.first_name, "", employees.last_name) as "Employee name", dept_name, 
    concat(managers.first_name, "", managers.last_name) as "Managers name"
    from employees
    join dept_emp using(emp_no)
    join departments using (dept_no)
    join dept_manager using(dept_no)
    join employees as managers on managers.emp_no = dept_manager.emp_no
        -- the "join employees as manager on ______" is like that befcause if you type out "join employess" 
        -- it will not work because you cant add employees on twice. But by chancing the alias allows you 
        -- to add it again.

-OR-

    SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name', d.dept_name AS 'Department Name', 
    m.managers AS 'Manager Name'
    FROM employees AS e
    JOIN dept_emp AS de ON de.emp_no = e.emp_no
    AND de.to_date > CURDATE()
    JOIN departments AS d ON de.dept_no = d.dept_no 
    JOIN (SELECT dm.dept_no, CONCAT(e.first_name, ' ', e.last_name) AS managers
    FROM employees AS e
    JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
    AND to_date > CURDATE()) AS m ON m.dept_no = d.dept_no
    ORDER BY d.dept_name;

--Bonus Who is the highest paid employee within each department.
    select first_name, last_name, salary, dept_name
    from employees
    join salaries on salaries.emp_no = employees.emp_no
    join dept_emp on dept_emp.emp_no = employees.emp_no
    join departments on departments.dept_no = dept_emp.dept_no
    where salary in (
        select max(salary)
        from employees
        join salaries on salaries.emp_no = employees.emp_no
        join dept_emp on dept_emp.emp_no = employees.emp_no
        join departments on departments.dept_no = dept_emp.dept_no
        group by dept_name
    )
    and salaries.to_date > curdate()
    and dept_emp.to_date > curdate();


