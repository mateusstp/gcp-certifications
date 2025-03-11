# Database Migration to Cloud SQL for PostgreSQL (GSP918)

This directory contains scripts and commands for the Google Cloud lab "Database Migration to Cloud SQL for PostgreSQL" (GSP918). The lab demonstrates how to migrate a stand-alone PostgreSQL database to Cloud SQL for PostgreSQL using a continuous Database Migration Service job with VPC peering for connectivity.

## Lab Overview

In this lab, you learn how to:

- Prepare a source PostgreSQL database for migration
- Create a profile for a source connection to a PostgreSQL instance
- Configure connectivity between source and destination database instances using VPC peering
- Configure firewall and database access rules
- Create, run, and verify a continuous migration job using Database Migration Service
- Promote the destination instance to be a stand-alone database

## Files in this Directory

- `01_preparation.sh`: Commands to prepare the source database for migration
- `02_pglogical_setup.sql`: SQL commands to set up pglogical extension
- `03_user_permissions.sql`: SQL commands to create and configure the migration user
- `04_connection_profile.md`: Instructions for creating a connection profile
- `05_migration_job.md`: Instructions for creating and configuring a migration job

## Prerequisites

- Google Cloud project with the Database Migration API and Service Networking API enabled
- PostgreSQL source database (running on a VM in the lab)
- Permissions to create Cloud SQL instances and configure VPC peering
