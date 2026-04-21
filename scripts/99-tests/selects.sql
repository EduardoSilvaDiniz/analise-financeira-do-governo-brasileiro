SELECT DISTINCT especie FROM datasets.receita_por_orgao ORDER BY especie;


SELECT DISTINCT orgao_superior FROM datasets.receita_por_orgao WHERE especie = '712 - Taxas' ORDER BY orgao_superior;

select *
from datasets.receita_por_orgao;

select SUM(receita_realizada_valor_arrecadado) FROM datasets.receita_por_orgao WHERE ano = '2023';

SELECT * FROM datasets.receita_por_orgao WHERE origem like '%mposto%';
