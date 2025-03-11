#!/bin/bash

# This script runs all the steps for the "Connect an App to a Cloud SQL for PostgreSQL Instance" lab

# Set error handling
set -e
gcloud config set project qwiklabs-gcp-03-75dcd7d2212e
export PROJECT_ID=$(gcloud config list --format 'value(core.project)')

gcloud config set compute/zone "us-central1-c"
export ZONE=$(gcloud config get compute/zone)

gcloud config set compute/region "us-central1"
export REGION=$(gcloud config get compute/region)



# Run all scripts in order
echo "Starting lab setup..."

# Task 1: Initialize APIs and create a Cloud IAM service account
echo "\nTask 1: Initializing APIs and creating a Cloud IAM service account"
bash ./01_initialize_apis_and_create_service_account.sh

# Task 2: Deploy a lightweight GKE application
echo "\nTask 2: Deploying a lightweight GKE application"
bash ./02_deploy_gke_application.sh

# Task 3: Connect the GKE application to an external load balancer
echo "\nTask 3: Connecting the GKE application to an external load balancer"
bash ./03_connect_app_to_load_balancer.sh

# Task 4: Verify full read/write capabilities of application to database
echo "\nTask 4: Verifying application database capabilities"
bash ./04_verify_database_capabilities.sh

echo "\nLab setup completed successfully!"
