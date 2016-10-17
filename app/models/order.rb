class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  belongs_to :user

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  # Method to calculate cart total price
  def total_price
    line_items.to_a.sum { |item| item.total_price}
  end

  # Method to put line_items of an order into array then find unique value and return for find orders related to a seller (order index view)
  def sellers
    line_items.map { |lineitem| lineitem.item.user.id }.uniq
  end

end
