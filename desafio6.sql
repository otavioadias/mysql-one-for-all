-- Active: 1660757313270@@127.0.0.1@3307@SpotifyClone
-- SELECT 
-- FORMAT(MIN(p.value_plan), 2) AS faturamento_minimo,
-- FORMAT(MAX(p.value_plan), 2) AS faturamento_maximo,
-- FORMAT(AVG(p.value_plan), 2) AS faturamento_medio,
-- FORMAT(( SELECT 
--     SUM(p.value_plan)
--     FROM SpotifyClone.user AS u 
--     INNER JOIN SpotifyClone.plan AS p
--     ON p.plan_id = u.plan_id
-- ), 2) AS faturamento_total
-- FROM SpotifyClone.plan AS p
-- INNER JOIN SpotifyClone.user AS u
-- ON p.plan_id = u.plan_id;

-- # STEPS PARA RESOLUÇÃO:
-- SELECT u.plan_id, COUNT(p.value_plan), p.value_plan, (p.value_plan*COUNT(p.value_plan))
-- FROM SpotifyClone.user AS u 
-- INNER JOIN SpotifyClone.plan AS p
-- ON p.plan_id = u.plan_id
-- GROUP BY p.plan_id;

-- SELECT SUM(faturamento_total) AS faturamento_total
-- FROM (
-- SELECT SUM(p.value_plan) AS faturamento_total
-- FROM SpotifyClone.user AS u 
-- INNER JOIN SpotifyClone.plan AS p
-- ON p.plan_id = u.plan_id
-- GROUP BY p.plan_id
-- ) s;

SELECT 
FORMAT(MIN(value), 2) AS faturamento_minimo,
FORMAT(MAX(value), 2) AS faturamento_maximo,
FORMAT(SUM(faturamento_total)/SUM(users), 2) AS faturamento_medio,
FORMAT(SUM(faturamento_total), 2) AS faturamento_total
FROM (
    SELECT (p.value_plan*COUNT(p.value_plan)) AS faturamento_total,
    COUNT(p.value_plan) AS users,
    p.value_plan AS value
    FROM SpotifyClone.user AS u 
    INNER JOIN SpotifyClone.plan AS p
    ON p.plan_id = u.plan_id
    GROUP BY p.plan_id
) S;
