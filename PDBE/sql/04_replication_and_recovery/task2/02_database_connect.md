# Connect to the Cloud SQL PostgreSQL Database

Follow these steps to connect to the Cloud SQL instance and make changes:

1. In the Google Cloud Console, navigate to **Databases > SQL** and click on the Cloud SQL instance named **postgres-orders**.

2. In the **Connect to this instance** section, click **Open Cloud Shell**. 

3. Run the auto-populated command and enter the password `supersecret!` when prompted.

4. Once connected to psql, change to the orders database with:
   ```
   \c orders
   ```

5. When prompted, enter the password `supersecret!` again.

6. Execute the SQL queries in the `03_check_before_change.sql` file to check the current state of the database.
