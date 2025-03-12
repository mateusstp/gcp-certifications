#!/bin/bash
# Script to test database access before Cloud SQL IAM authentication is configured

export CLOUDSQL_INSTANCE=postgres-orders
export USERNAME=$(gcloud config list --format="value(core.account)")
export POSTGRESQL_IP=$(gcloud sql instances describe $CLOUDSQL_INSTANCE --format="value(ipAddresses[0].ipAddress)")
export PGPASSWORD=$(gcloud auth print-access-token)

echo "Testing access before configuring IAM authentication (this should fail):"
echo "------------------------------------------------------------------"
echo "Running: psql --host=$POSTGRESQL_IP $USERNAME --dbname=orders"
psql --host=$POSTGRESQL_IP $USERNAME --dbname=orders
echo "This should fail with an 'authentication failed' message because IAM authentication has not been configured yet."
