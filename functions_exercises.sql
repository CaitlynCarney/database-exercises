use employees;

## Write a query to to find all current employees whose last name starts and ends with 'E'. Use concat() 
to combine their first and last name together as a single column named full_name.

    select concat(first_name, " ", last_name) as full_name
    from employees
    where last_name
    like 'e%e';

## Find all previous employees hired in the 90s and born on Christmas. Use datediff() function to find 
how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),

    select datediff( hire_date, curdate() ) as employed_days
    from employees
    where hire_date
    like '199%-%-%'
    and birth_date
    like '%%%%-12-25'

## Find the smallest and largest current salary from the salaries table.
    select min(salary) as minimun_current_salary
    from salaries
    where to_date > curdate();

    select max(salary) as maximum_current_salary
    from salaries
    where to_date < curdate();

    # best way of doing it
        select min(salary) as smallest_salary,
            max(salary) as largest_salary
        from salaries;

## Use your knowledge of built in SQL functions to generate a username for all of the current and 
previous employees. A username should be all lowercase, and consist of the first character of the 
employees first name, the first 4 characters of the employees last name, an underscore, the month the 
employee was born, and the last two digits of the year that they were born. Below is an example of what 
the first 10 rows will look like:

    select LOWER(concat(substr(first_name,1, 1), substr(last_name, 1, 4), "_", substr(birth_date, 6, 2), 
    substr(birth_date, 3, 2))) as user_name
    from employees;
