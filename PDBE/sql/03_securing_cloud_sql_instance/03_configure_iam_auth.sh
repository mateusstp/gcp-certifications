#!/bin/bash
# Script for Task 3: Configuring Cloud SQL IAM database authentication

export CLOUDSQL_INSTANCE=postgres-orders

# Test database access using a Cloud IAM user before Cloud SQL IAM authentication is configured
echo "Testing access before configuring IAM authentication (this should fail):"
echo "------------------------------------------------------------------"
export USERNAME=$(gcloud config list --format="value(core.account)")
export POSTGRESQL_IP=$(gcloud sql instances describe $CLOUDSQL_INSTANCE --format="value(ipAddresses[0].ipAddress)")
export PGPASSWORD=$(gcloud auth print-access-token)
psql --host=$POSTGRESQL_IP $USERNAME --dbname=orders
echo "(This should fail with an 'authentication failed' message)"

# Instructions for creating a Cloud SQL IAM user in the Cloud Console
echo ""
echo "Now create a Cloud SQL IAM user in the Cloud Console:"
echo "1. Navigate to Databases > SQL and click on 'postgres-orders'"
echo "2. Click 'Users' to open the Users panel"
echo "3. Click 'Add user account'"
echo "4. Select 'Cloud IAM'"
echo "5. In the Principal box enter your lab username"
echo "6. Click 'Add'"
echo ""
echo "Then connect to the postgres-orders instance and grant access to the order_items table:"
echo "gcloud sql connect postgres-orders --user=postgres --quiet"
echo "(Enter password: supersecret!)"
echo "\c orders"
echo "(Enter password: supersecret!)"
echo "GRANT ALL PRIVILEGES ON TABLE order_items TO \"[YOUR_IAM_USERNAME]\";"
echo "\q"

# Test database access after Cloud SQL IAM authentication is configured
echo ""
echo "After configuring IAM authentication, test access again:"
echo "export PGPASSWORD=$(gcloud auth print-access-token)"
echo "psql --host=$POSTGRESQL_IP $USERNAME --dbname=orders"
echo ""
echo "Then test your access permissions with these queries:"
echo "SELECT COUNT(*) FROM order_items; -- Should succeed"
echo "SELECT COUNT(*) FROM users; -- Should fail with 'permission denied'"
