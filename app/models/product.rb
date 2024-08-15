class Product < ApplicationRecord
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    has_one_attached :image
end
