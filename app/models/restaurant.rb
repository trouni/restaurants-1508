class Restaurant < ApplicationRecord
  # associations
  # yoshio.destroy => this would destroy all of the reviews for yoshio
  has_many :reviews, dependent: :destroy # restaurant.reviews
  # validations
  CATEGORIES = %W[burger ramen sushi desserts healthy kebabs pizza tacos sandwiches dumplings soup curry rice pasta steakhouse vegan bakery juice salads seafood brunch wings cafe bbq deli pies buffet pub brasserie shakes creamery grill]
  validates :name, presence: true
end

# Restaurant::CATEGORIES
