#!/bin/bash
# Script to perform point-in-time recovery by creating a clone

# Set variables
CLOUD_SQL_INSTANCE="postgres-orders-migrated"
NEW_INSTANCE_NAME="postgres-orders-pitr"

# Check if a timestamp was provided as argument
if [ -z "$1" ]; then
  echo "No timestamp provided. Please provide a timestamp in RFC 3339 format."
  echo "Usage: $0 'YYYY-MM-DDThh:mm:ss.sssZ'"
  exit 1
fi

TIMESTAMP="$1"

# Perform point-in-time recovery by creating a clone
gcloud sql instances clone $CLOUD_SQL_INSTANCE $NEW_INSTANCE_NAME \
  --point-in-time "$TIMESTAMP"

echo "Point-in-time recovery clone operation initiated."
echo "This operation may take 10 minutes or more to complete."
echo "Monitor the progress in the Google Cloud Console: SQL > Operations"
