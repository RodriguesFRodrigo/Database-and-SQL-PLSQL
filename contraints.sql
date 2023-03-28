-- gerenciando constraints.

-- removendo uma constraint a uma tabela
-- se for uma restrição pk referenciada por fk em outras tabelas é necessário usar cascade.

-- remove a constraint projects_department_id_fk e sua regra de integridade.
alter table rodrigo_rodrigues.projects
drop constraint projects_department_id_fk;

alter table rodrigo_rodrigues.projects
drop constraint projects_project_id_pk cascade;

-- adicionando uma constraint a uma tabela.
alter table rodrigo_rodrigues.projects
add constraint projects_department_id_fk foreign key (department_id)
references rodrigo_rodrigues.departments(department_id);

-- desabilitando uma constraint.
-- desabilitar para fazer uma ação e habilitar novamente depois.
alter table rodrigo_rodrigues.projects
disable constraint projects_department_id_fk;

alter table rodrigo_rodrigues.projects
disable constraint projects_project_id_pk cascade;

-- enable para ativar uma constraint.

-- constraints são regras de integridade, uma vez que uma constraint é definida, ninguém pode violá-la.

-- not null.
-- não permite valores nulos para uma coluna.
-- a constraint primary key impõe a constraint not null.
create table rodrigo_rodrigues.projects
(project_id    number(6)    not null,
 project_code  varchar2(10) not null,
 project_name  varchar2(100)not null,
 department_id number(4)    not null,
 creation_date date default sysdate not null,
 start_date    date,
 end_date      date,
 status        varchar2(20) not null,
 priority      varchar2(10) not null,
 budget        number(11,2) not null,
 description   varchar2(400)not null);

 -- primary key.
 -- definindo constraint primary key a nível de coluna.
 -- o melhor idenficador da tabela.
 -- garante a integridade:
-- not null.
-- valores únicos.
create table rodrigo_rodrigues.projects
(project_id    number(6)    not null
 constraint projects_project_id_pk primary key,
 project_code  varchar2(10) not null,
 project_name  varchar2(100)not null,
 department_id number(4)    not null,
 creation_date date default sysdate not null,
 start_date    date,
 end_date      date,
 status        varchar2(20) not null,
 priority      varchar2(10) not null,
 budget        number(11,2) not null,
 description   varchar2(400)not null);

-- definindo constraint primary key a nível de tabela.
create table projects
(project_id    number(6)    not null, 
 project_code  varchar2(10) not null,
 project_name  varchar2(100)not null,
 department_id number(4)    not null,
 creation_date date default sysdate not null,
 start_date    date,
 end_date      date,
 status        varchar2(20) not null,
 priority      varchar2(10) not null,
 budget        number(11,2) not null,
 description   varchar2(400)not null,
 constraint projects_project_id_pk primary key(project_id));

-- foreign key.
-- pode referenciar uma coluna unique.
-- identificador da tabela.
-- garante a integridade.
-- estabele a relação da tabela com outra tabela.
create table rodrigo_rodrigues.projects
(project_id    number(6)    not null
 constraint projects_project_id_pk primary key,
 project_code  varchar2(10) not null
 constraint projects_project_code_uk unique,
 project_name  varchar2(100)not null,
 department_id number(4)    not null
 -- department_id é chave estrangeira que referencia a tabela departments na coluna department_id.
 -- garante que um projeto esteja em um departamento.
 constraint projects_department_id_fk references rodrigo_rodrigues.departments(department_id),
 creation_date date default sysdate not null,
 start_date    date,
 end_date      date,
 status        varchar2(20) not null,
 priority      varchar2(10) not null,
 budget        number(11,2) not null,
 description   varchar2(400)not null);

 -- regras de delegação.
 -- no action: não deleta os registros com  referencia, retorna um erro.
 create table rodrigo_rodrigues.teams
(project_id    number(6)  not null,
 employee_id   number(6)  not null,
 constraint teams_project_id_fk foreign key (project_id)
 references rodrigo_rodrigues.projects(project_id),
 constraint teams_employee_id_fk foreign key (employee_id)
 references rodrigo_rodrigues.employees(employee_id));

-- regras de delegação.
-- on delete cascade: deleta os registros filhos.
 create table teams
(project_id    number(6),
 employee_id   number(6)  not null,
 constraint teams_project_id_fk foreign key (project_id)
 references projects(project_id) on delete set null,
 constraint teams_employee_id_fk foreign key (employee_id)
 references employees(employee_id));