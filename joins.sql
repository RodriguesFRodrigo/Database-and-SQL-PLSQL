select
  e.first_name,
  e.salary,
  d.department_name
from rodrigo_rodrigues.employees e
  inner join rodrigo_rodrigues.departments d 
    on e.department_id = d.department_id
order by department_name, salary;

select
  e.first_name,
  e.salary,
  d.department_name
from rodrigo_rodrigues.employees e
  left join rodrigo_rodrigues.departments d 
    on e.department_id = d.department_id
order by department_name, salary;

select
  e.first_name,
  e.salary,
  d.department_name
from rodrigo_rodrigues.employees e
  right join rodrigo_rodrigues.departments d 
    on e.department_id = d.department_id
order by department_name, salary;

select
  e.first_name,
  e.salary,
  d.department_name
from rodrigo_rodrigues.employees e
  full join rodrigo_rodrigues.departments d 
    on e.department_id = d.department_id
order by department_name, salary;
