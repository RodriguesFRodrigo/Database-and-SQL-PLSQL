-- utilizando o comando update.

-- update utilizado equivocadamente.
update rodrigo_rodrigues.employees set salary = salary * 1.2;
-- desfaz a transação.
rollback;

-- update utilizado corretamente com a clausura where.
update rodrigo_rodrigues.employees set salary = salary * 1.2
where last_name = 'king';
commit;


-- utilizando update com insert.
update rodrigo_rodrigues.employees
set job_id = (select job_id -- single row.
              from rodrigo_rodrigues.employees
              where employee_id = 141),
    salary = (select salary -- single row.
              from rodrigo_rodrigues.employees
              where employee_id = 141)
where employee_id = 140;
commit;