-- SQL commands to grant privileges to the Cloud IAM user

-- Connect to the orders database
\c orders
-- (Enter password: supersecret!)

-- Grant privileges to the IAM user
-- Replace [YOUR_IAM_USERNAME] with your actual IAM username
GRANT ALL PRIVILEGES ON TABLE order_items TO "[YOUR_IAM_USERNAME]";

-- Exit psql
\q
