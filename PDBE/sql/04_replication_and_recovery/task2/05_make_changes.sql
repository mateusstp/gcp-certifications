-- SQL commands to make changes to the database after the timestamp

-- Insert a new row into the distribution_centers table
INSERT INTO distribution_centers VALUES(-80.1918, 25.7617, 'Miami FL', 11);

-- Check the row count after the change
SELECT COUNT(*) FROM distribution_centers;

-- Expected output: 11 rows
-- You should see:
-- count
-- -------
--     11
-- (1 row)

-- Verify the new row was added
SELECT * FROM distribution_centers ORDER BY id;

-- Exit psql when done
-- \q
