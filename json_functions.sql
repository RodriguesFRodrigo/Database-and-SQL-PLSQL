-- JSON_OBJECT --
-- Criando jsons.

-- key é opcional.
select json_object(key 'score' value 37) from dual;

select json_object(
  key 'fname' value 'Lisnuspsã',
  key 'lname' value 'Rusmunsonxão',
  key 'score' value 237
) from dual;

-- Json aninhado.
-- Se o value for um objeto podemos usar format json para especificar que ele contém JSON e não deve ser citado na saída.
select json_object(
    'name' value 'Pedro Henrique',
    'infos' value '{"team": "Internacional", "position": "Forward"}'
    format json
) from dual;

-- Json de uma tabela.
select json_object(codigo, nome) from hsusuarios;

-- Criando jsons de uma tabela.
select json_object(key 'nome' value nome_banco) 
from hsusuarios;

-- JSON_ARRAY --
-- Criando array.
select json_array(1,2,3,4,5,6,7,8,9) from dual;

-- Arrays aninhados.
select json_array(
    json_array(1,3,5,7,9),
    json_array(2,4,6,8)
) from dual;

-- Arrays de objetos
select json_array(
    '{"name": "Pedro Henrique"}, 
     {"name": "Wanderson"}'
     format json
) from dual;

-- JSON_TABLE --
-- Permite criar view de json e array.

-- Consultando um json.
-- {a:1, b:2, c:3} json para consultar.
-- columns(a, b, c) chaves do json acessadas.
select *
from json_table('{a:1, b:2, c:3}', 
                '$' columns(a, b, c));

-- Consultando um array de json.
select *
from json_table(
    '[{a:1, b:2, c:3}, {a:4, b:5, c:6}, {a:7, b:8, c:9}]', 
    '$[*]' 
    columns(a, b, c)
    );

-- Consultando um array de json.
select a, b, c
from json_table('[{a:1, b:2, c:3}, {a:4, b:5, c:6}, {a:7, b:8, c:9}]', 
                '$[*]' 
                columns (
                    a varchar2(20) path '$.a',
                    b number path '$.b',
                    c number path '$.c'
));

-- Especificando as colunas de saída.
select 
  a as "coluna_a", 
  b as "coluna_b"
from json_table(
    '[{a:1, b:2, c:3}, {a:4, b:5, c:6}, {a:7, b:8, c:9}]', 
    '$[*]' 
    columns(a, b, c)
    );

-- Filtrando linhas especificas.
select 
  a as "coluna_a", 
  b as "coluna_b"
from json_table(
    '[{a:1, b:2, c:3}, {a:4, b:5, c:6}, {a:7, b:8, c:9}]', 
    '$[*]' 
    columns(a, b, c)
    )
where a / 2 = 0

-- Extraindo valores de um array simples.
select value 
from json_table('[1, 2, 3, 4, 5, 6, 7, 8, 9]', 
                '$[*]' 
                columns (value number path '$[*]'))

            
