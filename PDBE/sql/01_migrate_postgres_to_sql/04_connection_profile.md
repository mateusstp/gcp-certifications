# Creating a Connection Profile for PostgreSQL Source Instance

## Overview

A connection profile stores information about the source database instance and is used by the Database Migration Service to migrate data from the source to your destination Cloud SQL database instance.

## Steps

1. Get the internal IP of the PostgreSQL source VM
   - Navigate to Compute Engine > VM instances
   - Locate the instance called `postgresql-vm`
   - Copy the Internal IP value (e.g., 10.128.0.2)

2. Create a new connection profile
   - Navigate to Database Migration > Connection profiles
   - Click + Create Profile
   - Configure the profile:
     - Profile Role: Source
     - Database engine: PostgreSQL
     - Connection profile name: postgres-vm
     - Region: (select your region)
   - Configure connection details:
     - Hostname or IP address: (Internal IP from step 1)
     - Port: 5432
     - Username: migration_admin
     - Password: DMS_1s_cool!
   - Click Create

## Verification

After creation, the connection profile named `postgres-vm` should appear in the Connection profiles list and be available for use in migration jobs.
