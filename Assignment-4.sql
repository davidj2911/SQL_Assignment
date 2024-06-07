use ecommerce;
create table dept_table(id_deptname varchar(50), emp_name varchar(50), salary int);

insert into dept_table(id_deptname, emp_name, salary) values

('1111-MATH', 'RAHUL', 10000), 
('1111-MATH', 'RAKESH', 20000), 
('2222-SCIENCE', 'AKASH', 10000), 
('222-SCIENCE', 'ANDREW', 10000), 
('22-CHEM', 'ANKIT', 25000), 
('3333-CHEM', 'SONIKA', 12000), 
('4444-BIO', 'HITESH', 2300), 
('44-BIO', 'AKSHAY', 10000);

select * from dept_table;

select substring(id_deptname, charindex ('-',id_deptname)+1 , len(id_deptname))as dept, sum(salary) as dept_total
from dept_table
group by substring(id_deptname, charindex ('-',id_deptname)+1 , len(id_deptname));