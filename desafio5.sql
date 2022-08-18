-- SELECT 
-- song AS cancao,
-- COUNT(song) AS reproducoes
-- FROM SpotifyClone.history 
-- GROUP BY song 
-- ORDER BY COUNT(song) DESC LIMIT 2;

SELECT 
song AS cancao,
COUNT(song) AS reproducoes
FROM SpotifyClone.history 
GROUP BY song 
HAVING COUNT(song) > 2
ORDER BY song ASC;
