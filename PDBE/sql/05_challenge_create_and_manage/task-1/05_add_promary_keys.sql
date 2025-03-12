-- SQL commands to add primary keys to tables if they're missing

-- Add primary keys to each table (if needed)
DO $$ 
BEGIN
    -- Check if distribution_centers has primary key
    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints 
                   WHERE table_name = 'distribution_centers' 
                   AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE distribution_centers ADD PRIMARY KEY (id);
    END IF;
    
    -- Check if inventory_items has primary key
    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints 
                   WHERE table_name = 'inventory_items' 
                   AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE inventory_items ADD PRIMARY KEY (id);
    END IF;
    
    -- Check if order_items has primary key
    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints 
                   WHERE table_name = 'order_items' 
                   AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE order_items ADD PRIMARY KEY (id);
    END IF;
    
    -- Check if products has primary key
    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints 
                   WHERE table_name = 'products' 
                   AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE products ADD PRIMARY KEY (id);
    END IF;
    
    -- Check if users has primary key
    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints 
                   WHERE table_name = 'users' 
                   AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE users ADD PRIMARY KEY (id);
    END IF;
END $$;

-- Verify primary keys have been added
SELECT
  t.table_name,
  CASE WHEN k.column_name IS NOT NULL THEN 'Yes' ELSE 'No' END AS has_primary_key
FROM
  information_schema.tables t
LEFT JOIN
  information_schema.table_constraints tc
  ON t.table_name = tc.table_name AND tc.constraint_type = 'PRIMARY KEY'
LEFT JOIN
  information_schema.key_column_usage k
  ON tc.constraint_name = k.constraint_name
WHERE
  t.table_schema = 'public' AND
  t.table_name IN ('distribution_centers', 'inventory_items', 'order_items', 'products', 'users');
