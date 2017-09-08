class ProductsController < ApplicationController
  def index
    @products = Product.all 
    render "index.html.erb"
  end
  def new
    render "new.html.erb"
  end
  def create
    @new_product = Product.new(
      name: params[:name], 
      price: params[:price], 
      description: params[:description], 
      image: params[:image]
      )
    @new_product.save
    flash[:success] = "New product has been successfully added."
    redirect_to "/products/#{new_product.id}"
  end
  def show
    @product = Product.find_by(id: params[:id])
    render "show.html.erb"
  end
  def edit
    @product = Product.find_by(id: params[:id])
    render "edit.html.erb"
  end
  def update
    product = Product.find_by(id: params[:id])
    product.update(
      name: params[:name], 
      price: params[:price], 
      description: params[:description], 
      image: params[:image]
      )
    flash[:success] = "Product has been successfully updated."
    redirect_to "/products/#{@products.id}"
  end
  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:success] = "Product has been successfully deleted."
    redirect_to "/products"
  end
end
