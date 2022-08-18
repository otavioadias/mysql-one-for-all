SELECT
  art.artist_name AS artista,
  a.album_name AS album
FROM SpotifyClone.album AS a
INNER JOIN SpotifyClone.artist AS art ON art.artist_id = a.artist_id
WHERE art.artist_name = "Elis Regina"
ORDER BY a.album_name;