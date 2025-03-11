-- GSP918: Database Migration to Cloud SQL for PostgreSQL
-- Step 2: Configure pglogical extension in the databases
psql
-- Connect to postgres database and add pglogical extension
\c postgres;
CREATE EXTENSION pglogical;

-- Connect to orders database and add pglogical extension
\c orders;
CREATE EXTENSION pglogical;

-- Connect to gmemegen_db database and add pglogical extension
\c gmemegen_db;
CREATE EXTENSION pglogical;

-- List all databases on the server
\l

-- Expected output includes postgres, orders, and gmemegen_db databases
-- along with the default template0 and template1 databases
