#!/bin/bash
# Complete lab script for "Configure Replication and Enable Point-in-Time-Recovery for Cloud SQL for PostgreSQL"

# Set the Cloud SQL instance names
export CLOUD_SQL_INSTANCE=postgres-orders
export NEW_INSTANCE_NAME=postgres-orders-pitr

echo "======================================================================"
echo "              Cloud SQL Point-in-Time Recovery Lab                   "
echo "======================================================================"

echo "\n[TASK 1] ENABLE BACKUPS ON CLOUD SQL FOR POSTGRESQL INSTANCE\n"

# Display instance details
echo "Displaying instance details for $CLOUD_SQL_INSTANCE..."
gcloud sql instances describe $CLOUD_SQL_INSTANCE

# Get current UTC time
CURRENT_TIME=$(date +"%R")
echo "\nCurrent UTC time: $CURRENT_TIME"

# Prompt for backup start time
echo "\nPlease enter a backup start time earlier than the current time (in HH:MM format):"
read BACKUP_TIME

# Enable scheduled backups
echo "\nEnabling scheduled backups with start time: $BACKUP_TIME"
gcloud sql instances patch $CLOUD_SQL_INSTANCE \
    --backup-start-time=$BACKUP_TIME

# Confirm changes
echo "\nVerifying backup configuration:"
gcloud sql instances describe $CLOUD_SQL_INSTANCE --format 'value(settings.backupConfiguration)'

echo "\n[TASK 2] ENABLE AND RUN POINT-IN-TIME RECOVERY\n"

# Enable point-in-time recovery
echo "Enabling point-in-time recovery with a 1-day retention period..."
gcloud sql instances patch $CLOUD_SQL_INSTANCE \
   --enable-point-in-time-recovery \
   --retained-transaction-log-days=1

# Instructions for connecting to the database
echo "\nTo make changes to the database, connect to the Cloud SQL instance using the Cloud Shell."
echo "Navigate to the Cloud SQL instance 'postgres-orders' in the Cloud Console."
echo "Click 'Open Cloud Shell' in the 'Connect to this instance' section."
echo "Run the auto-populated command and enter the password 'supersecret!' when prompted."
echo "In psql, change to the orders database with: \\c orders"
echo "Enter the password 'supersecret!' again when prompted."

# Get timestamp for point-in-time recovery
echo "\nCurrent UTC time in RFC 3339 format (for point-in-time recovery):"
PITR_TIMESTAMP=$(date --rfc-3339=seconds)
echo "$PITR_TIMESTAMP"

echo "\nIMPORTANT: Save this timestamp! You will need it for the point-in-time recovery."
echo "Wait a few moments before making any changes to the database."

# Instructions for making changes to the database
echo "\nAfter connecting to the database, run these commands to add a row and check the row count:"
echo "INSERT INTO distribution_centers VALUES(-80.1918, 25.7617, 'Miami FL', 11);"
echo "SELECT COUNT(*) FROM distribution_centers;"
echo "Exit psql with: \\q"

# Perform point-in-time recovery
echo "\nAfter making changes, perform point-in-time recovery with the saved timestamp."
echo "Please enter the timestamp you saved earlier (press Enter to use the captured timestamp):"
read USER_TIMESTAMP

# Use the captured timestamp if none provided
if [ -z "$USER_TIMESTAMP" ]; then
    TIMESTAMP=$PITR_TIMESTAMP
else
    TIMESTAMP=$USER_TIMESTAMP
fi

echo "\nCreating point-in-time clone with timestamp: $TIMESTAMP"
echo "This will create a new instance named: $NEW_INSTANCE_NAME"
echo "\nExecute the following command when ready:"
echo "gcloud sql instances clone $CLOUD_SQL_INSTANCE $NEW_INSTANCE_NAME --point-in-time '$TIMESTAMP'"

echo "\n[TASK 3] CONFIRM DATABASE RESTORATION\n"

echo "After the cloned instance is ready (may take 10+ minutes):"
echo "1. Navigate to the cloned instance 'postgres-orders-pitr' in the Cloud Console"
echo "2. Click 'Open Cloud Shell' to connect to the instance"
echo "3. Run the auto-populated command with password 'supersecret!'"
echo "4. Change to the orders database with: \\c orders"
echo "5. Verify restoration with: SELECT COUNT(*) FROM distribution_centers;"
echo "6. Confirm the row count is 10 (not 11), showing the restoration worked"

echo "\n======================================================================"
echo "                        Lab Complete!                              "
echo "======================================================================"
