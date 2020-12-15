class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates_presence_of :content
  validates_presence_of :rating
  validates_numericality_of :rating, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 5
end
