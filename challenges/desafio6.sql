SELECT 
    MIN(planos.valor) AS faturamento_minimo,
    MAX(planos.valor) AS faturamento_maximo,
    ROUND(AVG(planos.valor), 2) AS faturamento_medio,
    ROUND(SUM(planos.valor), 2) AS faturamento_total
FROM 
    planos
    JOIN usuarios ON usuarios.planos_id_planos = planos.id_planos;
    