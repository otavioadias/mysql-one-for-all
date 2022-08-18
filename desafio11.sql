-- SELECT 
-- REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(song, 'Amar', 'Code Review'),'SUPERSTAR', 'SUPERDEV'),'Bard', 'QA'), 'SOUL', 'CODE'), 'Pais', 'Pull Requests') AS novo_nome
-- FROM SpotifyClone.songs
-- WHERE song LIKE '%Amar%' OR
-- song LIKE '%SUPERSTAR%' OR
-- song LIKE '%Bard%' OR
-- song LIKE '%SOUL%' OR
-- song LIKE '%Pais%';

-- (SELECT 
-- REPLACE(song, 'Amar', 'Code Review')
-- FROM SpotifyClone.songs);

SELECT 
song AS nome_musica,
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(song, 'Amar', 'Code Review'),'SUPERSTAR', 'SUPERDEV'),'Bard', 'QA'), 'SOUL', 'CODE'), 'Pais', 'Pull Requests') AS novo_nome
FROM SpotifyClone.songs
WHERE song LIKE '%Amar%' OR
song LIKE '%SUPERSTAR%' OR
song LIKE '%Bard%' OR
song LIKE '%SOUL%' OR
song LIKE '%Pais%'
ORDER BY song DESC;
