#!/bin/bash

# Set environment variables
export PROJECT_ID=qwiklabs-gcp-00-ca6669264d23
export DATABASE_ID=banking-ops-db
export INSTANCE_ID=banking-ops-instance
export REGION=us-east1

# Set the project
gcloud config set project $PROJECT_ID

# Download the CSV file
gsutil cp gs://cloud-training/OCBL375/Customer_List_500.csv .

# Load data into the Customer table
gcloud spanner databases execute-sql $DATABASE_ID --instance=$INSTANCE_ID --sql="
LOAD DATA LOCAL INFILE 'Customer_List_500.csv'
INTO TABLE Customer
FIELDS TERMINATED BY ',' 
ENCLOSED BY '\"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
"

gcloud spanner databases execute-sql $DATABASE_ID --instance=$INSTANCE_ID --sql="LOAD DATA LOCAL INFILE 'Customer_List_500.csv' INTO TABLE Customer FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;"


#!/bin/bash

# Set environment variables
export DATABASE_ID=banking-ops-db
export INSTANCE_ID=banking-ops-instance
export PROJECT_ID=qwiklabs-gcp-00-ca6669264d23

# Set the project
gcloud config set project $PROJECT_ID

# Read CSV and generate INSERT statements
while IFS=, read -r CustomerId Name Location
do
  gcloud spanner databases execute-sql $DATABASE_ID --instance=$INSTANCE_ID --sql="INSERT INTO Customer (CustomerId, Name, Location) VALUES ('$CustomerId', '$Name', '$Location');"
done < Customer_List_500.csv