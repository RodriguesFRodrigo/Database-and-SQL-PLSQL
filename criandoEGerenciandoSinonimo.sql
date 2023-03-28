-- Um sinônimo é um objeto do oracle que serve para dar outro nome a outro objeto do oracle.

-- Criando sinônimos.
create synonym departamentos
for rodrigo_rodrigues.departments

-- Utilizando sinônimos.
select *
from departamentos;

-- Remover sinônimo.
drop synonym rodrigo_rodrigues.departamentos;

-- Criando sinônimos publicos.
-- Outros usuários podem acessar.
create public synoym dept
for rodrigo_rodrigues.departments

drop public synonym dept;