# challenge_update.rb
require_relative 'ar'
require_relative 'models/product'

# Found all products with a stock quantity greater than 40.
# Add one to the stock quantity of each of these products and then save these changes to the database.
products = Product.where("stock_quantity > ?", 40)
products.each do |product|
  product.update(stock_quantity: product.stock_quantity + 1)
end
