select d.dept_name , e.gender , count(e.gender) as no_of_managers , year(from_date) as calender_year 
from t_dept_manager dm 
join t_employees e on e.emp_no = dm.emp_no 
join t_departments d on d.dept_no = dm.dept_no
group by d.dept_name , e.gender , calender_year 
having calender_year >= 1990 
order by d.dept_name , calender_year;

-- lw ana mwdeelo el table da 3la tableau msh hy3rf yfhm w y-accumlate
-- at year 1999 , 2000 the inactivity of some employees are not shown to us , which makes the case_when more reliable to chaeck for every manager 


-- to be sent to shady 
select emp_no 
from t_dept_manager 
group by emp_no  
having count(emp_no) > 1 ;

-- query whether two managers were hired for the same department at the same time 
select distinct dm1.emp_no , dm1.dept_no , year(dm1.from_date) as contract_begin from t_dept_manager dm1 
join t_dept_manager dm2 on year(dm1.from_date) = year(dm2.from_date) 
where dm1.dept_no = dm2.dept_no and dm1.emp_no != dm2.emp_no
order by contract_begin , dept_no asc; 
 
