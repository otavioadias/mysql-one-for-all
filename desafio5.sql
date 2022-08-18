SELECT 
song AS cancao,
COUNT(song) AS reproducoes
FROM SpotifyClone.history 
GROUP BY song 
HAVING COUNT(song) >= (
    SELECT 
    COUNT(song)
    FROM SpotifyClone.history 
    GROUP BY song 
    ORDER BY COUNT(song) DESC LIMIT 1
)
ORDER BY song ASC;
