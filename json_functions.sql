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