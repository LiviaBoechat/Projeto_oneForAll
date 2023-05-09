
SELECT 
    us.nome AS pessoa_usuaria,
    IF (MAX(YEAR(historico.data_reproducao)) >= 2021, 'Ativa', 'Inativa') AS status_pessoa_usuaria
FROM usuarios AS us 
INNER JOIN historico ON us.id_usuario = historico.usuarios_id_usuario

GROUP BY us.nome ORDER BY us.nome;