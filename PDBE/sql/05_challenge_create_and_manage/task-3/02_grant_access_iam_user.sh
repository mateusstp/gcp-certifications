# add IAM user to Cloud SQL instance

export USERNAME=$(gcloud config list --format="value(core.account)")
export CLOUDSQL_INSTANCE=postgres88-fks40
export POSTGRESQL_IP=$(gcloud sql instances describe $CLOUDSQL_INSTANCE --format="value(ipAddresses[0].ipAddress)")
export PGPASSWORD=$(gcloud auth print-access-token)
echo "Testing connection to Cloud SQL instance: $CLOUDSQL_INSTANCE"
echo "USERNAME: $USERNAME"
echo "POSTGRESQL_IP: $POSTGRESQL_IP"
echo "PGPASSWORD: $PGPASSWORD"

gcloud sql connect $CLOUDSQL_INSTANCE --user=postgres --quiet


GRANT SELECT ON TABLE order_items TO "student-04-aa2e186d65bb@qwiklabs.net";


\q


export PGPASSWORD=$(gcloud auth print-access-token)
psql --host=$POSTGRESQL_IP $USERNAME --dbname=orders

SELECT COUNT(*) FROM order_items;


SELECT COUNT(*) FROM users;