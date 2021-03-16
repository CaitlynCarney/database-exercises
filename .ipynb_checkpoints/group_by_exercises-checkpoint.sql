## In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles 
have there ever been? Answer that in a comment in your SQL file.

    select distinct title
    from titles;
    # 7 unique titles

## Write a query to to find a list of all unique last names of all employees that start and end with 
'E' using GROUP BY.

    select last_name
    from employees
    where last_name
    like 'e%e'
    group by last_name;
        #5 unique last names

## Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.

    select concat( first_name, " ", last_name ) as full_name, count(*)
    from employees
    where last_name
    like 'e%e'
    group by full_name;

## Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.

    select distinct last_name
    from employees
    where last_name
    like '%q%' 
    and not last_name like '%qu%';
        # Chleq
        # Lindqvist
        # Qiwen

## Add a COUNT() to your results (the query above) and use ORDER BY to make it easier to find employees whose unusual name is shared with others.

    select last_name, count(*)
    from employees
    where last_name
    like '%q%' 
    and not last_name like '%qu%'
    group by last_name asc;
        # Chleq - 189
        # Lindqvist - 190 
        # Qiwen - 168

## Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.

    select first_name, count(*)
    from employees
    where first_name 
    in ('Irena','Vidya', 'Maya')
    group by first_name;
        # Irena - 241
        # Maya - 236
        # Vidya - 232

## Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?

    select LOWER(concat(substr(first_name,1, 1), substr(last_name, 1, 4), "_", substr(birth_date, 6, 2), 
    substr(birth_date, 3, 2))) as user_name, count(*)
    from employees
    group by user_name
    order by count(*) desc;
        #13,251 repeat username.