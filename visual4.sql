select d.dept_name , e.gender , round(avg(s.salary),2) as avg_salary 
from t_salaries s 
join t_employees e on e.emp_no = s.emp_no
join t_dept_emp de on s.emp_no = de.emp_no
join t_departments d on d.dept_no = de.dept_no 
where s.salary between 30000 and 40000
group by d.dept_name , e.gender 
order by d.dept_name , e.gender asc; 