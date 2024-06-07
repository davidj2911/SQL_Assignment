use ecommerce;

create table product_details(sell_date date, product varchar(50));

insert into product_details (sell_date, product) values
('2020-05-30', 'Headphones'), ('2020-06-01','Pencil'), ('2020-06-02','Mask'), 
('2020-05-30','Basketball'), ('2020-06-01','Book'), ('2020-06-02', ' Mask '), 
('2020-05-30','T-Shirt');

select sell_date, count(distinct product) as prod_sold, STRING_AGG(product, ', ')
from product_details
group by sell_date;