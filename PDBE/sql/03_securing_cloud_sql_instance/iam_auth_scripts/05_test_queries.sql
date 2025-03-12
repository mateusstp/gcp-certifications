-- SQL queries to test IAM user permissions

-- This query should succeed because the IAM user has been granted privileges on the order_items table
SELECT COUNT(*) FROM order_items;

-- This query should fail with 'permission denied' because the IAM user has not been granted 
-- privileges on the users table
SELECT COUNT(*) FROM users;
