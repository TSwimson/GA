require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'

def dbname
  "storeadminsite"
end

def with_db
  c = PGconn.new(:host => "localhost", :dbname => dbname)
  yield c
  c.close
end

get '/' do
  erb :index
end

post '/addrel/:pid' do
  c = PGconn.new(host: "localhost", dbname: dbname)
  c.exec_params("INSERT INTO category_and_product (category_id, product_id) VALUES($1, $2);", [params[:category], params[:pid]])
  c.close
  redirect "/products/#{params[:pid]}"
end

#remove product_category relation
post '/removecat/:id' do 
  c = PGconn.new(host: "localhost", dbname: dbname)
  c.exec_params("DELETE FROM category_and_product WHERE id = $1", [params[:id]])
  c.close

  redirect '/products'

end

#list cats
get '/categories' do
    c = PGconn.new(:host => "localhost", :dbname => dbname)
    @categories = c.exec("SELECT * FROM category;")
    c.close
    erb :categories
end

#page to create a category
get '/categories/new' do
  erb :new_category
end

#display a category in detail
get '/categories/:id' do 
  c = PGconn.new(:host => "localhost", :dbname => dbname)

  # todo get category and products in it
  @category = c.exec_params("SELECT p.name AS product_name, p.id as p_id, c.name AS category_name, c.id AS category_id FROM products AS p LEFT OUTER JOIN category_and_product AS cp ON cp.product_id = p.id FULL OUTER JOIN category AS c ON c.id = cp.category_id WHERE c.id = $1;", [params["id"]])
  erb :category
end

#create category and redirect to newly created categories page
post '/categories' do
  c = PGconn.new(:host => "localhost", :dbname => dbname)

  # Insert the new row into the products table.
  c.exec_params("INSERT INTO category (name) VALUES ($1)", [params["name"]])

  new_cat_id = c.exec_params("SELECT currval('category_id_seq');").first["currval"]
  c.close
  redirect "/categories/#{new_cat_id}"

end

#delete a category and redirect to list of cats at /categories
post '/categories/:id/destroy' do
  c = PGconn.new(host: "localhost", dbname: dbname)
  c.exec_params("DELETE FROM category WHERE id = $1", [params[:id]])
  c.exec_params("DELETE FROM category_and_product WHERE category_id = $1", [params[:id]])
  c.close
  redirect '/categories'
end


# The Products machinery:

# Get the index of products
get '/products' do
  c = PGconn.new(:host => "localhost", :dbname => dbname)

  # Get all rows from the products table.
  @products = c.exec_params("SELECT * FROM products;")
  c.close
  erb :products
end

# Get the form for creating a new product
get '/products/new' do
  erb :new_product
end

# POST to create a new product
post '/products' do
  c = PGconn.new(:host => "localhost", :dbname => dbname)

  # Insert the new row into the products table.
  c.exec_params("INSERT INTO products (name, price, description) VALUES ($1,$2,$3)",
                  [params["name"], params["price"], params["description"]])

  # Assuming you created your products table with "id SERIAL PRIMARY KEY",
  # This will get the id of the product you just created.
  new_product_id = c.exec_params("SELECT currval('products_id_seq');").first["currval"]
  c.close
  redirect "/products/#{new_product_id}"
end

# Update a product
post '/products/:id' do
  c = PGconn.new(:host => "localhost", :dbname => dbname)

  # Update the product.
  c.exec_params("UPDATE products SET (name, price, description) = ($2, $3, $4) WHERE products.id = $1 ",
                [params["id"], params["name"], params["price"], params["description"]])
  c.close
  redirect "/products/#{params["id"]}"
end

get '/products/:id/edit' do
  c = PGconn.new(:host => "localhost", :dbname => dbname)
  @product = c.exec_params("SELECT * FROM products WHERE products.id = $1", [params["id"]]).first
  @categories = c.exec_params("SELECT * FROM category")
  c.close
  erb :edit_product
end
# DELETE to delete a product
post '/products/:id/destroy' do

  c = PGconn.new(:host => "localhost", :dbname => dbname)
  c.exec_params("DELETE FROM products WHERE products.id = $1", [params["id"]])
  c.exec_params("DELETE FROM category_and_product WHERE products_id = $1", [params["id"]])
  c.close
  redirect '/products'
end

# GET the show page for a particular product
get '/products/:id' do
  c = PGconn.new(:host => "localhost", :dbname => dbname)
  @product = c.exec_params("SELECT p.name AS p_name, p.description AS p_des, p.id AS p_id, p.price AS p_price, c.name AS c_name, c.id AS c_id, cp.id as ref_id FROM products AS p LEFT OUTER JOIN category_and_product AS cp ON cp.product_id = p.id FULL OUTER JOIN category AS c ON c.id = cp.category_id WHERE p.id = $1;", [params["id"]])
  c.close
  erb :product
end

def create_products_table
  c = PGconn.new(:host => "localhost", :dbname => dbname)
  c.exec %q{
  CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name varchar(255),
    price decimal,
    description text
  );
  }
  c.close
end

def drop_products_table
  c = PGconn.new(:host => "localhost", :dbname => dbname)
  c.exec "DROP TABLE products;"
  c.close
end

def seed_products_table
  products = [["Laser", "325", "Good for lasering."],
              ["Shoe", "23.4", "Just the left one."],
              ["Wicker Monkey", "78.99", "It has a little wicker monkey baby."],
              ["Whiteboard", "125", "Can be written on."],
              ["Chalkboard", "100", "Can be written on.  Smells like education."],
              ["Podium", "70", "All the pieces swivel separately."],
              ["Bike", "150", "Good for biking from place to place."],
              ["Kettle", "39.99", "Good for boiling."],
              ["Toaster", "20.00", "Toasts your enemies!"],
             ]

  c = PGconn.new(:host => "localhost", :dbname => dbname)
  products.each do |p|
    c.exec_params("INSERT INTO products (name, price, description) VALUES ($1, $2, $3);", p)
  end
  c.close
end