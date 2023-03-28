-- comando insert para multiplas tabelas.

-- se não utilizarmos o comando insert para múltiplas tabelas.
-- nós precisaremos recuperar (região física / ponteiro / memória) os mesmos dados para cada comando insert executando comando separadamente e isto aumentará a carga de trabalho.
-- insert multiple tables melhoram a perfomance.

-- insert all - incondicional.
-- cada linha retornada pelo subconsulta (subquery) é inserida para cada uma das tabelas destino (target).

drop table rodrigo_rodrigues.salary_history;

-- cria uma tabela chamada salary_history como resultado de um select.
create table rodrigo_rodrigues.salary_history
as
select employee_id, extract(year from hire_date) year, extract(month from hire_date) month, salary, commission_pct
from rodrigo_rodrigues.employees
where hire_date <= sysdate - 365;

select * from rodrigo_rodrigues.salary_history;

-- criando a tabela employees_history.

drop table rodrigo_rodrigues.employees_history;

create table employees_history
as
select employee_id, first_name, last_name, hire_date
from rodrigo_rodrigues.employees
where hire_date <= sysdate - 365;

select * from rodrigo_rodrigues.employees_history;

-- insere o resultado do select em duas tabelas.
insert all
    into rodrigo_rodrigues.employees_history values (employee_id, first_name, last_name, hire_date)
    into rodrigo_rodrigues.salary_history values (employee_id, extract(year from hire_date), extract(month from hire_date), salary, commission_pct)
    select *
    from rodrigo_rodrigues.employees
    where hire_date > sysdate-365;

-- consultando valores inseridos
select * from rodrigo_rodrigues.employees_history where hire_date > sysdate-365;
select * from rodrigo_rodrigues.salary_history where year = '2022';

-- insert all - condicional.
-- cada linha retornada pelo subconsulta (subquery) é inserida para cada uma das tabelas destino (target) quando satisfaz uma condição when.

-- limpando a tabela employees.
delete rodrigo_rodrigues.employees
where employee_id >= 207;

commit;

-- criando a tabela it_programmers.
drop table rodrigo_rodrigues.it_programmers;

create table rodrigo_rodrigues.it_programmers
as
select employee_id, first_name, last_name, hire_date
from rodrigo_rodrigues.employees
where job_id = 'it_prog' 
  and hire_date <= sysdate - 365;
  
select * from rodrigo_rodrigues.it_programmers;

-- criando tabela living_us.

drop table rodrigo_rodrigues.living_in_us;

create table rodrigo_rodrigues.living_in_us
as
select employee_id, first_name, last_name, hire_date
from rodrigo_rodrigues.employees
where (hire_date <= sysdate - 365) 
  and department_id in (select department_id  
                        from rodrigo_rodrigues.departments 
                        where location_id in (select location_id 
                                              from rodrigo_rodrigues.locations
                                              where country_id = 'US'));

select * from rodrigo_rodrigues.employees;

-- inserindo novos empregados.

insert into rodrigo_rodrigues.employees
values (207, 'carl', 'palmer', 'cpalmer', '515.123.8182', sysdate, 'it_prog', 15000,null,103,60);
insert into rodrigo_rodrigues.employees
values (208, 'keith', 'richards', 'krichards', '515.123.8183', sysdate, 'it_prog', 20000,null,103,60);

commit;

insert all
  -- valida condição.
  -- hire_date frem do select.
  when hire_date > sysdate - 365 
  then
    -- insere nas tabelas.
    into rodrigo_rodrigues.employees_history values (employee_id, first_name, last_name, hire_date)
    into rodrigo_rodrigues.salary_history values (employee_id, extract(year from hire_date), extract(month from hire_date), salary, commission_pct)
  -- valida condição.
  when (hire_date > sysdate - 365)
    and (job_id = 'it_prog')
  then 
    -- insere na tabela.
    into rodrigo_rodrigues.it_programmers values (employee_id, first_name, last_name, hire_date)
  -- valida condição.
  when (hire_date > sysdate - 365) 
    and department_id in ( select department_id  
                           from rodrigo_rodrigues.departments 
                           where location_id in (select location_id 
                                                 from rodrigo_rodrigues.locations
                                                 where country_id = 'us'))
  then
  -- insere na tabela.
    into rodrigo_rodrigues.living_in_us values (employee_id, first_name, last_name, hire_date)        
  select *
  from rodrigo_rodrigues.employees
  where hire_date > sysdate-365;