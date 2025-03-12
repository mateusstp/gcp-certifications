#!/bin/bash
# Script to check migration job status

# Set your region - replace with the lab-specific region if needed
REGION="us-west1"

gcloud database-migration migration-jobs describe postgres-migration-job --region=$REGION

gcloud database-migration migration-jobs promote postgres-migration-job --region=$REGION
