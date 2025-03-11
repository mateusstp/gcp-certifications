#!/bin/bash

# Task 2: Deploy a lightweight GKE application

# Set error handling
set -e

# Create a Kubernetes cluster
echo "Creating Kubernetes cluster..."

export CLOUDSQL_SERVICE_ACCOUNT=cloudsql-service-account
export PROJECT_ID=$(gcloud config list --format 'value(core.project)')
export ZONE=$(gcloud config get compute/zone)
export REGION=$(gcloud config get compute/region)

gcloud container clusters create postgres-cluster \
--zone=$ZONE --num-nodes=2

# Create Kubernetes secrets for database access
echo "Creating Kubernetes secrets for database access..."
kubectl create secret generic cloudsql-instance-credentials \
--from-file=$CLOUDSQL_SERVICE_ACCOUNT.json
    
kubectl create secret generic cloudsql-db-credentials \
--from-literal=username=postgres \
--from-literal=password=supersecret! \
--from-literal=dbname=gmemegen_db

# Download and build the GKE application container
echo "Downloading and building the GKE application container..."
gsutil -m cp -r gs://spls/gsp919/gmemegen .
cd gmemegen

# Create environment variables
export REGION=$(gcloud config get compute/region)
export PROJECT_ID=$(gcloud config list --format 'value(core.project)')
export REPO=gmemegen

# Configure Docker authentication for the Artifact Registry
echo "Configuring Docker for Artifact Registry..."
gcloud auth configure-docker ${REGION}-docker.pkg.dev -q

# Create the Artifact Registry repository
echo "Creating Artifact Registry repository..."
gcloud artifacts repositories create $REPO \
    --repository-format=docker --location=$REGION

# Build and push the Docker image
echo "Building and pushing Docker image..."
docker build -t ${REGION}-docker.pkg.dev/${PROJECT_ID}/gmemegen/gmemegen-app:v1 .
docker push ${REGION}-docker.pkg.dev/${PROJECT_ID}/gmemegen/gmemegen-app:v1

# Configure and deploy the GKE application
echo "Configuring and deploying the GKE application..."

# Replace placeholders in the deployment yaml
sed -i "s|\${REGION}|${REGION}|g" gmemegen_deployment.yaml
sed -i "s|\${PROJECT_ID}|${PROJECT_ID}|g" gmemegen_deployment.yaml

# Deploy the application
kubectl create -f gmemegen_deployment.yaml

echo "Waiting for pods to start..."
kubectl wait --for=condition=Ready pods --all --timeout=300s

echo "GKE application deployed successfully."

# Return to the original directory
cd ..
