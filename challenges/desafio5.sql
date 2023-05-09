SELECT cancoes.nome AS cancao, 
       COUNT(historico.cancoes_id_cancao) AS reproducoes 
FROM cancoes 
INNER JOIN historico ON historico.cancoes_id_cancao = cancoes.id_cancao 
GROUP BY cancoes.nome 
ORDER BY reproducoes DESC, cancoes.nome ASC 
LIMIT 2;
