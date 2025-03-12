#!/bin/bash
# Script for Task 1: Creating a Cloud SQL for PostgreSQL instance with CMEK enabled
gcloud config set project qwiklabs-gcp-02-ac639e5354cb

# Get project ID
export PROJECT_ID=$(gcloud config list --format 'value(core.project)')

# Create a per-product, per-project service account for Cloud SQL
gcloud beta services identity create \
    --service=sqladmin.googleapis.com \
    --project=$PROJECT_ID

# Create a Cloud KMS keyring
export KMS_KEYRING_ID=cloud-sql-keyring
export ZONE=$(gcloud compute instances list --filter="NAME=bastion-vm" --format=json | jq -r .[].zone | awk -F "/zones/" '{print $NF}')
export REGION=${ZONE::-2}

gcloud kms keyrings create $KMS_KEYRING_ID \
    --location=$REGION

# Create the Cloud KMS key
export KMS_KEY_ID=cloud-sql-key
gcloud kms keys create $KMS_KEY_ID \
 --location=$REGION \
 --keyring=$KMS_KEYRING_ID \
 --purpose=encryption

# Bind the key to the service account
export PROJECT_NUMBER=$(gcloud projects describe ${PROJECT_ID} \
    --format 'value(projectNumber)')
gcloud kms keys add-iam-policy-binding $KMS_KEY_ID \
    --location=$REGION \
    --keyring=$KMS_KEYRING_ID \
    --member=serviceAccount:service-${PROJECT_NUMBER}@gcp-sa-cloud-sql.iam.gserviceaccount.com \
    --role=roles/cloudkms.cryptoKeyEncrypterDecrypter

# Get authorized IP addresses
export AUTHORIZED_IP=$(gcloud compute instances describe bastion-vm \
    --zone=$ZONE \
    --format 'value(networkInterfaces[0].accessConfigs.natIP)')
echo "Authorized IP: $AUTHORIZED_IP"

export CLOUD_SHELL_IP=$(curl ifconfig.me)
echo "Cloud Shell IP: $CLOUD_SHELL_IP"

# Create Cloud SQL for PostgreSQL instance with CMEK enabled
export KEY_NAME=$(gcloud kms keys describe $KMS_KEY_ID \
    --keyring=$KMS_KEYRING_ID --location=$REGION \
    --format 'value(name)')

export CLOUDSQL_INSTANCE=postgres-orders
gcloud sql instances create $CLOUDSQL_INSTANCE \
    --project=$PROJECT_ID \
    --authorized-networks=${AUTHORIZED_IP}/32,$CLOUD_SHELL_IP/32 \
    --disk-encryption-key=$KEY_NAME \
    --database-version=POSTGRES_13 \
    --cpu=1 \
    --memory=3840MB \
    --region=$REGION \
    --root-password=supersecret!

echo "Cloud SQL instance created with CMEK encryption"
