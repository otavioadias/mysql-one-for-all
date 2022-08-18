-- SELECT user_id FROM SpotifyClone.history;
-- SELECT user_id, plan_id FROM SpotifyClone.user;
-- SELECT plan_id FROM SpotifyClone.plan WHERE plan_type = 'gratuito' OR plan_type = 'pessoal';

SELECT h.song AS nome,
COUNT(h.song) AS reproducoes
FROM SpotifyClone.history as h
INNER JOIN SpotifyClone.user AS u ON h.user_id = u.user_id
INNER JOIN SpotifyClone.plan AS p ON u.plan_id = p.plan_id
WHERE plan_type = 'gratuito' OR plan_type = 'pessoal'
GROUP BY song
ORDER BY song;