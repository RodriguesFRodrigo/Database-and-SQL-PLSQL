-- funções de conversão para maisculas e minusculas.
select employee_id, last_name, department_id
from rodrigo_rodrigues.employees
where upper(last_name) = 'king';

select initcap(job_id)
from rodrigo_rodrigues.employees;

-- funções de manipulação de caracteres.
select concat('the', 'rock') from dual;
select substr('adão negro - the rock', 1, 4) from dual;
select length('adão negro - the rock') from dual;
-- posição inicial da substring.
select instr('adão negro - the rock', 'the rock') from dual;
select replace('therock@localhost.com.us', 'us', 'br') from dual;
select trim('     adão negro     ') from dual;
select trim(';' from ';adão negro;') from dual;

-- funções de números.
select round(26.9101112, 2) from dual; -- 0 < 5
select round(26.9171112, 2) from dual; -- 7 > 5
select trunc(26.9101112, 2) from dual;
select trunc(26.9171112, 2) from dual;

-- funções para manipular datas.
select sysdate from dual;
select sysdate+30 from dual;
select sysdate-30 from dual;
-- diferença de duas datas em meses.
select months_between(to_date('22-11-2022', 'dd-mm-yyyy'), to_date('22-09-2022', 'dd-mm-yyyy')) from dual;
-- adicionar meses.
select add_months(to_date('25-09-2022', 'dd-mm-yyyy'),3) from dual;
-- próximo dia relativo a data especificada.
select next_day(to_date('22-09-2022', 'dd-mm-yyyy'), 'segunda feira') from dual;
select next_day(to_date('22-09-2022', 'dd-mm-yyyy'), 'terça feira') from dual;
select next_day(to_date('22-09-2022', 'dd-mm-yyyy'), 'quarta feira') from dual;
select next_day(to_date('22-09-2022', 'dd-mm-yyyy'), 'quinta feira') from dual;
select next_day(to_date('22-09-2022', 'dd-mm-yyyy'), 'sexta feira') from dual;
-- último dia do mês.
select last_day(to_date('22-09-2022', 'dd-mm-yyyy')) from dual;
-- trunc.
select trunc(sysdate) from dual;
-- extract.
select extract(day from date '2003-08-22') from dual;
select extract(month from date '2003-08-22') from dual;
select extract(year from date '2003-08-22') from dual;