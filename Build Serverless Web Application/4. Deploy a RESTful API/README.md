# User Management

### 1. Create a New REST API. 
        a. Open API Gateway and Create API
        b. Select Build under REST API (No private) 
                - API Name: WildRydes
                - Endpoint Type: Edge optimized
                - Create API
       
![Step 1](https://user-images.githubusercontent.com/101837302/208018898-c3bd33d8-b35f-4099-9b8e-4313c4e4b752.PNG)

![Step 2](https://user-images.githubusercontent.com/101837302/208018899-ed887d92-c734-4e5e-acd6-3fd1314bc191.PNG)       

### 2. Create a Cognito User Pool Authorizer.
        a. Under the newly created API, choose Authorizers and Create New Authorizers
                - Authorize Name: WildRydes
                - Type: Cognito
                - Cognito User Pool: WildRydes
                - Token Source: Authorization
                - Create

![Step 3](https://user-images.githubusercontent.com/101837302/208018900-2609df96-17da-438b-9585-e5e9bfc312dc.PNG)

### 3. Create a new resource and method
        a. Click on Resources, on the Action dropdown select Create Resources
                - Resource Name: /ride
                - Resource Path: ride
                - Enable API Gateway CORS
                - Create Resource
        b. On the newly created /ride resource, on the Action dropdown select Create Method
                - Select Post and click checkmark
                - Integration type: Lambda function
                - Check box: Use Lambda Proxy integration
                - Lambda region: us-east-1
                - Lambda function: RequestUnicorn
                - Choose save and ok
        c. On Method Request
                - Choose pencil icon and select WildRydes 

![Step 4](https://user-images.githubusercontent.com/101837302/208020742-438cd2d3-0d4f-4163-ad05-6a2e26902fba.PNG)

![Step 5](https://user-images.githubusercontent.com/101837302/208020743-a709fdea-2d50-4d7b-8457-cdf1ee9ffe1e.PNG) 

![Step 6](https://user-images.githubusercontent.com/101837302/208020739-6bf9f1de-e40b-4fdd-94ee-98fdcf7a266a.PNG)       

### 4. Deploy API
        a. Action dropdown, select Deploy
                - Deployment Stage: [New Stage]
                - Stage Name: prod
                - Deploy
                - Copy and save Invoke URL

![Step 7](https://user-images.githubusercontent.com/101837302/208021295-59892a6d-29c6-46b7-a681-1ac3623e43bd.PNG)

![Step 8](https://user-images.githubusercontent.com/101837302/208021298-b7aaf267-9895-4f26-8845-e89f05402792.PNG)

### 5. Update the Website Config
        a. Open the config.js file in a text editor
                - Add the Invoke URL
        b. Save the modified file and push it to the Git repository
                - git add .
                - git commit -m "new_configuration"
                - git push

### 6. Recap

In this module, you used Amazon API Gateway to expose the Lambda function you built in the previous module as a RESTful API. This API will be accessible on the public Internet. It will be secured using the Amazon Cognito user pool you created in the previous module. Using this configuration, you will then turn your statically hosted website into a dynamic web application by adding client-side JavaScript that makes AJAX calls to the exposed APIs.