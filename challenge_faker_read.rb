# challenge_faker_read.rb
require_relative 'ar'
require_relative 'models/category'
require_relative 'models/product'

# Find all the categories in the database (including those that you added using Faker).
# Display all category names and their associated products (name and price) in a nicely formatted list.
categories = Category.includes(:products).all
categories.each do |category|
  puts "Category: #{category.name}"
  category.products.each do |product|
    puts "  Product: #{product.name}, Price: #{product.price}"
  end
end
