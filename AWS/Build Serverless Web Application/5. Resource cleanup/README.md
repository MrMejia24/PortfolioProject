# User Management

### 1. Delete your app
        a. Open Amplify
        b. Choose action and Delete app    
   
### 2. Delete Amazon Cognito User Pool.
        a. Open Cognito
        b. Choose Managed User Pool, select WildRydes, and Delete Pool

### 3. Delete serverless backend
        a. Delete Lambda function
                - Select RequestUnicorn function; from the action dropdown, choose delete
        b. Delete IAM role
                - Select Roles and search WildRydesLambda
                - Select the Role and choose Delete
        c. Delete DynamoDB Table
                - Choose Tables, choose Rides and choose Delete; check "Delete all CloudWatch alarms" 

### 4. Delete REST API
        a. Select API, and on the action dropdown choose Delete
                - Deployment Stage: [New Stage]
                - Stage Name: prod
                - Deploy
                - Copy and save Invoke URL

### 5. Delete CloudWatch Logs
        a. Open CloudWatch
                - Choose Logs and search for RequestUnicorn
                - From action dropdown, choose Delete log group and Delete
