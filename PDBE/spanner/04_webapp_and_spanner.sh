export PROJECT_ID=qwiklabs-gcp-01-b7feec851294
export REGION=us-east4
gcloud config set project $PROJECT_ID

gcloud auth list

gcloud config list project


gcloud services enable spanner.googleapis.com
gcloud services enable artifactregistry.googleapis.com
gcloud services enable containerregistry.googleapis.com
gcloud services enable run.googleapis.com


git clone https://github.com/GoogleCloudPlatform/training-data-analyst

cd training-data-analyst/courses/cloud-spanner/omegatrade/

cd backend/app/models

more company.model.js

cd ../../../frontend/src/app/components


more company/manage-company/manage-company.component.ts


cd ../../../../backend

nano .env

PROJECTID = $PROJECT_ID
INSTANCE = omegatrade-instance
DATABASE = omegatrade-db
JWT_KEY = w54p3Y?4dj%8Xqa2jjVC84narhe5Pk
EXPIRE_IN = 30d


nvm install 22.6

npm install npm -g
npm install --loglevel=error

docker build -t gcr.io/$PROJECT_ID/omega-trade/backend:v1 -f dockerfile.prod .

gcloud auth configure-docker

docker push gcr.io/$PROJECT_ID/omega-trade/backend:v1

gcloud run deploy omegatrade-backend \
--platform managed \
--region $REGION \
--image gcr.io/$PROJECT_ID/omega-trade/backend:v1 \
--memory 512Mi \
--allow-unauthenticated


unset SPANNER_EMULATOR_HOST
node seed-data.js


cd ../frontend/src/environments

nano environment.ts

cd ../..

npm install npm -g
npm install --loglevel=error

docker build -t gcr.io/$PROJECT_ID/omegatrade/frontend:v1 -f dockerfile .

docker push gcr.io/$PROJECT_ID/omegatrade/frontend:v1

gcloud run deploy omegatrade-frontend \
--platform managed \
--region $REGION \
--image gcr.io/$PROJECT_ID/omegatrade/frontend:v1 \
--allow-unauthenticated