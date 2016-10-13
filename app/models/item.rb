class Item < ApplicationRecord
  validates :name, :description, :origin, :min_order, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  belongs_to :user
end
