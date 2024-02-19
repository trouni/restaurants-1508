class Review < ApplicationRecord
  belongs_to :restaurant # review.restaurant
  validates :content, presence: true, length: { minimum: 10 }
end
