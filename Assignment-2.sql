use ecommerce;

create table persons_new(first_name varchar(50), last_name varchar(50), city varchar(50), age int);

alter table persons_new
add constraint d check (age<21);

-- 1.Insert the  4 records with age less than 21 and atleast one record should have city value as “Mumbai” 

insert into persons_new (first_name, last_name, city, age)values
('virat', 'kohli', 'bengaluru', 15), ('rohit', 'sharma', 'mumbai', 17),
('ms', 'dhoni', 'chennai', 19), ('sachin', 'tendulkar', 'mumbai', 20);

--2.Insert one more record which is greater than 21 and give the result 

insert into persons_new values ('vivian', 'richards', 'delhi', 35);

/* The INSERT statement conflicted with the CHECK constraint "d". 
The conflict occurred in database "ecommerce", table "dbo.persons_new", column 'age'.
The statement has been terminated..*/

--3.Add one more constraint in the same table where city = “Mumbai” 

alter table persons_new
add constraint d1 check(city = 'mumbai');
/* The ALTER TABLE statement conflicted with the CHECK constraint "d1". 
The conflict occurred in database "ecommerce", table "dbo.persons_new", column 'city'.*/

--4.Insert one more record where city = “jaipur” and give the result 
insert into persons_new values 
('saurav', 'ganguly', 'jaipur', 40);

select * from persons_new;


--5. Drop both the Constraints.

alter table persons_new drop constraint d;

insert into persons_new values ('vivian', 'richards', 'delhi', 35);
select * from persons_new; -- new value added successfully into the table


-- 6.Create view where city = ‘Mumbai’ 

create view [mumbai_people] as
select first_name, last_name
from persons_new
where city = 'mumbai';

select * from [mumbai_people];