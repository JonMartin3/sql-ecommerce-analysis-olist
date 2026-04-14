-- ============================================================
-- 5. VALIDAR SE AS TABELAS FORAM CARREGADAS
-- ============================================================

SELECT 'customers' AS tabela, COUNT(*) AS total FROM customers
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'order_payments', COUNT(*) FROM order_payments
UNION ALL
SELECT 'order_reviews', COUNT(*) FROM order_reviews
UNION ALL
SELECT 'sellers', COUNT(*) FROM sellers
ORDER BY tabela;