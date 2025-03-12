# Configure Replication and Enable Point-in-Time-Recovery for Cloud SQL for PostgreSQL

This lab demonstrates how to configure and test point-in-time recovery for a Cloud SQL for PostgreSQL instance, which helps you recover an instance to a specific point in time.

## Overview

Point-in-time recovery helps you recover an instance to a specific point in time. For example, if an error causes a loss of data, you can recover a database to its state before the error occurred. A point-in-time recovery always creates a new instance; you cannot perform a point-in-time recovery to an existing instance. The new instance inherits the settings of the source instance.

## What you'll learn

- How to enable point-in-time recovery on a Cloud SQL for PostgreSQL instance
- How to perform a point-in-time recovery
- How to confirm that the recovered database reflects an earlier point in time

## Files in this directory

- `task1/`: Scripts for enabling backups on the Cloud SQL for PostgreSQL instance
- `task2/`: Scripts for enabling and running point-in-time recovery
- `task3/`: Scripts for confirming database restoration to correct point-in-time
- `complete_lab_script.sh`: Comprehensive script combining all steps of the lab

## Setting Up Permissions

Before running the scripts, you need to make them executable. You can do this in several ways:

### Option 1: Run the setup script

Navigate to the parent directory and run the setup script:

```bash
cd /path/to/gcp-certifications/PDBE/sql
./setup.sh
```

This script will automatically set the appropriate permissions for all scripts in the project.

### Option 2: Set permissions manually

Set permissions for all shell scripts in the replication_and_recovery directory:

```bash
chmod +x task1/*.sh task2/*.sh complete_lab_script.sh
```

If you're in the parent directory, you can use:

```bash
chmod +x 04_replication_and_recovery/task1/*.sh \
       04_replication_and_recovery/task2/*.sh \
       04_replication_and_recovery/complete_lab_script.sh
```
