-- MYSQL Assignment 2
use employees;
-- 1
select gender, count(gender) from employees group by gender order by gender desc;
-- 2
SELECT Date_format(hire_date, '%M') AS hire_month, COUNT(*) AS total_hires
FROM employees
GROUP BY hire_month
ORDER BY total_hires DESC;
-- 3
select first_name, last_name, gender from employees where first_name in ('Kellie','Aruna') and gender = 'F';
-- 4	
select dept_name, dept_no from departments where dept_no between 'd003' and 'd006';
-- 5
select count(distinct emp_no);
-- 6
select concat(first_name," ",last_name) "Name" , gender from employees where gender = 'F' and  year(hire_date) >= 2000;
-- 7
SELECT t.title, round(avg (s.salary),2) "Average" from titles t  
inner join salaries s on t.emp_no = s.emp_no 
group by t.title order by Average desc;
-- 8
select e.first_name, e.last_name, count(de.dept_no) "Number_of_departments" from employees e 
inner join dept_emp de on e.emp_no  = de.emp_no group by de.emp_no
having Number_of_departments >=  2 order by e.first_name, e.last_name;
-- 9
select concat(e.first_name," ",e.last_name) "Name", s.salary from employees e join salaries s on e.emp_no = s.emp_no
where s.salary < (select max(salary) from salaries)
order by s.salary desc limit 1;
-- 10
select concat(e.first_name," ",e.last_name) "Name", s.salary from employees e join salaries s on e.emp_no = s.emp_no
where s.salary < (select max(salary) from salaries)
order by s.salary desc limit 1,1;
-- 11 
select departments.dept_name, min(timestampdiff(year,e.birth_Date,e.hire_date)) as age_hire_Date 
from employees e join dept_emp on e.emp_no = dept_emp.emp_no join departments on 
departments.dept_no = dept_emp.dept_no group by departments.dept_name;
-- 12
select e.first_name, dept.dept_name from employees e
join dept_Emp de on e.emp_no = de.emp_no
join departments dept on de.dept_no = dept.dept_no
where e.first_name not like '%A%'
and e.first_name not like '%E%'
and e.first_name not like '%I%'
and e.first_name not like '%O%'
and e.first_name not like '%U%'