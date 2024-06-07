use ecommerce;

create table email_signup(id int, email_id varchar(100), signup_date date);

insert into email_signup (id, email_id, signup_date) values
(1, 'Rajesh@Gmail.com', '2022-02-01'),(2, 'Rakesh_gmail@rediffmail.com', '2023-01-22'),
(3, 'Hitest@Gmail.com', '2020-09-08'),(4, 'Salil@Gmmail.com', '2019-07-05'),
(5, 'Himanshu@Yahoo.com', '2023-05-09'),(6, 'Hitesh@Twitter.com', '2015-01-01'),
(7, 'Rakesh@facebook.com', null);

-- Write a query to find gmail accounts with latest and first signup date and difference between both the dates

select email_id, max(signup_date) as latest_signup, min(signup_date) as first_signup,
          DATEDIFF(day, max(signup_date), min(signup_date)) as diff_in_days

from email_signup
where email_id like '%@gmail.com'

group by email_id;

-- also write the query to replace null value with ‘1970-01-01’

update email_signup
set signup_date = '1970-01-01'
where id = 7 and email_id = 'Rakesh@facebook.com';


select signup_date from email_signup
where id = 7;