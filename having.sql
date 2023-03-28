-- a cláusula sql having é uma cláusula em sql que permite filtrar os dados depois de terem sido agrupados com a cláusula group by.
-- having não aceita alias, pois o select é executado por último.

select
  student_name,
  avg(student_grade) as avg_grade
from sample_group_table
group by student_name
having avg(student_grade) >= 65;