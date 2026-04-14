-- Quantidade de clientes únicos
SELECT COUNT(DISTINCT customer_unique_id) AS clientes_unicos
FROM customers;

-- Estados com mais clientes
SELECT
    customer_state,
    COUNT(*) AS total_clientes
FROM customers
GROUP BY customer_state
ORDER BY total_clientes DESC;

-- Cidades com mais clientes
SELECT
    customer_city,
    COUNT(*) AS total_clientes
FROM customers
GROUP BY customer_city
ORDER BY total_clientes DESC
LIMIT 10;

-- Quantidade de pedidos por cliente
SELECT
    c.customer_unique_id,
    COUNT(o.order_id) AS total_pedidos
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
ORDER BY total_pedidos DESC
LIMIT 20;

-- Clientes recorrentes (mais de 1 pedido)
SELECT
    COUNT(*) AS clientes_recorrentes
FROM (
    SELECT
        c.customer_unique_id,
        COUNT(o.order_id) AS total_pedidos
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
    HAVING COUNT(o.order_id) > 1
) t;

-- Ticket médio por estado
SELECT
    c.customer_state,
    ROUND(AVG(op.payment_value), 2) AS ticket_medio
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_payments op
    ON o.order_id = op.order_id
GROUP BY c.customer_state
ORDER BY ticket_medio DESC;

-- Avaliação média por estado
SELECT
    c.customer_state,
    ROUND(AVG(orv.review_score), 2) AS media_avaliacao
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_reviews orv
    ON o.order_id = orv.order_id
GROUP BY c.customer_state
ORDER BY media_avaliacao DESC;