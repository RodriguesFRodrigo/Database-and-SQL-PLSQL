-- criando e selecionando grupos.
-- sequência lógica
    -- 1. where: aplica a claúsura where para restringir as linhas retornadas.
    -- 2. group by: forma os grupos.
    -- 3. having: restringir os grupos a serem exibidos.
    -- 4. exibir colunas ou expressões do select ordernado pelo critério definido na cláusura order by.

-- para cada department_id terá um grupo e para cada grupo será exibido avg(salary).
select department_id, avg(salary)
from rodrigo_rodrigues.employees
group by department_id;

-- somente é possível exibir colunas/expressões na claúsula group by ou colunas/expressões com funções de grupo.
-- cria um grupo department_id/job_id e para cada gryoi serpa exibido o avg(salary).
select department_id, job_id, sum(salary)
from rodrigo_rodrigues.employees
group by department_id, job_id
order by department_id, job_id;

-- não podemos usar funções de grupo na cláusura where, pois os grupos ainda não foram formados.
-- para resolver este problema devemos usar a cláusura having.
select department_id, max(salary)
from rodrigo_rodrigues.employees
-- os grupos ainda não foram formados.
where max(salary) > 10000
group by department_id;

-- restrigindo grupos com a cláusura having.
select department_id, max(salary)
from   rodrigo_rodrigues.employees
group by department_id
-- todos os grupos em que a média salarial é maior que 10000.
having max(salary)>10000;

-- 1. where: somente as linhas em que o job_id é diferente de 'sa_rep'.
-- 2. group by: cria grupos de job_id e exibe a soma dos salários.
-- 3. having: exibe somente os grupos que possuim a soma dos salários maior que 10000.
-- 4. orderna: pela soma salarial
select job_id, sum(salary) total
from   rodrigo_rodrigues.employees
where  job_id <> 'SA_REP'
group by job_id
having sum(salary) > 10000
order by sum(salary);