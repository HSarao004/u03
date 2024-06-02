# In a loop user Faker to generate 10 new categories.
# Within this same loop use the newly created and saved category objects to generate 10 new products
#  for each category. The name, description, price and quantity of these 10 products should also be
#   generated using faker.
#   # challenge_faker.rb
require_relative 'ar'
require_relative 'models/category'
require_relative 'models/product'

# Generate 10 new categories and 10 products for each category using Faker
10.times do
  category = Category.create(name: Faker::Commerce.department)
  10.times do
    category.products.create(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence,
      price: Faker::Commerce.price,
      stock_quantity: rand(1..100)
    )
  end
end
