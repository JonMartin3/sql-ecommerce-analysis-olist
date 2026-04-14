-- ============================================================
-- 4. IMPORTAÇÃO DOS CSVs NO POSTGRESQL
-- Use \copy no terminal psql
-- ============================================================

\copy customers FROM 'C:/Users/Jonathan/Desktop/Projeto SQL/Data/olist_customers_dataset.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';

\copy geolocation FROM 'C:/Users/Jonathan/Desktop/Projeto SQL/Data/olist_geolocation_dataset.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';

\copy sellers FROM 'C:/Users/Jonathan/Desktop/Projeto SQL/Data/olist_sellers_dataset.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';

\copy products FROM 'C:/Users/Jonathan/Desktop/Projeto SQL/Data/olist_products_dataset.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';

\copy orders FROM 'C:/Users/Jonathan/Desktop/Projeto SQL/Data/olist_orders_dataset.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';

\copy order_items FROM 'C:/Users/Jonathan/Desktop/Projeto SQL/Data/olist_order_items_dataset.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';

\copy order_payments FROM 'C:/Users/Jonathan/Desktop/Projeto SQL/Data/olist_order_payments_dataset.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';

\copy order_reviews FROM 'C:/Users/Jonathan/Downloads/olist/olist_order_reviews_dataset.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';

\copy product_category_name_translation FROM 'C:/Users/Jonathan/Downloads/olist/product_category_name_translation.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';