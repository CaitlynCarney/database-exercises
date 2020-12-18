 use employees;

## For example, to find all the unique titles within the company, we could run the following query. 
List the first 10 distinct last name sorted in descending order.
    select distinct title 
    from titles
    order by title desc
    limit 10;
        # Zykh
        # Zyda
        # Zwicker
        # Zweizig
        # Zumaque
        # Zultner
        # Zucker
        # Zuberek
        # Zschoche
        # Zongker

## Find all previous or current employees hired in the 90s and born on Christmas. Find the first 
5 employees hired in the 90''s by sorting by hire date and limiting your results to the first 5 
records. Write a comment in your code that lists the five names of the employees returned.
    select *
    from employees
    where hire_date
    like '199%-%-%'
    and birth_date
    like '%%%%-12-25'
    order by hire_date asc
    limit 5;
        # Alselm Cappello
        # Utz Mandell
        # Bouchund Schreiter
        # Baocai Kushner
        # Petter Stroustrup

## LIMIT and OFFSET can be used to create multiple pages of data. What is the relationship between OFFSET 	
(number of results to skip), LIMIT (number of results per page), and the page number?
    select *
    from employees
    where hire_date
    like '199%-%-%'
    and birth_date
    like '%%%%-12-25'
    order by hire_date asc
    limit 5 offset 45;
        # Pranay Narwekar
        # Marjo Farrow
        # Ennio Karcich
        # Dines Lubachevsky
        # Ipke Fontan
            # Limit limits the amount of results and offset sets where the results 
            will start. By breaking them up into these sets you are creating pages of datae