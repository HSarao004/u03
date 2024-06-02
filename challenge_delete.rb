# challenge_delete.rb
require_relative 'ar'
require_relative 'models/product'

product_to_delete = Product.find_by(name: 'pencil')
product_to_delete.destroy if product_to_delete
