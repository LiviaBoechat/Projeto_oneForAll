SELECT COUNT(*) AS musicas_no_historico
FROM usuarios as us
INNER JOIN historico ON historico.usuarios_id_usuario = us.id_usuario
WHERE us.nome = 'Barbara Liskov';

