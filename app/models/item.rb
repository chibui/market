class Item < ApplicationRecord
  validates :name, :description, :origin, :min_order, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  belongs_to :user

   # returns most recently updated product. Used for caching
  def self.latest
  Item.order(:updated_at).last
  end

end
