-- Tempo médio entre compra e aprovação
SELECT
    ROUND(AVG(
        EXTRACT(EPOCH FROM (order_approved_at - order_purchase_timestamp)) / 3600
    ), 2) AS horas_ate_aprovacao
FROM orders
WHERE order_approved_at IS NOT NULL;

-- Tempo médio de entrega em dias
SELECT
    ROUND(AVG(
        EXTRACT(EPOCH FROM (
            order_delivered_customer_date - order_purchase_timestamp
        )) / 86400
    ), 2) AS dias_entrega
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;

-- Pedidos entregues atrasados
SELECT
    COUNT(*) AS pedidos_atrasados
FROM orders
WHERE order_delivered_customer_date > order_estimated_delivery_date;

-- Percentual de pedidos atrasados
SELECT
    ROUND(
        100.0 * SUM(
            CASE
                WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS percentual_atraso
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;

-- Estados com maior tempo médio de entrega
SELECT
    c.customer_state,
    ROUND(AVG(
        EXTRACT(EPOCH FROM (
            o.order_delivered_customer_date - o.order_purchase_timestamp
        )) / 86400
    ), 2) AS dias_entrega
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
ORDER BY dias_entrega DESC;

-- Relação entre atraso e avaliação do cliente
SELECT
    CASE
        WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date
            THEN 'Atrasado'
        ELSE 'No prazo'
    END AS status_entrega,
    ROUND(AVG(orv.review_score), 2) AS media_avaliacao
FROM orders o
JOIN order_reviews orv
    ON o.order_id = orv.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY status_entrega;