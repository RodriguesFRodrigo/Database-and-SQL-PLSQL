-- adicionando colunas.

-- se houver dados na tabela, a nova coluna terá o valor null em todas as linhas já existentes.
-- commit automatico.
alter table rodrigo_rodrigues.projects
add (department_id number(3));

desc rodrigo_rodrigues.projects;

-- removendo uma coluna.
-- commit automatico.
alter table rodrigo_rodrigues.projects
drop column department_id;

-- adicionando uma coluna com constraint.
-- como não há dados na tabela não é necessário informar uma valor default.
alter table rodrigo_rodrigues.projects
add (department_id number(3)not null);


-- alterando uma coluna.
-- podemos alterar o tipo de dado.
-- o novo tipo deve garantir conversão implicita.
-- podemos alterar o tamanho do dado.
-- o novo tamanho não pode causar truncamento dos dados já presentes na tabela.
alter table rodrigo_rodrigues.projects
modify (project_code varchar2(6));
                             
desc projects

-- renomeando uma coluna.
alter table rodrigo_rodrigues.projects
rename column project_code to name;

desc rodrigo_rodrigues.projects;

-- não permitir comandos ddl e dml na tabela.
-- read only.
alter table employees read only;

-- permitir comandos ddl e dml na tabela.
-- read write.
alter table employees read write;