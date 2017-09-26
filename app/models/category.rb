class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories

  validates :title, presence: true, uniqueness: true
end
