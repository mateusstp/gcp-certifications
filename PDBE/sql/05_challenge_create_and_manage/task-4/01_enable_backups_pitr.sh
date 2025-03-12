#!/bin/bash
# Script to enable backups and point-in-time recovery on the Cloud SQL instance

echo "===================================================================="
echo "   Enabling Backups and Point-in-Time Recovery on Cloud SQL"
echo "===================================================================="

# Set variables
CLOUD_SQL_INSTANCE="postgres88-fks40"
NEW_INSTANCE_NAME="postgres-orders-pitr"
PITR_DAYS="3"  # Required value from the challenge lab
BACKUP_TIME="06:00"  # Example: 6 AM UTC

echo "# Enable automated backups"

gcloud sql instances patch $CLOUD_SQL_INSTANCE --backup-start-time=$BACKUP_TIME

echo "- Enable 'Point-in-time recovery'"

gcloud sql instances patch $CLOUD_SQL_INSTANCE \
  --enable-point-in-time-recovery \
  --retained-transaction-log-days=$PITR_DAYS


TIME_STAMP=$(date -u --rfc-3339=ns | sed -r 's/ /T/; s/\.([0-9]{3}).*/\.\1Z/')
echo "# Perform point-in-time recovery $TIME_STAMP"
gcloud sql instances clone $CLOUDSQL_INSTANCE $NEW_INSTANCE_NAME \
