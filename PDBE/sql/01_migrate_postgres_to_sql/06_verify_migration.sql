-- GSP918: Database Migration to Cloud SQL for PostgreSQL
-- Step 6: Verify the migration and test continuous updates

-- Connect to Cloud SQL instance
-- (Use gcloud sql connect postgresql-cloudsql --user=postgres --quiet)
-- Password: supersecret!

-- Connect to the orders database
\c orders;

-- View data in the distribution_centers table
SELECT * FROM distribution_centers;

-- Output should show existing distribution centers

-- To test continuous migration:

-- 1. Connect to source PostgreSQL instance
-- (Use psql -h $POSTGRESQL_IP -p 5432 -d orders -U migration_admin)
-- Password: DMS_1s_cool!

-- 2. Insert a new record into the source database
INSERT INTO distribution_centers VALUES(-80.1918, 25.7617, 'Miami FL', 11);

-- 3. Connect to the Cloud SQL instance again and verify the new record appears
-- (Use gcloud sql connect postgresql-cloudsql --user=postgres --quiet)
-- Password: supersecret!

-- 4. Check that the new record was migrated
SELECT * FROM distribution_centers;

-- The output should now include the Miami FL record
