class Item < ApplicationRecord
  validates :name, :description, :origin, :min_order, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}

  belongs_to :user

  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

   # returns most recently updated product. Used for caching
  def self.latest
  Item.order(:updated_at).last
  end

  private
    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      unless line_items.empty?
        errors.add(:base, 'Line Items present')
        throw :abort
      end
    end

end
