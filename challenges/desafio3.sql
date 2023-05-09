

SELECT us.nome AS pessoa_usuaria,
COUNT(historico.usuarios_id_usuario) AS musicas_ouvidas,
FORMAT(SUM(cancoes.duracao/60), 2) AS total_minutos

FROM usuarios AS us
INNER JOIN historico ON us.id_usuario = historico.usuarios_id_usuario
INNER JOIN cancoes ON cancoes.id_cancao = historico.cancoes_id_cancao

GROUP BY pessoa_usuaria ORDER BY pessoa_usuaria;

