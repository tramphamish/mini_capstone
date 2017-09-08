class Product < ApplicationRecord

  def sale_message
    if price < 2
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
