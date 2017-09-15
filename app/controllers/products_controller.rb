class ProductsController < ApplicationController
  def index
    @products = Product.all 
    if params[:sort] && params[:sort_order]
      @products = Product.all.order(params[:sort]=> params[:sort_order])
    end
    if params[:discount]
      @products = Product.where("price <= ?", 30)
    end
    render "index.html.erb"
  end
  def new
    render :new
  end
  def create
    supplier_id = params[:supplier]["supplier_id"]
    @product = Product.new(
      name: params[:name], 
      price: params[:price], 
      description: params[:description],
      supplier_id: supplier_id
      )
    @product.save
    flash[:success] = "New product has been successfully added."
    redirect_to "/products/#{@product.id}"
  end
  def show
    if params[:id] == "random"
      products = Product.all
      @product = products.sample
    else
      @product = Product.find_by(id: params[:id])
    end
      render :show
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
      description: params[:description]
      )
    flash[:success] = "Product has been successfully updated."
    redirect_to "/products/#{@product.id}"
  end
  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:success] = "Product has been successfully deleted."
    redirect_to "/products"
  end
  def search
    search_term = params[:search]
    @products = Product.where("name LIKE ?", "%#{search_term}%")
    render "index.html.erb"
  end
end