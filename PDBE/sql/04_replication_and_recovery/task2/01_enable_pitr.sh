#!/bin/bash
# Enable point-in-time recovery on Cloud SQL for PostgreSQL instance

# Set the Cloud SQL instance name
export CLOUD_SQL_INSTANCE=postgres-orders

# Enable point-in-time recovery
echo "Enabling point-in-time recovery with a 1-day retention period..."
gcloud sql instances patch $CLOUD_SQL_INSTANCE \
   --enable-point-in-time-recovery \
   --retained-transaction-log-days=1

echo "\nPoint-in-time recovery has been enabled!"
echo "Note: It may take a minute or two for this command to complete."
echo "Remember that point-in-time recovery allows you to restore a database to any point within"
echo "the retention period (1 day) and always creates a new instance."
