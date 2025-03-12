# Creating a Cloud SQL IAM User

Follow these steps to create a Cloud SQL IAM user in the Cloud Console:

1. Navigate to **Databases > SQL** and click on **postgres-orders**
2. Click **Users** to open the Users panel
3. Click **Add user account**
4. Select **Cloud IAM**
5. In the Principal box enter your lab username
6. Click **Add**

After the new user is added, you'll notice that Cloud SQL automatically adds the `cloudsql.iam_authentication` flag to the database flags list.
