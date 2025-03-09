#Spanner fudamentals
gcloud spanner instances create banking-instance-2 \
--config=regional-us-east4  \
--description="Banking Instance 2" \
--nodes=2


gcloud spanner instances list


gcloud spanner databases create banking-db-2 --instance=banking-instance-2

gcloud spanner instances update banking-instance-2 --nodes=1

gcloud spanner instances list


terraform -version
nano spanner.tf


terraform init

terraform plan

terraform apply

gcloud spanner instances list

gcloud spanner instances delete banking-instance-2

gcloud spanner instances list