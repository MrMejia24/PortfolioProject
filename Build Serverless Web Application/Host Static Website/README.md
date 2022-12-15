# Host a Static Website

### 1. Create a repository using AWS CodeCommit. Set repository to "wildryes-site". 
        a. Open AWS CodeCommit
        b. Creste Repository
        c. Set Reposiroty name to "wildrydes-site"
        d. Select Create
  
### 2. Create Git credentials for HTTPS connections to CodeCommit.
        a. In the IAM Console, Choose Users and pick the the IAM userthat you are going to utilize
        b. Goto the Security Credential tab, and in HTTPS Git credentials for AWS Commit , choose Generate
        c. Copy and save the username and password that IAM generated for you.
        
### 3. Creating a local repository
        a. From terminal window run git clone and the HTTPS URL of the repository:
        "git clone https://git-codecommit.us-east1.amazonaws.com/v1/repos/wildrydes-site"
        b. Use the username and password fro Step 2c
        
### 4. Populate Git repository
        a. Change directory into your repository and copy the static files from GitHub repository:
        - cd wildrydes-site
        - git clone https://github.com/vitd39jc/wildrydes-site.git
        b. Commit the files to your Git Service
        - git add .
        - git commit -m 'new'
        - git push
        
### 5. Enable Web Hosting with AWS Amplify Console
        a. Open Amplify Console, click  Get Started
        b. Click on Get Started under "Host your web app"
        c. Select CodeCommit
        d. Select your Repository "wildrydes-site" and select Next
        e. On the Configuration Building Settings leave all the defaults and acknowledge "Allow AWS Amplify to 
        automatically deploy all files hosted in your project root directory
        f. On "review" select Save and Deploy
        g. The process takes a couple of minutes for AMplify Console to create the necessary resources and to deploy your code
        h. Once complete, click on the site image to launch your Wild Rydes site
        
### 6. Recap
        In this module, you've created static website which will be the base for our Wild Rydes business. AWS Amplify Console makes
        it really easy to deploy static websites following a continuous integration and delivery model. It has capabilities for 
        "building" more complicated Javascript framework based applications and has features such as feature branch deployments, easy 
        custom domain setup, instant deployments, and password protection.

Link to this module: https://aws.amazon.com/getting-started/hands-on/build-serverless-web-app-lambda-apigateway-s3-dynamodb-cognito/module-1/?refid=ps_a131l0000085ejvqam&trkcampaign=acq_paid_search_brand
