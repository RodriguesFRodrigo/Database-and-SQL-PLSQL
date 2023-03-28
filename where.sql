-- usa a cláusula "where" com dois critérios para selecionar todos os funcionários com salário entre 2200 e 5000.
select * 
from employees
where salary >= 2200 and salary <= 5000

-- usa a cláusula "where" com o operador "or" para selecionar todos os funcionários com salário menor ou igual a 2200 ou maior ou igual a 5000.
select * 
from employees
where salary <= 2200 or salary >= 5000

-- usa a cláusula "where" com o operador "in" para selecionar todos os funcionários com salário igual a 4000, 5000, 6000, 7000 ou 8000.
select *
from employees
-- salary = 4000 or salary = 5000 or ...
where salary in (4000, 5000, 6000, 7000, 8000)

-- usa a cláusula "where" com o operador "between" para selecionar todos os funcionários com salário entre 4000 e 8000.
select *
from employees
-- where salary >= 4000 or salary <= 8000;
where salary between 4000 and 8000;

-- usa a cláusula "where" com a função "like" e o caractere curinga "%" para selecionar todos os funcionários cujos nomes começam com a letra "s".
select *
from employees
where emp_name like 's%'
