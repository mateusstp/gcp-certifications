#!/bin/bash
# Perform point-in-time recovery by creating a clone at a specific timestamp

# Set environment variables
export CLOUD_SQL_INSTANCE=postgres-orders
export NEW_INSTANCE_NAME=postgres-orders-pitr

# Prompt for the timestamp to use for point-in-time recovery
# echo "Please enter the timestamp you saved earlier (in RFC 3339 format, e.g., '2021-11-01 15:00:00'):"
# read TIMESTAMP
export TIMESTAMP=$(date --rfc-3339=seconds)
# Create a point-in-time clone of the instance
echo "\nCreating point-in-time clone with timestamp: $TIMESTAMP"
gcloud sql instances clone $CLOUD_SQL_INSTANCE $NEW_INSTANCE_NAME \
    --point-in-time '$TIMESTAMP'

echo "\nThis process will take approximately 10 minutes or more to complete."
echo "While waiting, you can proceed to Task 3 to prepare for verification once the clone is ready."
echo "\nThe cloned instance will be named: $NEW_INSTANCE_NAME"
