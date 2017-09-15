class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders

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
