# Connect an App to a Cloud SQL for PostgreSQL Instance

This lab demonstrates how to connect a Kubernetes app to a Cloud SQL for PostgreSQL database instance. The lab includes creating a GKE cluster, deploying a sample application, and configuring the app to connect to a PostgreSQL database.

## Lab Overview

In this lab, you will:

1. Initialize APIs and create a Cloud IAM service account
2. Deploy a lightweight GKE application
3. Connect the GKE application to an external load balancer
4. Verify full read/write capabilities of application to database

## Scripts

The following scripts automate the steps in this lab:

- `00_setup.sh`: Main script that runs all the lab steps in sequence
- `01_initialize_apis_and_create_service_account.sh`: Enables APIs and creates a service account
- `02_deploy_gke_application.sh`: Creates a GKE cluster and deploys the application
- `03_connect_app_to_load_balancer.sh`: Creates a load balancer and exposes the app
- `04_verify_database_capabilities.sh`: Verifies database connectivity

## Running the Lab

To run the entire lab, execute:

```bash
./00_setup.sh
```

Or you can run each script individually to complete the lab step by step.

## Application Details

The lab uses a simple Flask-SQLAlchemy web application called gMemegen that creates memes by combining images with header and footer text. The application:

- Stores meme data in a PostgreSQL database
- Runs on a single pod with two containers: one for the app and one for the Cloud SQL Auth Proxy
- Is exposed via a LoadBalancer service

## Connecting to the Database

The application connects to the Cloud SQL PostgreSQL instance using the Cloud SQL Auth Proxy, which is deployed as a sidecar container. The proxy handles authentication and encryption for the database connection.
