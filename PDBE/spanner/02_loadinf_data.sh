gcloud config set project qwiklabs-gcp-00-88dd129c8d91

gcloud auth list


gcloud config list project

gcloud spanner databases execute-sql banking-db --instance=banking-instance \
 --sql="INSERT INTO Customer (CustomerId, Name, Location) VALUES ('bdaaaa97-1b4b-4e58-b4ad-84030de92235', 'Richard Nelson', 'Ada Ohio')"


nano insert.py
python3 insert.py

nano batch_insert.py

python3 batch_insert.py



gsutil mb gs://Project ID
touch emptyfile
gsutil cp emptyfile gs://Project ID/tmp/emptyfile



gcloud services disable dataflow.googleapis.com --force
gcloud services enable dataflow.googleapis.com