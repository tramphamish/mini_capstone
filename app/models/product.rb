class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :carted_products
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :orders, through: :carted_products

  validates :name, uniqueness: true
  validates :name, :price, :description, presence: true
  validates :price, numericality: true
  validates :description, length: { maximum: 500 }

  def sale_message
    if price < 30
      "Discount Item!"
    else 
      "Everyday Value!"
    end
  end

  def sales_tax
    price * 0.09
  end

  def total
    price + sales_tax
  end
end
