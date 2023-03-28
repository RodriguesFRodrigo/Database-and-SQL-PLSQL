-- Subconsultas multiple row.

-- Utilizando o operador in.
-- Localiza todos os funcionários cujo salário é maior do que algum salário médio departamental.
select employee_id, first_name, last_name
from rodrigo_rodrigues.employees
where salary in (select avg(nvl(salary,0)) -- in (mediadp1, mediadp2, mediadp3, ...), na tupla os valores são dinâmicos resultantes da consulta.
                 from rodrigo_rodrigues.employees
                 group by department_id);

-- Localiza todos os funcionários cujo salário é menor do que algum salário médio departamental.
select employee_id, first_name, last_name
from rodrigo_rodrigues.employees
where salary not in (select avg(nvl(salary,0)) -- in (mediadp1, mediadp2, mediadp3, ...), na tupla os valores são dinâmicos resultantes da consulta.
                 from rodrigo_rodrigues.employees
                 group by department_id);

-- Um erro comum
select employee_id, first_name, last_name
from rodrigo_rodrigues.employees
where salary not in (select department_id, avg(nvl(salary,0)) -- muitos valores na tupla.
                 from rodrigo_rodrigues.employees
                 group by department_id);

-- Utilizando o operador Any.
-- Qualquer coisa de pelo menos um item da subconsulta.
-- Busca os salarios dos empregados que são menor que qualquer salário da subquery.
select employee_id, last_name, job_id, salary
from rodrigo_rodrigues.employees
where salary < any
                  (select salary
                  from rodrigo_rodrigues.employees
                  where job_id = 'IT_PROG');

-- Utilizalando o operador All.
-- Qualquer coisa de todos os item da subconsulta.
-- Todos os salarios dos empregados que são menor que todos os itens da subconsulta.
select employee_id, last_name, job_id, salary
from rodrigo_rodrigues.employees
where salary < all
                  (select salary
                  from rodrigo_rodrigues.employees
                  where job_id = 'IT_PROG');

-- Subconsultas no from.
-- Utilizado quando precisamos criar uma tabela temporária que será usada uma única vez.

select 
  empregados.employee_id, 
  empregados.first_name, 
  empregados.last_name, 
  empregados.job_id, 
  empregados.salary, 
  round(max_salary_job.max_salary,2) max_salary, 
  empregados.salary - round(max_salary_job.max_salary,2) diferenca
from rodrigo_rodrigues.employees empregados
  left join (select e2.job_id, max(e2.salary) max_salary -- tabela temporária.
             from rodrigo_rodrigues.employees e2
             group by e2.job_id) max_salary_job
    on empregados.job_id = max_salary_job.job_id;

-- Subconsultas single-row.
-- A subconsulta deve retornar apenas uma linha.
-- A subconsulta é executada antes da consulta principal.
-- O resultado da subconsulta é utilizado pela consulta principal.

-- Casos de uso.
-- Quais empregados possuem o salário maior do que a média de salários?
-- Primeiro precisamos achar a média (subconsulta).
-- Utilizar subconsulta para achar os salários maiores que a média.

select 
  first_name, 
  last_name, 
  job_id, 
  salary
from rodrigo_rodrigues.employees
where salary > (select avg(nvl(salary, 0))
                from rodrigo_rodrigues.employees);

-- Utilizando Sub-consultas na cláusula having.
-- Agrupa os departamentos pelo maior salário e restringe os departamentos em que o maior salário seja menor que a média salarial.

select 
  e1.department_id, 
  max(e1.salary)
from rodrigo_rodrigues.employees e1
group by e1.department_id
having max(salary) < (select avg(e2.salary)
                      from employees e2)

-- Erros utilizando Sub-consultas Single-Row.

select 
  employee_id, 
  first_name, 
  last_name
from employees
where salary = (select avg(nvl(salary,0)) -- Não é um resultado single-row.
                from employees
                group by department_id);

-- Subconsulta no select.

select 
  first_name, 
  last_name,
  (
    select avg(salary) 
    from rodrigo_rodrigues.employees
  ) max_salary
from rodrigo_rodrigues.employees;