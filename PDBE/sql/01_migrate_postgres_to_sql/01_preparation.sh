#!/bin/bash

# GSP918: Database Migration to Cloud SQL for PostgreSQL
# Step 1: Prepare the source database for migration

# Install the pglogical database extension
sudo apt install postgresql-13-pglogical

# Download and apply configurations to enable pglogical extension
sudo su - postgres -c "gsutil cp gs://cloud-training/gsp918/pg_hba_append.conf ."
sudo su - postgres -c "gsutil cp gs://cloud-training/gsp918/postgresql_append.conf ."
sudo su - postgres -c "cat pg_hba_append.conf >> /etc/postgresql/13/main/pg_hba.conf"
sudo su - postgres -c "cat postgresql_append.conf >> /etc/postgresql/13/main/postgresql.conf"

# Restart PostgreSQL service to apply changes
sudo systemctl restart postgresql@13-main

# Note: The configuration changes include:
# In pg_hba.conf:
# host    all all 0.0.0.0/0   md5
#
# In postgresql.conf:
# wal_level = logical
# max_worker_processes = 10
# max_replication_slots = 10
# max_wal_senders = 10
# shared_preload_libraries = 'pglogical'
# max_wal_size = 1GB
# min_wal_size = 80MB
# listen_addresses = '*'

# After VPC peering is set up, restrict access to only the automatically allocated IP range
# Replace 0.0.0.0/0 with the allocated IP range in pg_hba.conf, for example:
# host    all all 10.107.176.0/24   md5
