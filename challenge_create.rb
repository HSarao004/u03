# challenge_create.rb
require_relative 'ar'
require_relative 'models/product'

# Method 1: Using new and save
product1 = Product.new(name: 'pencil', description: 'uses charcoal', price: 12.99, stock_quantity: 10)
product1.save

# Method 2: Using create
product2 = Product.create(name: 'pen', description: 'uses ink', price: 15.99, stock_quantity: 20)

# Method 3: Using new with a block
product3 = Product.new do |p|
  p.name = 'LED pencil'
  p.description = 'uses charcoal and ink'
  p.price = 20.99
  p.stock_quantity = 30
end
product3.save

# Create a product with missing required columns
invalid_product = Product.new(name: 'Invalid Product')
unless invalid_product.save
  puts invalid_product.errors.full_messages
end
