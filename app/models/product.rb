class Product < ApplicationRecord
  belongs_to :categories
  validates :title, :price, :stock_quantity, presence: true
end
