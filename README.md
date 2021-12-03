# RedgeraldNyamadzavo_T2A2

**Identification of the problem you are trying to solve by building this particular marketplace app**

TimeCart is solving the issue with implusive buying. It  gives the user 2mins to hget on the site and checkout and they get half price discount if they nanage to do this. If not they have to pay then full price of the product. This will make user do their research of the product they want to purchase. 

**Why is it a problem that needs solving?**

Implusive buying is an issue thats causing  anxiety and unhappiness amoung millennial, and controlling it could help improve your psychological well-being.

**A link (URL) to your deployed app (i.e. website)**

https://timecart.herokuapp.com/

**A link to your GitHub repository (repo).**

https://github.com/reggie9594/RedgeraldNyamadzavo_T2A2

**Description of your marketplace app (website), including: 
Purpose :**
Purpose of the website is to provided a limited time when users are buying the product, this will make sure before they get on the site they have done enough research on the product, buy the time they get on the marketplace they know excaly what they are loooking for.

**Functionality / features**

authentication- used for user identification 
authorisation-- manages user access rights
Paypal-- to handle online payments 
Add Products--- allows seller to add products pictures, descrption and pricing to their store
Cart-- user add products to cart then check out for payments 
user signup-- for sellers who wants to create their own online store on the website 
admin dashboard display- analytics of how the store is performing

**Sitemap**


![timecartsitemap](https://user-images.githubusercontent.com/89363720/143584765-aeb82218-6a3c-46a7-bb6b-79ba417ab662.png)

**Target audience**

millennials, age between 21 and 36

**Tech stack**

bootstrap, html, css, rails, heroku, paypal checkout

**Screenshots**

**User Log In**
![image](https://user-images.githubusercontent.com/89363720/144559248-0e80bd47-7bad-4611-bc27-81f547a5bb26.png)

**Sales Page**


![image_2021_11_26T13_02_55_874Z](https://user-images.githubusercontent.com/89363720/143585518-5cd81449-fd58-4b4a-abfe-2e77eda9ced9.png)

**Admin dashboard**

![admindash](https://user-images.githubusercontent.com/89363720/143586212-53431a72-cc61-437b-ad8a-d0f833623950.png)

**Add New Products **

![newproduct1](https://user-images.githubusercontent.com/89363720/143586303-85f9b969-ec21-4d1e-a1cd-72f1e1988ead.png)
![newproduc2](https://user-images.githubusercontent.com/89363720/143586381-cee61a67-9a2d-4ef6-b209-719bb5b519ec.png)

**Adding new user**

![newuser](https://user-images.githubusercontent.com/89363720/143586469-19419dc6-ae2e-490a-879b-c751bf32f062.png)


**Cart**



![newuser](https://user-images.githubusercontent.com/89363720/143586614-4518fe6c-e917-4aab-841a-fa0b090aecc4.png)


**User stories for your app**

![userstory](https://user-images.githubusercontent.com/89363720/143588873-bff8bf3b-de14-4652-a11d-3b261c481cec.PNG)

**Wireframes for your app**

![tcartwireframes](https://user-images.githubusercontent.com/89363720/143589262-82962ff2-7aee-4500-b0b8-2e3f0a0995e0.png)

![user signup](https://user-images.githubusercontent.com/89363720/143593517-49cdaf90-61ff-4bd1-b416-376fba30a49d.PNG)

![seller1dash](https://user-images.githubusercontent.com/89363720/143593650-5c64ed38-34f3-4339-a9c0-6a975d01de23.PNG)


**An ERD for your app**

![timecarterd](https://user-images.githubusercontent.com/89363720/143590002-6a995cde-3939-4788-b7d2-de1cf4c57ba3.PNG)




**Explain the different high-level components (abstractions) in your app**

**Product Component** 

Fetch product from database and list then to the shop page
Fetch and edit one product using product_id

**Sale Component**

Implements cart functions that is it adds products to a session[:cart] and on checkout it then take the product in the session[:cart] and then creates a record in the sales table in database.

**User Component**

Adds user to database
Edit user profile


**Authentication Component** 
Authenticates users and manage user identity on the system
Renders Dashboard on successful login

**Discuss the database relations to be implemented in your application**

Product belongs_to User with foreign key user_id 
This will ensures that we have a record on who enters a new product into the database

Product_images belongs_to Product with foreign key product_id
Ensures that  for each image uploaded it is linked to product

Sale belongs_to Product with foreign key prodcut_id
Makes sure that each sale is related to a product

User belolongs_to Access_level with foreign key access_level_id
Ensures  that each user have an access_level thus making access level required

Actions belolongs_to  Action with foreign key access_level_id
Ensures  that each Action have an access_level thus making access level required

**Provide your database schema design**

![erd11](https://user-images.githubusercontent.com/89363720/143594032-7beb67fe-6b9b-4afc-bbe9-832275f0687b.PNG)




**Describe the way tasks are allocated and tracked in your project**

I used trello boards to track my progress on the app from desigining the wireframes, coding and deployement, I had timeframes of on each component 


![tracker1](https://user-images.githubusercontent.com/89363720/143594944-864d33b6-7772-4613-830e-37d22ed78d97.PNG)

![tracker3](https://user-images.githubusercontent.com/89363720/143595204-779360a4-179e-46a2-a977-77f7c61ceb6e.PNG)







