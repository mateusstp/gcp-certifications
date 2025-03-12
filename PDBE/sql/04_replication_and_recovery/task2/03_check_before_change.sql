-- SQL commands to check the database before making changes

-- Get the row count of the distribution_centers table
SELECT COUNT(*) FROM distribution_centers;

-- Expected output: 10 rows
-- You should see:
-- count
-- -------
--     10
-- (1 row)

-- You can also examine the current data in the table
SELECT * FROM distribution_centers ORDER BY id;
