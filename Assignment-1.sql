create database ecommerce;
use ecommerce;

-- 2.Create 4 tables (gold_member_users, users, sales, product) under the above database(ecommerce) 

create table gold_member_users(
userid varchar(50), signup_date date);

create table users(
userid varchar(50), signup_date date );

create table sales(
userid varchar(50), created_date date, product_id int);

create table product(
product_id int, product_name varchar(50), price int);

-- 3.Insert the values provided above with respective datatypes 

insert into gold_member_users (userid, signup_date) values
('John','09-22-2017'), ('Mary','04-21-2017') ;

insert into users (userid, signup_date) values
('John','09-02-2014'), ('Michel','01-15-2015'), ('Mary','04-11-2014') ;

insert into sales(userid, created_date, product_id) values
('John','04-19-2017',2), ('Mary','12-18-2019',1), ('Michel','07-20-2020',3), 
('John','10-23-2019',2), ('John','03-19-2018',3), ('Mary','12-20-2016',2), 
('John','11-09-2016',1), ('John','05-20-2016',3), ('Michel','09-24-2017',1),
('John','03-11-2017',2), ('John','03-11-2016',1), ('Mary','11-10-2016',1), ('Mary','12-07-2017',2) ;

insert into product(product_id, product_name, price) values
(1,'Mobile',980), (2,'Ipad',870), (3,'Laptop',330) ;

-- 4.Show all the tables in the same database(ecommerce) 

SELECT * FROM INFORMATION_SCHEMA.tables;
-- can also use : select name from sys.tables;

-- 5.Count all the records of all four tables using single query 

select (select count(*) from gold_member_users) as gold_count,
(select count(*) from users) as normal_count,
(select count(*) from sales) as sales_count,
(select count(*) from product )as product_count;

-- 6.What is the total amount each customer spent on ecommerce company 

select sales.userid, sum(product.price) as amount_spent
from sales
join product on sales.product_id = product.product_id
group by sales.userid;

-- 7.Find the distinct dates of each customer visited the website: 

select distinct created_date, userid from sales as distinct_dates;

-- 8.Find the first product purchased by each customer using 3 tables(users, sales, product) 

select sales.userid, product.product_name, min(created_date) as first_purchase
from users
join sales on users.userid = sales.userid
join product on sales.product_id = product.product_id
group by sales.userid, product.product_name
order by first_purchase;

/* 9.What is the most purchased item of each customer and 
how many times the customer has purchased it: output should have 2 columns 
count of the items as item_count and customer name */

select count(sales.product_id) as item_count, sales.userid
from sales
group by sales.userid
order by item_count desc;

-- 10.Find out the customer who is not the gold_member_user 

select userid from users where userid not in (select userid from gold_member_users);

-- 11.What is the amount spent by each customer when he was the gold_member user 

SELECT g.userid, sum(p.price) as amount_spent
from gold_member_users g
join sales s on g.userid = s.userid
join product p on s.product_id = p.product_id
where s.created_date >= g.signup_date
group by g.userid;

-- 12.Find the Customers names whose name starts with M 

select userid from users where userid like 'M%';

-- 13.Find the Distinct customer Id of each customer 

select distinct userid from users;

-- 14.Change the Column name from product table as price_value from price 

exec sp_rename 'product.price', 'price_value', 'column';

-- 15.Change the Column value product_name – Ipad to Iphone from product table 

update product set product_name = 'Iphone' where product_name = 'Ipad';

-- 16.Change the table name of gold_member_users to gold_membership_users 

exec sp_rename 'gold_member_users', 'gold_membership_users';

/* 17.Create a new column  as Status in the table crate above gold_membership_users  
the Status values should be 2 Yes and No if the user is gold member, then status should be Yes else No. */

alter table gold_membership_users
add Status varchar(3);
update gold_membership_users
set Status = 'Yes';

/* 18.Delete the users_ids 1,2 from users table and 
roll the back changes once both the rows are deleted one by one mention the result when performed roll back */

begin transaction;
delete from users where userid = 'John';
rollback transaction;

select userid from users;

begin transaction;
delete from users where userid = 'Mary';
rollback transaction;

select userid from users;

--19.Insert one more record as same (3,'Laptop',330) as product table 

insert into product values (3,'Laptop',330);

select * from product;

-- 20.Write a query to find the duplicates in product table 

SELECT product_name, (COUNT(*)-1) as No_of_Duplicates
FROM product
GROUP BY product_name
HAVING COUNT(*) > 1;














