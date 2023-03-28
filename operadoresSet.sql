-- utilizando o operador union.
-- elimina as duplicidades.
-- mais lento que o union all.
-- para eliminar as duplicidades o union ordena os dois conjuntos para comparar as linhas.

select employee_id, job_id, hire_date, salary -- conjunto 1.
from   rodrigo_rodrigues.employees
where  department_id in (60, 90, 100)
union
select employee_id, job_id, hire_date, salary -- conjunto 2.
from   rodrigo_rodrigues.employees
where  job_id = 'it_prog'
order by employee_id;

-- utilizando o operador union all.
-- não elimina as duplicidades.
select employee_id, job_id, hire_date, salary -- conjunto 1.
from   rodrigo_rodrigues.employees
where  job_id = 'it_prog'
union all
select employee_id, job_id, hire_date, salary -- conjunto 2.
from   rodrigo_rodrigues.employees
where  department_id = 60
order by employee_id;

-- operador intersect.
-- intersecção entre os conjuntos ( linhas comuns ).
-- todas colunas/expressões do conjunto a são iguais a todas colunas/expressões do conjunto b.
select employee_id, job_id
from rodrigo_rodrigues.employees
where job_id = 'it_prog'
intersect
select employee_id, job_id
from rodrigo_rodrigues.employees
where department_id in (60, 90, 100)
order by employee_id;

-- operador minus.
-- linhas do primeiro conjunto que não estão no segundo conjunto.
select employee_id, job_id -- conjunto 1.
from rodrigo_rodrigues.employees
where department_id in (60, 90, 100)
minus
select employee_id, job_id --  conjunto 2.
from rodrigo_rodrigues.employees
where job_id = 'it_prog'
order by employee_id;

-- utilizando mais de um operador set.
select employee_id, job_id, hire_date, salary
from employees
where department_id in (60, 90, 100)
union
(select employee_id, job_id, hire_date, salary
from employees
where job_id = 'it_prog'
intersect
select employee_id, job_id, hire_date, salary
from employees
where salary > 10000)
order by employee_id;