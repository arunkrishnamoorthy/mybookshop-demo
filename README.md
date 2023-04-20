# Bookshop Demo Application 

### 1. Created a Node JS package 

Create a folder named, mybookshop-demo.  Navigate to the folder, `cd mybookshop-demo`. 
Run the command `npm init` to initialize the node js package. 
Added files for .npmrc and license. 
Added .gitingore files to avoid commiting node_modueles to the git repository.


### 2. Create the Common reusable package  
Created a folder named common, and initialized it as a node package. 
Created a file named index.cds and extended the countries and context sap.common.Country with additional entities. 
In the Node JS, as the index.js file is determined as the entry point, in CAP index.cds is considered as the entry point. 


### 3. Create a model package for the products. 
The book is considered as product that is to be sold, and a package is created to represent the details about the book, who is its author and so on. 
In the application, created a new folder called products and the cap service is initialzed in this proudcts folder. 
Executed the command `cds add hana` to add HANA to the project. 

Created a service for the catalog users without authentications to view the details of the book. 
added a file for admin service to manage the products and users 
added a singleton entity to get the details of the logged in User. 

Create an index.cds file, in the /products folder and referenced all the services entities. 

//TODO fiori ui yet to be added. 

Changed the name of th epackage for products to `@aarini/products`. Then added the package for passport, @sap/xssec and @sap/xsenv to support authentications later on.

### 4. Create a package for reviewing the products 

Generate a service to update the review details about the products. 