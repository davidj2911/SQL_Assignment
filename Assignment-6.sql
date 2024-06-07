use ecommerce;

create table sales_data (
    product_id int,
    sale_date date,
    quantity_sold int
);

insert into sales_data (product_id, sale_date, quantity_sold) values
(1, '2022-01-01', 20),(2, '2022-01-01', 15),(1, '2022-01-02', 10),(2, '2022-01-02', 25),
(1, '2022-01-03', 30),(2, '2022-01-03', 18),(1, '2022-01-04', 12),(2, '2022-01-04', 22);


select * from sales_data;

-- assign rank by partition based on product_id and in each product id find the lowest sold quantity

select product_id, sale_date,quantity_sold,
       rank() OVER (PARTITION BY product_id ORDER BY quantity_sold desc) as rank
from sales_data;

select distinct product_id, min(quantity_sold) OVER (PARTITION BY product_id) as lowest_sold_quantity
from sales_data
group by product_id,quantity_sold;

-- retrieves the value from a previous row in the result set, retrieves the value from the next row. 

select product_id, sale_date,quantity_sold,
       lag(quantity_sold) OVER (PARTITION BY product_id ORDER BY sale_date) AS previous_value,
	   lead(quantity_sold) OVER (PARTITION BY product_id ORDER BY sale_date) AS next_value
from sales_data;

--return the first and last values in an ordered set, respectively. 

select product_id, sale_date,quantity_sold,
FIRST_VALUE(quantity_sold) over (partition by product_id order by sale_date) as first_value,
Last_VALUE(quantity_sold) over (partition by product_id order by sale_date 
rows between unbounded preceding and unbounded following) as last_value
from sales_data;
