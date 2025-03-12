#!/bin/bash
# Script to test database access after Cloud SQL IAM authentication is configured

export CLOUDSQL_INSTANCE=postgres-orders
export USERNAME=$(gcloud config list --format="value(core.account)")
export POSTGRESQL_IP=$(gcloud sql instances describe $CLOUDSQL_INSTANCE --format="value(ipAddresses[0].ipAddress)")

# Generate a fresh access token for authentication
export PGPASSWORD=$(gcloud auth print-access-token)

echo "Testing access after configuring IAM authentication:"
echo "------------------------------------------------------------------"
echo "Running: psql --host=$POSTGRESQL_IP $USERNAME --dbname=orders"
psql --host=$POSTGRESQL_IP $USERNAME --dbname=orders
echo "If you've successfully connected, you can now run the test queries."
