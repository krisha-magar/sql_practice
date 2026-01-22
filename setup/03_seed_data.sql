-- =========================================
-- File: 03_seed_data.sql
-- Purpose: Seed sample data
-- =========================================

SET search_path TO retail;

INSERT INTO customers (full_name, email, city)
VALUES
('Asha Nair','asha@email.com','Toronto'),
('Ravi Kumar','ravi@email.com','Mississauga');

INSERT INTO products (sku, product_name, category, unit_price)
VALUES
('SKU1','Glass Bottle','Home',12.99),
('SKU2','Protein Bar','Snacks',3.99);

INSERT INTO orders (customer_id, status)
VALUES
(1,'PAID'),
(2,'PLACED');

INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES
(1,1,1,12.99),
(1,2,2,3.99);
