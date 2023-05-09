SELECT 
  a.nome AS artista,
  al.nome AS album

FROM artista AS a
INNER JOIN album as al ON al.artista_id_artista = a.id_artista 
WHERE a.nome = 'Elis Regina'
ORDER BY al.nome ASC;
