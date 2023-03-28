-- utilizando a função to_char com datas.

-- data -> char: to_char.
-- hh24: 0 - 23.
select 
  last_name,
  to_char(hire_date, 'dd/mm/yyyy  hh24:mi:ss') dt_admissâo
from employees;

-- data -> char: to_char.
-- hh24: 0 - 23.
select 
  sysdate,
  to_char(sysdate, 'dd/mm/yyyy  hh24:mi:ss') data
from  dual;

-- mês: usa 9 caracteres para exibir o mês (descrito).
-- meses com menos de 9 caracteres também usarão 9 caracteres.
select 
  last_name, 
  to_char(hire_date, 'dd, "de" month "de" yyyy') dt_admissâo
from employees;

-- fm: remova os zeros à esquerda e remova os espaços extras.
select 
  last_name, 
  to_char(hire_date, 'fmdd, "de" month "de" yyyy') dt_admissâo
from employees;

select 
  last_name,
  to_char(hire_date, 'fmdd/mm/yyyy  hh24:mi:ss') dt_admissâo
from employees;

-- utilizando a função to_char com números.

-- símbolo da moeda definida pelo parâmetro nls_currency.
select 
  first_name,
  last_name, 
  to_char(salary, 'l99g999g999d99') salario
from employees;

-- utilizando a função to_number.

select 
  to_number('$12000,50')  
from  dual;

-- utilizando a função to_date.

-- char -> date
select to_date('06/02/2020','dd/mm/yyyy') data
from  dual;