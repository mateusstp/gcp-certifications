# Securing a Cloud SQL for PostgreSQL Instance

This lab demonstrates how to secure a Cloud SQL for PostgreSQL instance through three main security methods:

1. Setting up Customer-Managed Encryption Keys (CMEK) for Cloud SQL
2. Enabling and configuring pgAudit on a Cloud SQL PostgreSQL instance
3. Configuring Cloud SQL IAM database authentication

## Overview

Customer-managed encryption keys (CMEK) let you use your own cryptographic keys for data at rest in Cloud SQL. After adding customer-managed encryption keys, whenever an API call is made, Cloud SQL uses your key to access data.

## What you'll learn

- How to setup CMEK for Cloud SQL for PostgreSQL
- How to enable and configure pgAudit on a Cloud SQL for PostgreSQL instance
- How to configure Cloud SQL for PostgreSQL IAM database authentication

## Files in this directory

- `01_setup_cmek.sh`: Script for creating a service account and setting up CMEK for Cloud SQL
- `02_enable_pgaudit.sh`: Script for enabling and configuring pgAudit
- `03_configure_iam_auth.sh`: Script for configuring Cloud SQL IAM database authentication
- `create_orders_db.sql`: SQL script to create and populate the orders database
- `sample_data/`: Directory containing sample CSV data files for the orders database
