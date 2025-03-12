#!/bin/bash
# Enable scheduled backups on Cloud SQL for PostgreSQL instance

# Set the Cloud SQL instance name
export CLOUD_SQL_INSTANCE=postgres-orders

# Display the current UTC time for reference
CURRENT_TIME=$(date +"%R")
echo "Current UTC time: $CURRENT_TIME"

# Prompt for backup start time
echo "\nPlease enter a backup start time earlier than the current time (in HH:MM format):"
read BACKUP_TIME

# Enable scheduled backups with the specified start time
echo "\nEnabling scheduled backups with start time: $BACKUP_TIME"
gcloud sql instances patch $CLOUD_SQL_INSTANCE \
    --backup-start-time=$BACKUP_TIME

# Confirm changes
echo "\nVerifying backup configuration:"
gcloud sql instances describe $CLOUD_SQL_INSTANCE --format 'value(settings.backupConfiguration)'

echo "\nYou should see output similar to: backupRetentionSettings={'retainedBackups': 7, 'retentionUnit': 'COUNT'}; enabled=True;kind=sql#backupConfiguration; startTime=XX:XX; transactionLogRetentionDays=7"
echo "This confirms that backups are enabled and scheduled for the time you specified."
