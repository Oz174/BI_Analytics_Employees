select e.gender , count(gender) as num_of_employees , year(e.hire_date) as calender_year 
from 
t_employees e
join t_dept_emp de on de.emp_no = e.emp_no 
group by e.gender , calender_year 
having calender_year >= 1990 
order by calender_year;

select * from t_employees e , t_dept_emp de
where e.emp_no = de.emp_no and e.hire_date = de.from_date ; 

select distinct emp_no , from_date , to_date  from t_dept_emp ; -- lazem tt2kd eno el records distinct , eno y-count s7 
select  emp_no , from_date , to_date from t_dept_emp ;

select count(emp_no) from t_employees ;
