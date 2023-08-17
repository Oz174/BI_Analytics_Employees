

-- this is correct but slow 
select gender , dept_name , round(avg(salary),2) as average_salary , year(s.to_date) as calender_year
from t_employees e
cross join t_departments d 
join t_salaries s on s.emp_no = e.emp_no 
where s.to_date <= '2002-01-01'
group by gender , dept_name , calender_year
order by gender , dept_name  
; 

-- this is correct and fast 
select 
e.gender , d.dept_name , round(avg(s.salary),2) as average_salary , year(s.from_date) as calender_year 
from t_salaries s 
join t_employees e on e.emp_no = s.emp_no 
join t_dept_emp de on de.emp_no = s.emp_no 
join t_departments d on d.dept_no = de.dept_no 
group by e.gender , d.dept_name , calender_year  
having calender_year <= 2002 
order by e.gender , d.dept_name asc; 
