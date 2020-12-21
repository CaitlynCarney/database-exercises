## Navigate to chipotle database 
 Use chipotle;
 
## Only show orders that cost under $10.75

select *
from orders
where item_price between 0.00 and 10.75;
# 4622 orders

## Show order the cost less than $10.75 where more than 1 item was ordered

select *
from orders
where item_price between 0.00 and 10.75
and quantity = 1;
# 4355 orders

## Show orders where a veggie bowl was ordered.

select *
from orders
where item_name = 'Veggie Bowl';
# 85 orders

## Show order numbers 1-150 and 325-400

select *
from orders
where order_id between 0 and 150 or
order_id between 325 and 400;

## Show order numbers 1-150 and 325-400 made with Sour Cream but not Black Beans

select *
from orders
where order_id between 0 and 150 or
order_id between 325 and 400
and choice_description like '%Sour Cream%'
and choice_description not like '%Black Beans%';
# 405 orders