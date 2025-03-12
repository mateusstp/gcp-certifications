-- SQL script to create and populate the orders database

-- Create tables for the orders database
CREATE TABLE IF NOT EXISTS distribution_centers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    latitude FLOAT,
    longitude FLOAT
);

CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    age INTEGER,
    gender VARCHAR(50),
    state VARCHAR(50),
    zip VARCHAR(10),
    country VARCHAR(50),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    cost FLOAT,
    category VARCHAR(255),
    name VARCHAR(255),
    brand VARCHAR(255),
    retail_price FLOAT,
    department VARCHAR(255),
    distribution_center_id INTEGER REFERENCES distribution_centers(id)
);

CREATE TABLE IF NOT EXISTS inventory_items (
    id SERIAL PRIMARY KEY,
    product_id INTEGER REFERENCES products(id),
    created_at TIMESTAMP,
    sold_at TIMESTAMP,
    cost FLOAT,
    product_category VARCHAR(255),
    product_name VARCHAR(255),
    product_brand VARCHAR(255),
    product_retail_price FLOAT,
    product_department VARCHAR(255),
    product_distribution_center_id INTEGER REFERENCES distribution_centers(id),
    product_sku VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS order_items (
    id SERIAL PRIMARY KEY,
    order_id INTEGER,
    user_id INTEGER REFERENCES users(id),
    product_id INTEGER REFERENCES products(id),
    inventory_item_id INTEGER REFERENCES inventory_items(id),
    status VARCHAR(50),
    created_at TIMESTAMP,
    shipped_at TIMESTAMP,
    delivered_at TIMESTAMP,
    returned_at TIMESTAMP,
    sale_price FLOAT
);

-- Import data from CSV files
COPY distribution_centers FROM '/tmp/distribution_centers_data.csv' DELIMITER ',' CSV HEADER;
COPY users FROM '/tmp/users_data.csv' DELIMITER ',' CSV HEADER;
COPY products FROM '/tmp/products_data.csv' DELIMITER ',' CSV HEADER;
COPY inventory_items FROM '/tmp/inventory_items_data.csv' DELIMITER ',' CSV HEADER;
COPY order_items FROM '/tmp/order_items_data.csv' DELIMITER ',' CSV HEADER;

-- Create a sample index to improve query performance
CREATE INDEX idx_order_items_user_id ON order_items(user_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);

-- Grant necessary permissions
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO postgres;

-- Display record counts to confirm successful data import
SELECT 'distribution_centers' AS table_name, COUNT(*) AS record_count FROM distribution_centers UNION ALL
SELECT 'users' AS table_name, COUNT(*) AS record_count FROM users UNION ALL
SELECT 'products' AS table_name, COUNT(*) AS record_count FROM products UNION ALL
SELECT 'inventory_items' AS table_name, COUNT(*) AS record_count FROM inventory_items UNION ALL
SELECT 'order_items' AS table_name, COUNT(*) AS record_count FROM order_items;
