SELECT 
  a.nome AS artista, 
  al.nome AS album, 
  COUNT(a.nome) AS pessoas_seguidoras

FROM artista AS a
INNER JOIN album AS al ON al.artista_id_artista = a.id_artista
INNER JOIN seguindo AS s ON s.artista_id_artista = al.artista_id_artista

GROUP BY artista, album
ORDER BY pessoas_seguidoras DESC, artista.nome ASC, album.nome ASC;
