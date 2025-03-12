-- Initialize pgAudit in the database

-- Create orders database
CREATE DATABASE orders;
\c orders;

-- Create and configure pgAudit extension
CREATE EXTENSION pgaudit;
ALTER DATABASE orders SET pgaudit.log = 'read,write';

-- Configure audit role for specific table logging
CREATE ROLE auditor WITH NOLOGIN;
ALTER DATABASE orders SET pgaudit.role = 'auditor';
GRANT SELECT ON order_items TO auditor;
