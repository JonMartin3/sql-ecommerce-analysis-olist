-- Quantidade de registros em cada tabela
SELECT 'customers' AS tabela, COUNT(*) AS total FROM customers
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'order_payments', COUNT(*) FROM order_payments
UNION ALL
SELECT 'order_reviews', COUNT(*) FROM order_reviews
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'sellers', COUNT(*) FROM sellers
UNION ALL
SELECT 'geolocation', COUNT(*) FROM geolocation;

-- Visualizar amostra dos dados
SELECT * FROM customers LIMIT 10;
SELECT * FROM orders LIMIT 10;
SELECT * FROM order_items LIMIT 10;
SELECT * FROM order_payments LIMIT 10;
SELECT * FROM order_reviews LIMIT 10;

-- Verificar pedidos por status
SELECT
    order_status,
    COUNT(*) AS total_pedidos
FROM orders
GROUP BY order_status
ORDER BY total_pedidos DESC;

-- Verificar valores nulos em colunas importantes
SELECT
    COUNT(*) FILTER (WHERE order_approved_at IS NULL) AS sem_aprovacao,
    COUNT(*) FILTER (WHERE order_delivered_customer_date IS NULL) AS sem_entrega,
    COUNT(*) FILTER (WHERE order_estimated_delivery_date IS NULL) AS sem_previsao
FROM orders;

-- Faixa de datas do dataset
SELECT
    MIN(order_purchase_timestamp) AS primeira_compra,
    MAX(order_purchase_timestamp) AS ultima_compra
FROM orders;

-- Quantidade de clientes únicos
SELECT
    COUNT(DISTINCT customer_unique_id) AS clientes_unicos
FROM customers;

-- Quantidade de pedidos únicos
SELECT
    COUNT(DISTINCT order_id) AS pedidos_unicos
FROM orders;

-- Quantidade de vendedores únicos
SELECT
    COUNT(DISTINCT seller_id) AS vendedores_unicos
FROM sellers;

-- Top 10 estados com mais pedidos
SELECT
    c.customer_state,
    COUNT(o.order_id) AS total_pedidos
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_state
ORDER BY total_pedidos DESC
LIMIT 10;

-- Top 10 categorias com mais produtos cadastrados
SELECT
    product_category_name,
    COUNT(*) AS total_produtos
FROM products
GROUP BY product_category_name
ORDER BY total_produtos DESC
LIMIT 10;