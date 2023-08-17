-- Compare the number of male managers to the number of female managers from different departments for each year, starting from 1990.
select d.dept_name , ee.gender , dm.emp_no ,  dm.from_date , dm.to_date , e.calender_year , 
CASE 
    WHEN e.calender_year BETWEEN year(dm.from_date) AND year(dm.to_date) THEN 1
    ELSE 0
  END AS is_active
from 
(select year(hire_date) as calender_year 
from t_employees group by calender_year) as e
cross join 
t_dept_manager dm 
join 
t_departments d on d.dept_no = dm.dept_no 
join 
t_employees ee on ee.emp_no = dm.emp_no
order by dm.emp_no , e.calender_year ; 

-- for each manager , cross join the year from 1990 to see if active and then count number of active managers

select * 
from (select year(hire_date) as calender from t_employees order by calender) as e 
cross join 
t_dept_manager dm 
join 
t_departments d on d.dept_no = dm.dept_no 
join 
t_employees ee on ee.emp_no = dm.emp_no ;

select year(hire_date) as calender from t_employees order by calender; -- group by zy distinct lw mafish aggregate function bt7sb 7aga 
select distinct year(hire_date) as calender from t_employees ; --yields the same result 
