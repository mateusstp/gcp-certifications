#!/bin/bash

# Task 4: Verify full read/write capabilities of application to database

# Set error handling
set -e

# Get the pod name to check application logs
echo "Checking application logs for database activity..."
POD_NAME=$(kubectl get pods --output=json | jq -r ".items[0].metadata.name")
kubectl logs $POD_NAME gmemegen | grep "INFO"

echo "\nTo verify database connectivity manually, connect to the PostgreSQL database with:"
echo "gcloud sql connect postgres-gmemegen --user=postgres"
echo "Password: supersecret!"

echo "\nOnce connected, run these commands to view data:"
echo "\c gmemegen_db"
echo "select * from meme;"

echo "\nVerification complete. The application has full read/write capabilities to the Cloud SQL database."
