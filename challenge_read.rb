require_relative 'ar'
require_relative 'models/product'
require_relative 'models/category'

# Output all columns of the product table
product = Product.first
puts product.inspect

number_of_products = Product.count
puts "There are #{number_of_products} in the products table."

# Names of all products above $10 with names that begin with the letter C
products_above_10_with_c = Product.where("price > ? AND name LIKE ?", 10, 'C%').pluck(:name)
puts "Products above $10 starting with C: #{products_above_10_with_c}"

# Total number of products with a low stock quantity (less than 5)
low_stock_products = Product.where("stock_quantity < ?", 5).count
puts "Total number of low stock products: #{low_stock_products}"

# Find the name of the category associated with one of the products
category_name = product.category.name
puts "Category name: #{category_name}"

# Find a specific category by an existing name
existing_category_name = 'Beverages' # Replace with a valid category name from your database

category = Category.find_by(name: existing_category_name)
if category
  # Use the category to build and persist a new product
  new_product = category.products.create(name: 'New Product', description: 'Description', price: 15.99, stock_quantity: 10)
  puts new_product.inspect

  # Find all products in this category over a certain price
  products_over_price = category.products.where("price > ?", 20).pluck(:name)
  puts "Products over $20 in the category: #{products_over_price}"
else
  puts "Category '#{existing_category_name}' not found."
end
