
export PROJECT_ID=qwiklabs-gcp-04-da0e5940c354
gcloud config set project $PROJECT_ID

# Enable required APIs for Database Migration Service
echo "Enabling Database Migration API..."
gcloud services enable datamigration.googleapis.com

echo "Enabling Service Networking API..."
gcloud services enable servicenetworking.googleapis.com