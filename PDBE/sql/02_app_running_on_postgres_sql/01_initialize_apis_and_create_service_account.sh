#!/bin/bash

# Task 1: Initialize APIs and create a Cloud IAM service account

# Set error handling
set -e

# Enable the Artifact Registry API
echo "Enabling Artifact Registry API..."
gcloud services enable artifactregistry.googleapis.com

# Create a Service Account for Cloud SQL
echo "Creating Service Account for Cloud SQL..."
export PROJECT_ID=$(gcloud config list --format 'value(core.project)')
export CLOUDSQL_SERVICE_ACCOUNT=cloudsql-service-account

gcloud iam service-accounts create $CLOUDSQL_SERVICE_ACCOUNT --project=$PROJECT_ID

gcloud projects add-iam-policy-binding $PROJECT_ID \
--member="serviceAccount:$CLOUDSQL_SERVICE_ACCOUNT@$PROJECT_ID.iam.gserviceaccount.com" \
--role="roles/cloudsql.admin"

# Create and export keys to a local file
echo "Creating and exporting service account keys..."
gcloud iam service-accounts keys create $CLOUDSQL_SERVICE_ACCOUNT.json \
    --iam-account=$CLOUDSQL_SERVICE_ACCOUNT@$PROJECT_ID.iam.gserviceaccount.com \
    --project=$PROJECT_ID

echo "Service account created and key exported successfully."
