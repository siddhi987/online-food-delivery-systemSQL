-- 2nd day
-- understand our food ordering system -queries
use online_food_del;
-- 1. find name & price of all food items costing more than 300/-
select item_name,price
from menu_item
where price>300;

-- 2.list top 5 cheapest food items
select item_name,price
from menu_item
order by price asc
limit 5;

-- 3rd day
alter table order_details
rename to order_detail;

-- 1 show all orders along with the restaurant name from which they were placed
select o.order_id,r.rest_name
from orders o
join restaurant r on o.restaurant_id = r.restaurant_id;

-- 2 show customer names and order dates for orders placed in jan 2023
select c.customer_name,o.order_date,o.order_id
from customers c
join  orders o
on c.customer_id=o.customer_id
where o.order_date between '2023-1-1' and '2023-1-31'
limit 5; 

-- 3. list all customers along with their city who placed an on or after '2023-1-1'
select c.customer_name,city
from customers c
join orders o
on c.customer_id = o.order_id
where o.order_date >= '2023-1-1';

-- 4. show restaurant names and order ids for order placed from restaurants in mumbai
select r.rest_name,o.order_id
from restaurant r
join orders o
on r.restaurant_id = o.order_id
where city='mumbai';

-- 5. customers who have ordered from a specific restaurant -'spice palace' 
select customer_name,rest_name
from customers c
join orders o on c.customer_id = o.customer_id
join restaurant r on o.restaurant_id = r.restaurant_id
where r.rest_name = 'spice palace';

-- 4th day
-- 1 count how many orders each customers has placed 
select count(o.order_id),c.customer_name
from customers c join  orders o
on c.customer_id = o.customer_id
group by c.customer_name;

-- 2. show total revenue earned from each city
select sum(m.price*od.quantity) as total_revenue,r.city
from restaurant r 
join menu_item m on r.restaurant_id=m.restaurant_id
join order_detail od on od.item_id=m.item_id
join orders o on o.order_id=od.order_id
group by r.city;

-- 3 find total no of times each food item was ordered
select m.item_name,count(o.order_id) as total_orderd
from menu_item m
join orders o
on m.restaurant_id=o.restaurant_id
group by  item_name;

-- 4 calculate the average order value for each customer city
select c.city , avg(o.order_id) as avg_order
from customers c
join orders o
on c.customer_id=o.customer_id
group by c.city;

-- 5 find how many different food items were ordered per restaurant
select r.rest_name,count(distinct m.item_name) as fooditem_ordered
from restaurant r
join menu_item m
on r.restaurant_id=m.restaurant_id
group by rest_name;

-- 5th day
-- 1 find cities with more than 5 total oders
-- city,total_order--count()
 select r.city,count(o.order_id) as total_order
 from orders o
 join restaurant r on o.restaurant_id=r.restaurant_id
 group by r.city
 having count( o.order_id)>5;
 
 -- 2 show food items that earned more than 1000/- in total revenue
 select m.item_name,sum(m.price*od.quantity) as revenue
 from menu_item m
 join order_detail od on m.item_id=od.item_id
 group by m.item_name
 having sum(m.price*od.quantity)>1000;
 
 -- 3 list customers who placed more than 3 orders
 select c.customer_name
 from customers c
 join orders o
 on c.customer_id=o.customer_id
 group by c.customer_name
 having count(o.order_id) > 3;
 
 -- 4 display menu items that were ordered more than 2 times
 select m.item_name
 from menu_item m
 join orders o
 on m.restaurant_id=o.restaurant_id
 group by item_name
 having count(o.order_id)>2;
 
 -- 5  find categories where the average item price is greater than rs 300
 select item_name ,avg(price)
 from menu_item
 group by item_name
having avg(price) > 300;

 
 
 
 