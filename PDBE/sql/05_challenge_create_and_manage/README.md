# Create and Manage Cloud SQL for PostgreSQL Instances: Challenge Lab

This directory contains scripts and instructions to complete the "Create and Manage Cloud SQL for PostgreSQL Instances" challenge lab.

> DO NOT USE THIS SCRITPS TO SOLVE  YOUR LAB, BECAUSE EACH CHALLENGE LAB IS DIFFERENT AND YOU WILL NEED TO FOLLOW THE INSTRUCTIONS IN THE CLOUD SKILL BOOST.

## Challenge Scenario

Your employer has a stand-alone PostgreSQL database on a Compute Instance VM. You need to:
1. Migrate the database to a Cloud SQL for PostgreSQL instance using Database Migration Services and VPC Peering
2. Configure and test Cloud SQL IAM Database Authentication on the migrated instance
3. Enable backups and point-in-time recovery to protect the database
4. Confirm point-in-time recovery works by creating a clone at a specific timestamp

## Tasks

This challenge lab is divided into 4 main tasks:

### Task 1: Migrate a PostgreSQL database to Cloud SQL
- Scripts in the `task1/` directory
- Prepare the source database with pglogical extension
- Create a migration user and grant necessary privileges
- Set up Database Migration Service and perform migration

### Task 2: Promote the Cloud SQL instance
- Scripts in the `task2/` directory
- Promote the replica to a standalone instance

### Task 3: Implement IAM authentication
- Scripts in the `task3/` directory
- Configure cloud SQL to allow connections from VM
- Create Cloud SQL IAM user and grant permissions
- Verify access using the IAM user

### Task 4: Configure and test point-in-time recovery
- Scripts in the `task4/` directory
- Enable backups and point-in-time recovery
- Make database changes after recording a timestamp
- Create a clone at the recorded timestamp
- Verify the clone doesn't have the changes made after the timestamp