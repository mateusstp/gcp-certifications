# Connect to the Cloned PostgreSQL Database

Follow these steps to connect to the cloned Cloud SQL instance and verify the restoration:

1. In the Google Cloud Console, navigate to **Databases > SQL**.

2. Click on the **All Instances** breadcrumb and then click on the Cloud SQL instance named **postgres-orders-pitr**.
   
   Note: You will need to wait for the cloned instance to come online. This could take 10 minutes or more.

3. Once the instance is ready, in the **Connect to this instance** section, click **Open Cloud Shell**. 

4. Run the auto-populated command and enter the password `supersecret!` when prompted.

5. Once connected to psql, change to the orders database with:
   ```
   \c orders
   ```

6. When prompted, enter the password `supersecret!` again.

7. Execute the SQL queries in the `02_verify_restoration.sql` file to check if the restoration was successful.
