create database ecommerce;
use ecommerce;
create table customers(customer_id int primary key, customer_name varchar(100),
city varchar(50), state varchar(50),join_date date );

create table products(
product_id int primary key,
product_name varchar(100),
category varchar(50),
price decimal(10.2)

);
create table orders(
order_id int primary key,
customer_id int,
order_date date,
total_amount decimal(10.2),
 foreign key(customer_id)references
customers(customer_id)
);

create table order_details(
order_detail_id int primary key,
order_id int,
product_id int,
quantity int,
foreign key(order_id)references orders(order_id),
foreign key(product_id)references products(product_id)
);

insert into customers values
(1,'rahul','pune','maharashtra','2023-01-10'),
(2,'amit','mumbai','maharashtra','2023-02-15'),
(3,'sneha','nagpur','maharashtra','2023-03-12'),
(4,'priya','delhi','delhi','2023-04-05'),
(5,'rohan','bangalore','karnataka','2023-05-20');

insert into products values 
(101,'laptop','electronics',50000),
(102,'mobile','electronics',20000),
(103,'shoes','fashion',3000),
(104,'watch','watch',5000),
(105,'headphones','electronics',2000);

update products set category='fashion' where product_name='watch';

insert into orders values
(1001,1,'2023-06-01',70000),
(1002,2,'2023-06-05',20000),
(1003,3,'2023-06-10',8000),
(1004,1,'2023-07-02',5000),
(1005,4,'2023-07-15',50000);

insert into order_details values
(1,1001,101,1),
(2,1001,105,1),
(3,1002,102,1),
(4,1003,103,2),
(5,1004,104,1),
(6,1005,101,1);

select * from customers;

select sum(total_amount) as total_sales from orders;

select customer_id, sum(total_amount) as total_spent
from orders
group by customer_id
order by total_spent desc;

select p.category,sum(od.quantity * p.price)as total_sales
from order_details od
join products p on od.product_id=p.product_id
group by p.category;
