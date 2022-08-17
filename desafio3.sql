SELECT 
  u.username AS usuario,
  COUNT(h.song_id) AS qt_de_musicas_ouvidas,
  ROUND(sum(s.duration/60), 2) AS total_minutos
FROM 
  SpotifyClone.user AS u
INNER JOIN SpotifyClone.history AS h ON h.user_id = u.user_id
INNER JOIN SpotifyClone.songs AS s ON s.song_id = h.song_id
GROUP BY u.username
ORDER BY u.username ASC ;