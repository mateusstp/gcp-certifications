-- SQL commands to verify database restoration to the correct point-in-time

-- Get the row count of the distribution_centers table in the restored database
SELECT COUNT(*) FROM distribution_centers;

-- Expected output: 10 rows (before the new row was added)
-- You should see:
-- count
-- -------
--     10
-- (1 row)

-- Verify that the 'Miami FL' row is NOT present in the restored database
SELECT * FROM distribution_centers WHERE name = 'Miami FL';

-- Expected output: No rows (empty result)

-- View all distribution centers to confirm state
SELECT * FROM distribution_centers ORDER BY id;

-- Exit psql when done
-- \q
