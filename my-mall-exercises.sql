## Navigate to mall_customers database.
    se mall_customers;

## Show men over the age of 50
    select *
    from customers
    where gender 
    in ('male')
    and age > 50;
        # 22 customers

## Show women under the age of 30
    select *
    from customers
    where gender 
    in ('female')
    and age < 30;
        #29 customrs

## Show men over the age of 50 and women under the age of 30

    select *
    from customers
    where gender in ('male') and age > 50 or 
    gender in ('female') and age < 30;
        # 51 customers

## Show men and women with income more than 100 thousand and spending under 50 thousand

    select *
    from customers
    where annual_income > 100 
    or annual_income < 50;
        #86 customers

## Show men and women with income of 20 thousand or less with spending of 30 thousand or more

    select *
    from customers
    where annual_income <= 20
    and spending_score >= 30;
        #   10 customers

## Show customer Id 2, 9, 111, 136, and 200

    select *
    from customers
    where customer_id = '2' or
    customer_id = '9' or
    customer_id = '111' or
    customer_id = '136' or
    customer_id = '200';
        # there are no repeats

## Show ages under 20 making over 70 thousand a year.

    select *
    from customers
    where age < 20 and
    annual_income > 70;
        #2 customers