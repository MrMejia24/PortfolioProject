# Host a Static Website

### 1. Create a repository using AWS CodeCommit. Set repository to "wildryes-site". 
        a. Open AWS CodeCommit
        b. Create Repository
        c. Set Reposiroty name to "wildrydes-site"
        d. Select Create

![Step 1](https://user-images.githubusercontent.com/101837302/207904875-159323a8-8f3b-4f1f-a241-61573c9b70aa.PNG)

![Step 2](https://user-images.githubusercontent.com/101837302/207904976-b0743f79-d77c-49c4-80eb-c4ac6880318c.PNG)
  
### 2. Create Git credentials for HTTPS connections to CodeCommit.
        a. In the IAM Console, Choose Users and pick the the IAM userthat you are going to utilize
        b. Goto the Security Credential tab, and in HTTPS Git credentials for AWS Commit , choose Generate
        c. Copy and save the username and password that IAM generated for you.

![Step 3](https://user-images.githubusercontent.com/101837302/207905159-9d7d77c3-73b3-4064-ae9e-a3f89e1c304d.PNG)

![Step 4](https://user-images.githubusercontent.com/101837302/207905160-b9d07528-df5a-4553-8f3a-85fa4c53d4d4.PNG)  
        
### 3. Creating a local repository
        a. From terminal window run git clone and the HTTPS URL of the repository:
        "git clone https://git-codecommit.us-east1.amazonaws.com/v1/repos/wildrydes-site"
        b. Use the username and password fro Step 2c

![Step 5](https://user-images.githubusercontent.com/101837302/207901682-8be562db-7a08-4c19-ab9f-14a042638312.PNG)   

### 4. Populate Git repository
        a. Change directory into your repository and copy the static files from GitHub repository:
        - cd wildrydes-site
        - git clone https://github.com/vitd39jc/wildrydes-site.git
        - copy the items from the Github repository with the exception of the .git folder to your local repository created on Step 3a
        b. Commit the files to your Git Service
        - git add .
        - git commit -m 'new'
        - git push

![Step 6](https://user-images.githubusercontent.com/101837302/207901887-246753bd-d21a-4c12-b6fa-4e54db984e14.PNG)

![Step 7](https://user-images.githubusercontent.com/101837302/207902454-09016cef-a0ef-4729-89e7-d21f82aec1eb.PNG)
        
### 5. Enable Web Hosting with AWS Amplify Console
        a. Open Amplify Console, click  Get Started
        b. Click on Get Started under "Host your web app"
        c. Select CodeCommit
        d. Select your Repository "wildrydes-site" and select Next
        e. On the Configuration Building Settings leave all the defaults and acknowledge "Allow AWS Amplify to 
        automatically deploy all files hosted in your project root directory"
        f. On "review" select Save and Deploy
        g. The process takes a couple of minutes for AMplify Console to create the necessary resources and to deploy your code
        h. Once complete, click on the site image to launch your Wild Rydes site

![Step 8](https://user-images.githubusercontent.com/101837302/207902678-7b76f691-1dd0-43c1-9793-ed8508510907.PNG)

![Step 9](https://user-images.githubusercontent.com/101837302/207902764-aa85e6fe-d541-4e02-ba98-04abfaa29ecc.PNG)

![Step 10](https://user-images.githubusercontent.com/101837302/207902856-3c9f4cdc-1455-4a3a-a8f6-137472baecea.PNG)

![Step 11](https://user-images.githubusercontent.com/101837302/207903118-30a156cf-7a7d-4ddc-aa31-7572ba8804dd.PNG)

![Step 12](https://user-images.githubusercontent.com/101837302/207903147-11a1f721-760b-4e59-a180-89a05127915e.PNG)
        
### 6. Recap
        In this module, you've created static website which will be the base for our Wild Rydes business. AWS Amplify Console makes
        it really easy to deploy static websites following a continuous integration and delivery model. It has capabilities for 
        "building" more complicated Javascript framework based applications and has features such as feature branch deployments, easy 
        custom domain setup, instant deployments, and password protection.

Link to this module: https://aws.amazon.com/getting-started/hands-on/build-serverless-web-app-lambda-apigateway-s3-dynamodb-cognito/module-1/?refid=ps_a131l0000085ejvqam&trkcampaign=acq_paid_search_brand
