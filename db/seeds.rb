# Fill the DB with some instances we can use
puts "Cleaning the DB..."
Restaurant.destroy_all

CATEGORIES = %W[burger ramen sushi desserts healthy kebabs pizza tacos sandwiches dumplings soup curry rice pasta steakhouse vegan bakery juice salads seafood brunch wings cafe bbq deli pies buffet pub brasserie shakes creamery grill]
puts "Creating restaurants..."

20.times do
  Restaurant.create!(
    name: Faker::Restaurant.unique.name,
    rating: rand(1..5),
    address: Faker::Address.street_address,
    category: CATEGORIES.sample
  )
end
puts "... created #{Restaurant.count} restaurants"
