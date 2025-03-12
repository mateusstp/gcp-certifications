#!/bin/bash
# Display Cloud SQL instance details

# Set the Cloud SQL instance name
export CLOUD_SQL_INSTANCE=postgres-orders

# Display instance details
echo "Displaying instance details for $CLOUD_SQL_INSTANCE..."
gcloud sql instances describe $CLOUD_SQL_INSTANCE

echo "\nNotice the current backup configuration in the instance details above."
