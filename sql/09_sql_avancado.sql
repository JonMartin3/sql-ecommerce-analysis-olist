-- Ranking de vendedores por faturamento usando Window Function
SELECT
    seller_id,
    faturamento,
    RANK() OVER (ORDER BY faturamento DESC) AS ranking
FROM (
    SELECT
        oi.seller_id,
        SUM(op.payment_value) AS faturamento
    FROM order_items oi
    JOIN order_payments op
        ON oi.order_id = op.order_id
    GROUP BY oi.seller_id
) t;

-- Receita acumulada por mês
SELECT
    mes,
    receita,
    SUM(receita) OVER (ORDER BY mes) AS receita_acumulada
FROM (
    SELECT
        DATE_TRUNC('month', o.order_purchase_timestamp) AS mes,
        SUM(op.payment_value) AS receita
    FROM orders o
    JOIN order_payments op
        ON o.order_id = op.order_id
    GROUP BY mes
) t
ORDER BY mes;

-- Top 3 categorias mais vendidas por estado
WITH vendas_categoria AS (
    SELECT
        c.customer_state,
        p.product_category_name,
        COUNT(*) AS total_vendas,
        ROW_NUMBER() OVER (
            PARTITION BY c.customer_state
            ORDER BY COUNT(*) DESC
        ) AS ranking
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products p
        ON oi.product_id = p.product_id
    GROUP BY c.customer_state, p.product_category_name
)
SELECT
    customer_state,
    product_category_name,
    total_vendas
FROM vendas_categoria
WHERE ranking <= 3
ORDER BY customer_state, total_vendas DESC;

-- Clientes segmentados por frequência de compra
WITH pedidos_cliente AS (
    SELECT
        c.customer_unique_id,
        COUNT(o.order_id) AS total_pedidos
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
)
SELECT
    CASE
        WHEN total_pedidos = 1 THEN '1 pedido'
        WHEN total_pedidos BETWEEN 2 AND 3 THEN '2-3 pedidos'
        ELSE '4+ pedidos'
    END AS segmento,
    COUNT(*) AS total_clientes
FROM pedidos_cliente
GROUP BY segmento
ORDER BY total_clientes DESC;

-- Identificar clientes com maior gasto total
SELECT
    customer_unique_id,
    gasto_total
FROM (
    SELECT
        c.customer_unique_id,
        SUM(op.payment_value) AS gasto_total,
        DENSE_RANK() OVER (
            ORDER BY SUM(op.payment_value) DESC
        ) AS ranking
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_payments op
        ON o.order_id = op.order_id
    GROUP BY c.customer_unique_id
) t
WHERE ranking <= 10
ORDER BY gasto_total DESC;

-- Análise de retenção simples por mês
WITH pedidos_mes AS (
    SELECT
        c.customer_unique_id,
        DATE_TRUNC('month', o.order_purchase_timestamp) AS mes
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
),
clientes_recorrentes AS (
    SELECT
        p1.mes,
        COUNT(DISTINCT p1.customer_unique_id) AS clientes_mes,
        COUNT(DISTINCT p2.customer_unique_id) AS clientes_recorrentes
    FROM pedidos_mes p1
    LEFT JOIN pedidos_mes p2
        ON p1.customer_unique_id = p2.customer_unique_id
        AND p2.mes = p1.mes + INTERVAL '1 month'
    GROUP BY p1.mes
)
SELECT
    mes,
    clientes_mes,
    clientes_recorrentes,
    ROUND(100.0 * clientes_recorrentes / clientes_mes, 2) AS taxa_retencao
FROM clientes_recorrentes
ORDER BY mes;