#!/bin/bash
# Setup script to set proper permissions for all script files in the project

echo "Setting executable permissions for all shell scripts..."

# Find all .sh files in the directory and make them executable
find "$(dirname "$0")" -type f -name "*.sh" -exec chmod +x {} \;

echo "Setting executable permissions for SQL script files..."

# Find all .sql files and give them read permissions
find "$(dirname "$0")" -type f -name "*.sql" -exec chmod +r {} \;

echo "Setting executable permissions for scripts in the securing_cloud_sql_instance directory..."

# Make sure scripts in pgaudit_scripts and iam_auth_scripts directories are executable
chmod +x "$(dirname "$0")/03_securing_cloud_sql_instance/pgaudit_scripts"/*.sh 2>/dev/null || true
chmod +x "$(dirname "$0")/03_securing_cloud_sql_instance/iam_auth_scripts"/*.sh 2>/dev/null || true

echo "Setting executable permissions for scripts in the replication_and_recovery directory..."

# Make sure scripts in task1, task2, and task3 directories are executable
chmod +x "$(dirname "$0")/04_replication_and_recovery/task1"/*.sh 2>/dev/null || true
chmod +x "$(dirname "$0")/04_replication_and_recovery/task2"/*.sh 2>/dev/null || true
chmod +x "$(dirname "$0")/04_replication_and_recovery/complete_lab_script.sh" 2>/dev/null || true

echo "All permissions set successfully!"
echo "You can now run any of the shell scripts in the project."
