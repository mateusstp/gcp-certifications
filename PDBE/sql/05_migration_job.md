# Creating and Managing a Continuous Migration Job

## Overview

This document outlines the process of creating and managing a continuous migration job to migrate a PostgreSQL database to Cloud SQL using Database Migration Service.

## Creating a Migration Job

1. Navigate to Database Migration > Migration jobs
2. Click + Create Migration Job
3. Configure basic settings:
   - Migration job name: vm-to-cloudsql
   - Source database engine: PostgreSQL
   - Destination region: (your region)
   - Destination database engine: Cloud SQL for PostgreSQL
   - Migration job type: Continuous
   - Click Save & Continue

4. Define the source instance:
   - Source connection profile: postgres-vm
   - Click Save & Continue

5. Create the destination instance:
   - Destination Instance ID: postgresql-cloudsql
   - Password: supersecret!
   - Cloud SQL edition: Enterprise edition
   - Database version: Cloud SQL for PostgreSQL 13
   - Choose Single zone and select your zone
   - Instance connectivity: Select both Private IP and Public IP
   - Use an automatically allocated IP range
   - Click Allocate & Connect
   - Machine shape: 1 vCPU, 3.75 GB
   - Storage type: SSD
   - Storage capacity: 10 GB
   - Click Create & Continue

6. Define connectivity method:
   - Connectivity method: VPC peering
   - VPC: default
   - Click Configure & Continue

## Configure Access for Migration

1. Get the allocated IP range:
   - Navigate to VPC network > VPC network peering
   - Click on servicenetworking-googleapis-com
   - Click on Effective Routes View
   - Select default network and your region
   - Copy the Destination IP range (e.g., 10.107.176.0/24)

2. Update PostgreSQL configuration:
   - Edit /etc/postgresql/13/main/pg_hba.conf
   - Replace the line:
     ```
     host    all all 0.0.0.0/0   md5
     ```
   - With:
     ```
     host    all all 10.107.176.0/24   md5
     ```
   - Restart PostgreSQL service

## Test and Start Migration

1. Review migration job details
2. Click Test Job
3. After successful test, click Create & Start Job

## Monitor Migration Progress

Monitor the migration job status:
1. Navigate to Database Migration > Migration jobs
2. Click on the job name (vm-to-cloudsql)
3. Review the status:
   - Starting
   - Running Full dump in progress
   - Running CDC in progress

## Testing Continuous Migration

1. Connect to the source PostgreSQL instance and insert new data
2. Connect to the Cloud SQL instance and verify the new data is migrated

## Promote Cloud SQL Instance

1. Navigate to Database Migration > Migration jobs
2. Click on the migration job (vm-to-cloudsql)
3. Click Promote
4. Confirm promotion
5. The job status will change to Completed
6. The Cloud SQL instance is now a stand-alone instance for reading and writing data
