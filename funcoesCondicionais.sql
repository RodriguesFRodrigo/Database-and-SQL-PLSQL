-- utilizando a função nvl.

select
  nvl(null, 0)
from dual;

select 
  last_name, 
  salary, 
  nvl(commission_pct, 0), 
  salary*12 salario_anual, 
 (salary*12) + (salary*12*nvl(commission_pct, 0)) remuneracao_anual
from employees;

-- utilizando a função coalesce.

select 
  coalesce(null, null, 'expresssão 3'), 
  coalesce(null, 'expressão 2', 'expresssão 3'),
  coalesce('expressão 1', 'expressão 2', 'expresssão 3')
from dual;

select 
  last_name, 
  employee_id, 
  commission_pct, 
  manager_id, 
  coalesce(to_char(commission_pct),to_char(manager_id), 'sem percentual de comissão e sem gerente')
from employees;

-- utilizando a função nvl2.

select nvl2('não é null', 1, 0) from dual;
select nvl2(null, 1, 0) from dual;

-- utilizando a função nullif.

select nullif(1000, 1000) from dual;
select nullif(1000, 2000) from dual;

-- utilizando a função case no select.

select 
  last_name, 
  job_id, 
  salary,
  case job_id
    when 'it_prog'   
      then 1.10*salary
    when 'st_clerk' 
      then 1.15*salary
    when 'sa_rep' 
      then 1.20*salary
    else salary 
    end "novo salario"
from employees;

-- utilizando a função decode.

select
  decode(1, 1, 'true',
            0, 'false',
            -1, 'undefined')
from dual;
