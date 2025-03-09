#!/bin/bash

# Set environment variables
export PROJECT_ID=qwiklabs-gcp-00-ca6669264d23
export REGION=us-east1

# Set the project
gcloud config set project $PROJECT_ID

# Create a bucket
gsutil mb gs://$PROJECT_ID

# Enable the Dataflow API
gcloud services disable dataflow.googleapis.com --force
gcloud services enable dataflow.googleapis.com

# Run the Dataflow job
gcloud dataflow jobs run load-customer-data \
    --gcs-location=gs://dataflow-templates/latest/GCS_Text_to_Cloud_Spanner \
    --region=$REGION \
    --parameters inputFile=gs://cloud-training/OCBL375/Customer_List_500.csv,manifestFile=gs://$PROJECT_ID/manifest.json,instanceId=banking-ops-instance,databaseId=banking-ops-db

gcloud dataflow jobs run load-customer-data \
    --gcs-location=gs://dataflow-templates/latest/GCS_Text_to_Cloud_Spanner \
    --region=$REGION \
    --parameters importManifest=gs://$PROJECT_ID/manifest.json,instanceId=banking-ops-instance,databaseId=banking-ops-db