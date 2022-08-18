-- Active: 1660757313270@@127.0.0.1@3307@SpotifyClone
-- SELECT
--   art.artist_name AS artista,
--   a.album_name AS album,
--   COUNT(f.user_id) AS seguidores
-- FROM SpotifyClone.album AS a
-- INNER JOIN SpotifyClone.followers AS f ON a.artist_id = f.artist_id
-- INNER JOIN SpotifyClone.artist AS art ON art.artist_id = a.artist_id
-- GROUP BY f.artist_id, art.artist_id, album
-- ORDER BY COUNT(f.user_id) DESC, art.artist_name, a.album_name;


-- -- Steps
-- SELECT * FROM SpotifyClone.artist;

-- SELECT * FROM SpotifyClone.followers;

-- SELECT * FROM SpotifyClone.album;

-- SELECT COUNT(user_id) FROM SpotifyClone.followers
-- GROUP BY artist_name, artist_id;

SELECT
  art.artist_name AS artista,
  a.album_name AS album,
  (SELECT COUNT(user_id) FROM SpotifyClone.followers AS f WHERE f.artist_id = art.artist_id) AS seguidores
FROM SpotifyClone.album AS a
INNER JOIN SpotifyClone.artist AS art ON art.artist_id = a.artist_id
ORDER BY 3 DESC, art.artist_name, a.album_name;
