-- A função de uma sequence é gerar números sequenciais.
-- Usado para gerar valores que geram números para chaves primarias.

-- Consulta o número total de empregados, para gerar um sequence a partir do número máximo.
select max(employee_id)
from rodrigo_rodrigues.employees;

-- Delete a sequence caso exista.
drop sequence employees_seq;

-- Cria sequence.
create sequence employees_seq
start with 221
increment by 1
nomaxvalue
nocache
nocycle;

-- Consultando dicionario de sequences.
select * from user_sequences;

-- Pseudocolunas.
-- nextval: retorna o proximo valor da sequencia.
-- currval: retorna o valor atual da sequencia.

-- Recuperando o proximo valor da sequence.
-- Só utilize nextval se for realizar um insert para não criar buracos.
select employees_seq.nextval 
from  dual;

-- Recuperando o valor atual da sequence.
select employees_seq.currval
from   dual;

-- Utilizando sequence na pratica.
-- A coluna id recebe o valor da sequence.nextval.
insert into employees (
  employee_id, 
  first_name, 
  last_name, 
  email, 
  phone_number,
  hire_date,
  job_id,
  salary,
  commission_pct,
  manager_id,
  department_id
)
values (
  employees_seq.nextval,
  'paul',
  'simon',
  'psimo',
  '525.342.237',
  to_date('12/02/2020', 'dd/mm/yyyy'),
  'it_prog',
  15000,
  null,
  103,
  60
);

-- Rollback não desfazer a númeração da sequence

-- Quando ocorre buraco na sequence.
-- Insert falha e faz rollback, temos que garantir o commit.
-- Crash do SO ou BDA.
-- A sequencia é utilizada em outra tabela.