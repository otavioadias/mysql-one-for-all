SELECT 
  u.username AS usuario,
  CASE
    WHEN MAX(YEAR(h.date)) < 2021 THEN 'Usuário inativo'
    ELSE 'Usuário ativo'
  END AS status_usuario
FROM 
  SpotifyClone.user AS u
INNER JOIN SpotifyClone.history AS h ON h.user_id = u.user_id
GROUP BY u.user_id
ORDER BY u.username ASC;