# Crud Products - Web Application

## Introduction
This is a web application developed with Ruby on Rails that allows you to manage products efficiently. You can view, add, update, and delete products.

## Used Technology
- **Ruby 3.2.3**
- **Rails 7.1.3**
- **Postgresql**

## Previous requirements
Before you begin, make sure you have the following installed on your system:
- Ruby 3.2.3
- Rails 7.1.3
- PostgreSQL

## Project Settings
1. Clone this repository to your local machine using the following command:
     ```
     https://github.com/Alonso2105/Crud_Products.git
     ```

2. Access the project directory:
     ```
     cd crud_products
     ```

3. Install the necessary gems using Bundler:
     ```
     bundle install
     ```

4. Create the database and run the migrations:
     ```
     rails db:create
     rails db:migrate
     ```

5. Optional: If you want to add some example data, you can run the following Rake task:
     ```
     rake import:products
     ```

## Project execution
Once you have configured the project correctly, you can start the Rails server with the following command:

```
rails server
```
This will start the server on your local machine and you can access the application from your web browser by visiting the address `http://localhost:3000`.

## Use of the Application
1. **Product List**: On the main page of the application, you will see a list of all products in the database. You can view details of each product and navigate through the list using pagination.
   
2. **Add a New Product**: To add a new product, click on the "New Product" button. Fill out the form with the product details including name, price, SKU, whether it is seasonal, image, quantity, and category. Once the form is submitted, the new product will be added to the list.

4. **Edit a Product**: To update an existing product, click on the "Edit" button next to the product you want to modify. Make the necessary changes in the form and submit to update the product details.

5. **Delete a Product**: To remove a product from the list, "click on the 'Delete' button" and the product will be removed from the database.

6.  **View Product Details**: Click on the "Show" or "View" button next to a product to see detailed information, including name, price, SKU, seasonal status, image, quantity, and category.

And that's it! Now you are ready to start using the Crud Products application.
