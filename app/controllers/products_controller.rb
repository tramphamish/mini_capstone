class ProductsController < ApplicationController
  def @products_instock = Products.all 
    render "products_instock.html.erb"
  end
end
