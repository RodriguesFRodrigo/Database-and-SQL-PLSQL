-- quando uma transação termina?
-- quando um commit ou rollback for executado.
-- um comando dml ou dcl executa um commit automatico.
-- quando você encerra a sessão no sql-developer ou sql-plus.
-- sql-developer, quando tem uma transação pendente um alerta é enviado pergutando se você desejar fazer commit ou rollback.
-- sql-plus, encerra a sessão e realiza um commit se você utilizar o exit.
-- crash do sistema, rede, sistema operacional, banco de dados, etc... sofre um rollback.

-- utilizando o comando commit.
-- utilizando savepoint.

delete from rodrigo_rodrigues.employees
where employee_id in (207,208);

-- transação delete encerrada.
commit;

insert into rodrigo_rodrigues.employees (
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
  207,
  'rock',
  'balboa',
  'drock',
  '525.342.237',
  sysdate,
  'it_prog',
  7000,
  null,
  103,
  60
);

savepoint a;

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
) values (
  208,
  'vito',
  'corleone',
  'vcorl',
  '525.342.237',
  to_date('11/02/2020', 'dd/mm/yyyy'),
  'it_prog',
  20000,
  null,
  103,
  60
);

-- desfaz tudo a partir do savepoint a   
rollback to savepoint  a;

-- commit do primeiro insert.
commit; 

select * from rodrigo_rodrigues.employees
order by employee_id desc;