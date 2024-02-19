# Fill the DB with some instances we can use
puts "Cleaning the DB..."
Restaurant.destroy_all

CHEFS = %w[Alex Dan Felix Glenn Go Hellen Hiroshi JD Justin Leo Koji Nick Nikita Nina Noah Ruby Sarah Yoshio]
CATEGORIES = %W[burger ramen sushi desserts healthy kebabs pizza tacos sandwiches dumplings soup curry rice pasta steakhouse vegan bakery juice salads seafood brunch wings cafe bbq deli pies buffet pub brasserie shakes creamery grill]

def get_category(name)
  last_word = name.split.last.downcase
  CATEGORIES.include?(last_word) ? last_word : CATEGORIES.sample
end


puts "Creating #{CHEFS.count} Restaurants..."
CHEFS.shuffle.each do |name|
  restaurant_name = Faker::Restaurant.unique.name
  restaurant = Restaurant.create!(
    name: "#{name}'s #{restaurant_name}",
    rating: rand(3..5),
    address: Faker::Address.street_address,
    category: get_category(restaurant_name),
    chef_name: name
  )

  rand(1..5).times do
    Review.create!(
      content: Faker::Restaurant.review,
      restaurant: restaurant
    )
  end
end
puts "... created #{Restaurant.count} restaurants and #{Review.count} reviews."
