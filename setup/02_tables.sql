-- =========================================
-- File: 02_tables.sql
-- Purpose: Create core tables
-- =========================================

SET search_path TO retail;

CREATE TABLE IF NOT EXISTS customers (
  customer_id BIGSERIAL PRIMARY KEY,
  full_name VARCHAR(120) NOT NULL,
  email VARCHAR(200) UNIQUE NOT NULL,
  city VARCHAR(80),
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS products (
  product_id BIGSERIAL PRIMARY KEY,
  sku VARCHAR(40) UNIQUE NOT NULL,
  product_name VARCHAR(200) NOT NULL,
  category VARCHAR(80),
  unit_price NUMERIC(10,2) CHECK (unit_price >= 0)
);

CREATE TABLE IF NOT EXISTS orders (
  order_id BIGSERIAL PRIMARY KEY,
  customer_id BIGINT REFERENCES customers(customer_id),
  order_date TIMESTAMPTZ DEFAULT now(),
  status VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS order_items (
  order_item_id BIGSERIAL PRIMARY KEY,
  order_id BIGINT REFERENCES orders(order_id) ON DELETE CASCADE,
  product_id BIGINT REFERENCES products(product_id),
  quantity INT CHECK (quantity > 0),
  unit_price NUMERIC(10,2)
);
