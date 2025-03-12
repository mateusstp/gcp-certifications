#!/bin/bash
# Script for Task 3: Configuring Cloud SQL IAM database authentication

export CLOUDSQL_INSTANCE=postgres-orders

# Create directory for scripts if it doesn't exist
IAM_SCRIPTS_DIR="$(dirname "$0")/iam_auth_scripts"
if [ ! -d "$IAM_SCRIPTS_DIR" ]; then
  echo "Creating directory for IAM authentication scripts..."
  mkdir -p "$IAM_SCRIPTS_DIR"
fi

echo "==================================================================="
echo "         Cloud SQL IAM Database Authentication Configuration       "
echo "==================================================================="

echo "\nStep 1: Testing database access before IAM authentication\n"
chmod +x "$IAM_SCRIPTS_DIR/01_test_before_iam.sh"
bash "$IAM_SCRIPTS_DIR/01_test_before_iam.sh"

echo "\nStep 2: Create a Cloud SQL IAM user\n"
echo "Please follow the instructions in: $IAM_SCRIPTS_DIR/02_create_iam_user_instructions.md"
echo "Or execute: cat $IAM_SCRIPTS_DIR/02_create_iam_user_instructions.md"

echo "\nStep 3: Grant database privileges to the IAM user\n"
echo "Connect to the database and execute the SQL commands in: $IAM_SCRIPTS_DIR/03_grant_privileges.sql"
echo "Or run: gcloud sql connect postgres-orders --user=postgres"
echo "Then execute the commands in: $IAM_SCRIPTS_DIR/03_grant_privileges.sql"

echo "\nStep 4: Test database access after IAM authentication\n"
echo "After completing steps 2 and 3, run the test script:"
chmod +x "$IAM_SCRIPTS_DIR/04_test_after_iam.sh"
echo "Execute: bash $IAM_SCRIPTS_DIR/04_test_after_iam.sh"

echo "\nStep 5: Test database permissions\n"
echo "When connected to the database, run the queries in: $IAM_SCRIPTS_DIR/05_test_queries.sql"
echo "Or execute: cat $IAM_SCRIPTS_DIR/05_test_queries.sql"

echo "\n==================================================================="
echo "                   Task Completion Checklist                     "
echo "==================================================================="
echo "✓ Test database access before IAM authentication (should fail)"
echo "✓ Create a Cloud SQL IAM user in the Cloud Console"
echo "✓ Grant database privileges to your IAM user"
echo "✓ Test database access after IAM authentication (should succeed)"
echo "✓ Verify appropriate access permissions for the IAM user"
