-- utilizando o comando insert.
-- colunas informadas.
-- não necessitar ser na ordem da tabela.
insert into rodrigo_rodrigues.departments (
  department_id,
  department_name,
  manager_id,
  location_id
) values (
  280,
  'project management',
  103,
  1400
);

-- utilizando o comanod insert sem informar as colunas.
  - necessitar seguir a ordem da tabela.

insert into rodrigo_rodrigues.departments
values (
  300,
  'bussines inteligence',
  null,
  null
);

-- inserindo linhas com valores nulos.
-- metodo implicito.
-- informa o valor null para as respectivas colunas.
insert into rodrigo_rodrigues.departments
values (301, 'inovation studio', null, null);

  -- metodo explicito.
insert into rodrigo_rodrigues.departments(
  department_name,
  department_id
)
values (
  'business inovation',
  300
);

-- inserindo valores que retornam de funções.

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
  sysdate, -- valor retornado de uma função.
  'it_prog',
  7000,
  null, 
  103, 
  60
  );

-- utilizando variáveis de substituição no insert.

-- encerra todas as transações.
commit;