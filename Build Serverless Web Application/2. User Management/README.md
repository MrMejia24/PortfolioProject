# User Management

### 1. Create an Amazon Cognito User Pool. 
        a. Open AWS Cognito
        b. Manage your User Pool, Create User Pool, Review Defaults, and Create Pool
        c. Save the Pool ID
        
![Step 1](https://user-images.githubusercontent.com/101837302/207908110-4495c267-4ace-4d5e-b7b5-7cde54194ba9.PNG)

![Step 2](https://user-images.githubusercontent.com/101837302/207908198-1e2766f9-5d87-4aad-8208-bf61441607e1.PNG)

![Step 3](https://user-images.githubusercontent.com/101837302/207908200-fb28c635-0f0f-40f0-8fae-8259c7e81ce5.PNG)

![Step 4](https://user-images.githubusercontent.com/101837302/207908201-11e34e6d-2820-4f7b-b2a7-8405ef9340b5.PNG)

### 2. Add an App to your User Pool.
        a. From the General Settings section, select App Clients, and then Add an app client
        b. Name the client WildRydesWebApp, Uncheck the Generate client secret option, and Create app client 
        c. Copy and save the App client ID

![Step 5](https://user-images.githubusercontent.com/101837302/207910823-ce6bf7ad-9c0b-4651-aab2-c1653f905427.PNG)
        
### 3. Update the Website Config
        a. Open the /js/config.js file with your favorite text editor and update the cognito section with your userPoolID and the userPoolClientID from step 2c
        b. Use the username and password fro Step 2c
        c. Save the modified file and push it to your Git repository
                - git add .
                - git commit -m "new_config"
                - git push

![Step 6](https://user-images.githubusercontent.com/101837302/207943601-105d22e2-1c96-4654-93ca-35046f8b80cc.PNG)

### 4. Validate your implementation
        a. Visit /register.html or select Giddy Up! Button on the homepage of your site
        b. Complete registration form and choose Let's Ryde
                - if you use a known email address, enter the verificaton code that is emailed to you
                - if you use a dummy email, you can confirm the account thru the Cognito console

![Step 7](https://user-images.githubusercontent.com/101837302/207944974-6a3d74b3-5240-4c5c-8a4e-6ac34b5b7ebc.PNG)

### 5. Recap 

        In this module, you created an Amazon Cognito user pool to manage your users' accounts and you deployed pages that enable customers to register as new user, verify their email address, and sign into the site.