#!/bin/bash
# Script for Task 2: Enabling and configuring pgAudit on a Cloud SQL for PostgreSQL database

# Set your project ID if needed
# gcloud config set project YOUR_PROJECT_ID

export CLOUDSQL_INSTANCE=postgres-orders

# Enable pgAudit database flags
echo "Enabling pgAudit database flags..."
gcloud sql instances patch $CLOUDSQL_INSTANCE \
    --database-flags cloudsql.enable_pgaudit=on,pgaudit.log=all

echo "pgAudit enabled. Please restart the instance from the Cloud Console."

# Make all scripts in pgaudit_scripts directory executable
chmod +x ./pgaudit_scripts/*.sh

echo "\nScripts have been created in pgaudit_scripts/ folder:"
echo "---------------------------------------------------"
echo "1. 01_init_pgaudit.sql - SQL commands to initialize pgAudit in the database"
echo "2. 02_download_data.sh - Script to download sample data files"
echo "3. 03_populate_database.sh - Script to populate the database with sample data"
echo "4. 04_sample_queries.sql - Sample queries to test pgAudit logging"
echo "5. 05_logs_explorer_query.txt - Query to use in Logs Explorer"
echo "---------------------------------------------------"

echo "\nAfter restarting the Cloud SQL instance, follow these steps:"
echo "1. Connect to your database: gcloud sql connect $CLOUDSQL_INSTANCE --user=postgres"
echo "2. Run the SQL commands in pgaudit_scripts/01_init_pgaudit.sql"
echo "3. Download the sample data: ./pgaudit_scripts/02_download_data.sh"
echo "4. Populate the database: ./pgaudit_scripts/03_populate_database.sh"
echo "5. Run the sample queries in pgaudit_scripts/04_sample_queries.sql"
echo "6. View the logs using the query in pgaudit_scripts/05_logs_explorer_query.txt"

echo "\nTo view the contents of any script, use the 'cat' command, for example:"
echo "cat pgaudit_scripts/01_init_pgaudit.sql"
