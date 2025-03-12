-- sudo -u postgres psql
-- Connect to postgres database and add pglogical extension
\c postgres;
CREATE EXTENSION pglogical;

-- Connect to orders database and add pglogical extension
\c orders;
CREATE EXTENSION pglogical;

-- List all databases on the server
\l
