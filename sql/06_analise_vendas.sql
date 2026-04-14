-- Receita total da plataforma
SELECT ROUND(SUM(payment_value), 2) AS receita_total
FROM order_payments;

-- Receita por mês
SELECT
    DATE_TRUNC('month', o.order_purchase_timestamp) AS mes,
    ROUND(SUM(op.payment_value), 2) AS receita
FROM orders o
JOIN order_payments op
    ON o.order_id = op.order_id
GROUP BY mes
ORDER BY mes;

-- Ticket médio por pedido
SELECT
    ROUND(AVG(total_pedido), 2) AS ticket_medio
FROM (
    SELECT
        order_id,
        SUM(payment_value) AS total_pedido
    FROM order_payments
    GROUP BY order_id
) t;

-- Top 10 categorias com maior faturamento
SELECT
    p.product_category_name AS categoria,
    ROUND(SUM(op.payment_value), 2) AS faturamento
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN order_payments op
    ON oi.order_id = op.order_id
GROUP BY categoria
ORDER BY faturamento DESC
LIMIT 10;

-- Top 10 produtos mais vendidos
SELECT
    p.product_id,
    p.product_category_name,
    COUNT(*) AS quantidade_vendida
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_category_name
ORDER BY quantidade_vendida DESC
LIMIT 10;

-- Top 10 vendedores por faturamento
SELECT
    oi.seller_id,
    ROUND(SUM(op.payment_value), 2) AS faturamento
FROM order_items oi
JOIN order_payments op
    ON oi.order_id = op.order_id
GROUP BY oi.seller_id
ORDER BY faturamento DESC
LIMIT 10;

-- Participação de cada status nos pedidos
SELECT
    order_status,
    COUNT(*) AS total,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER(), 2) AS percentual
FROM orders
GROUP BY order_status
ORDER BY total DESC;