create database online_food_del;
use online_food_del;

-- create table (cust--rest---menu---order---order_det)

create table customers
(customer_id int primary key,
customer_name varchar(60),
email varchar(60),
city varchar(60),
signup_date date
);

-- create restaurant table

create table restaurant
(restaurant_id int primary key,
rest_name varchar(60),
city varchar(60),
reg_date date); 

-- create menu_item table

create table menu_item
(item_id int primary key,
restaurant_id int,
item_name varchar(60),
price decimal(10,2),
constraint fk_menu_rest
foreign key (restaurant_id)
references restaurant(restaurant_id));

-- create table order

create table orders
(order_id int primary key,
customer_id int,
restaurant_id int,
order_date date,
foreign key (customer_id) references customers(customer_id),
foreign key (restaurant_id) references restaurant(restaurant_id)
);

-- create table order_details

create table order_details
(order_detail_id int primary key ,
order_id int,
item_id int,
quantity int,
foreign key (order_id) references orders(order_id),
foreign key (item_id ) references menu_item(item_id)
);






