select
  emp_id,
  emp_name,
  hire_date,
  salary
from employees
order by emp_name; -- by default asc.

select
  emp_id,
  emp_name,
  hire_date,
  salary
from employees
order by emp_name asc; -- using asc.

select
  emp_id,
  emp_name,
  hire_date,
  salary
from employees
order by emp_name desc; -- using desc.

select
  emp_id,
  emp_name,
  hire_date,
  salary as empsalary
from employees
order by empsalary; -- using alias.

select
  *
from employees
order by salary/2; -- using expression.

select
  *
from employees
order by floor(salary/2); -- using expression.

select 
  *
from employees
order by dept_id nulls first; -- using nulls first.

select 
  *
from employees
order by dept_id nulls last; -- using nulls last.

select
*
from employees
order by dept_id, salary; -- ordena pelo dept_id e quando dept_id for igual ordena por salary.

select
*
from employees
order by dept_id asc, salary desc; -- ordena pelo dept_id e quando dept_id for igual ordena por salary descendente1.