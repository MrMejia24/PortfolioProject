# User Management

### 1. Create an Amazon DynamoDB Table. 
        a. Open AWS DynamoDB and Create a table
        b. Table Name: Rides; Partition key: RideID; Key Type: String. Use the default settings and Create
        c. Copy and Save the ARN (Locate it on the under Overview Tab, under Additional info)
        
![Step 1](https://user-images.githubusercontent.com/101837302/207966970-3ab26d7d-a94d-4a13-9093-ba0357b796d7.PNG)

### 2. Create a IAM Role for your Lambda function.
        a. Open IAM Console
        b. Create a Role; Select Lambda and click next.
        c. From the permission policies, search and select AWSLambdaBasicExecutionRole
        d. Enter WildRydesLambda for the Role Name, and create role
        e. Search and select the created role; on the permission tab, on the add permissions, choose Create Inline Policy       
                - Choose a service - DynamoDB
                - Select Action - PutItem
                - Resources - Add ARN from Step 1c
                - Review; Enter DynamoDBWriteAccess and Create policy 

![Step 2](https://user-images.githubusercontent.com/101837302/207988963-f8aef0b0-c442-4a88-864f-9abc1497e88b.PNG)

![Step 3](https://user-images.githubusercontent.com/101837302/207988966-4f1abf38-831c-4e0f-9e61-666c831f7b8b.PNG)

![Step 4](https://user-images.githubusercontent.com/101837302/207988967-99b11673-9007-46e3-834e-644c76b2b608.PNG)

![Step 5](https://user-images.githubusercontent.com/101837302/207988968-19fe6536-eb81-4e8c-b0d7-fea153740b84.PNG)

![Step 6](https://user-images.githubusercontent.com/101837302/207988970-94ee5560-64cb-4ced-aff3-44f609bafdd1.PNG)

![Step 7](https://user-images.githubusercontent.com/101837302/207988973-e4cc8363-3036-4b13-9571-72fdc1c4351b.PNG)

![Step 8](https://user-images.githubusercontent.com/101837302/207988975-f7b61ec5-b2ba-4282-8de7-a76d5ddb199d.PNG)
        
### 3. Create a Lambda function for handling request
        a. Open LAmbda Console 
        b. Create function
                - Author from scratch
                - Name field: RequestUnicorn
                - Runtime: Node.js 16.x
                - Choose existing role
                - Create function
        c. On the function code, replace the existing code index.js with requestUnicorn.js

![Step 9](https://user-images.githubusercontent.com/101837302/207990157-f1c21f7f-f2d3-4638-9c77-e3e1494fef0b.PNG)  

![Step 10](https://user-images.githubusercontent.com/101837302/207990155-77c9d4c4-507b-4eef-8911-d11452feb241.PNG)    

### 4. Recap

In this module, you used AWS Lambda and Amazon DynamoDB to build a backend process for handling requests for your web application. The browser application that you deployed in the first module allows users to request that a unicorn be sent to a location of their choice. To fulfill those requests, the JavaScript running in the browser will need to invoke a service running in the cloud.