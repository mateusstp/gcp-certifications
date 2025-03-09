#!/bin/bash

# Set environment variables
export PROJECT_ID="qwiklabs-gcp-00-ca6669264d23"
export INSTANCE_ID="banking-ops-instance"
export DATABASE_ID="banking-ops-db"
export REGION="us-east1"

# Set the project
gcloud config set project $PROJECT_ID

# Create a Cloud Spanner instance
gcloud spanner instances create $INSTANCE_ID \
  --config=regional-$REGION \
  --description="Banking Instance 3" \
  --processing-units=1000

# Create a Cloud Spanner database
gcloud spanner databases create $DATABASE_ID --instance=$INSTANCE_ID

# Execute DDL statements to create tables
gcloud spanner databases ddl update $DATABASE_ID --instance=$INSTANCE_ID --ddl="CREATE TABLE Portfolio (\n  PortfolioId INT64 NOT NULL,\n  Name STRING(MAX),\n  ShortName STRING(MAX),\n  PortfolioInfo STRING(MAX)\n) PRIMARY KEY(PortfolioId)"

gcloud spanner databases ddl update $DATABASE_ID --instance=$INSTANCE_ID --ddl="CREATE TABLE Category (\n  CategoryId INT64 NOT NULL,\n  PortfolioId INT64 NOT NULL,\n  CategoryName STRING(MAX),\n  PortfolioInfo STRING(MAX)\n) PRIMARY KEY(CategoryId)"

gcloud spanner databases ddl update $DATABASE_ID --instance=$INSTANCE_ID --ddl="CREATE TABLE Product (\n  ProductId INT64 NOT NULL,\n  CategoryId INT64 NOT NULL,\n  PortfolioId INT64 NOT NULL,\n  ProductName STRING(MAX),\n  ProductAssetCode STRING(25),\n  ProductClass STRING(25)\n) PRIMARY KEY(ProductId)"

gcloud spanner databases ddl update $DATABASE_ID --instance=$INSTANCE_ID --ddl="CREATE TABLE Customer (\n  CustomerId STRING(36) NOT NULL,\n  Name STRING(MAX) NOT NULL,\n  Location STRING(MAX) NOT NULL\n) PRIMARY KEY(CustomerId)"