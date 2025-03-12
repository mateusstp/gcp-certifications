export USERNAME=$(gcloud config list --format="value(core.account)")
export CLOUDSQL_INSTANCE=postgres88-fks40
export POSTGRESQL_IP=$(gcloud sql instances describe $CLOUDSQL_INSTANCE --format="value(ipAddresses[0].ipAddress)")
export PGPASSWORD=$(gcloud auth print-access-token)
echo "Testing connection to Cloud SQL instance: $CLOUDSQL_INSTANCE"
echo "USERNAME: $USERNAME"
echo "POSTGRESQL_IP: $POSTGRESQL_IP"
echo "PGPASSWORD: $PGPASSWORD"
psql --host=$POSTGRESQL_IP $USERNAME --dbname=orders
