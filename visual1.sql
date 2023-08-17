-- Create a visualization that provides a breakdown between the male and female employees working in the company each year, starting from 1990. 
select year(d.from_date) as calender_year , e.gender , count(e.emp_no) as num_of_employees
from t_dept_emp d 
join t_employees e
on e.emp_no = d.emp_no
group by year(d.from_date) , e.gender
having calender_year >= 1990
order by calender_year; 