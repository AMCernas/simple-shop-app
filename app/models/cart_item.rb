class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  before_validation :set_default_quantity, on: :create

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1 }

  def total_price
    (product.price || 0) * (quantity || 0)
  end

  private

  def set_default_quantity
    self.quantity ||= 1
  end
end
