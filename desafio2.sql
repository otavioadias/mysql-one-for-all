-- Active: 1660757313270@@127.0.0.1@3307@SpotifyClone
SELECT 
  COUNT(SpotifyClone.songs.song) AS cancoes,
  (SELECT COUNT(artist_name) FROM SpotifyClone.artist) AS artistas,
  (SELECT COUNT(album_name) FROM SpotifyClone.album) AS albuns
FROM 
  SpotifyClone.songs
INNER JOIN SpotifyClone.album AS a ON a.album_id = SpotifyClone.songs.album_id
INNER JOIN SpotifyClone.artist AS art ON a.artist_id = art.artist_id;