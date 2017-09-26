class ProductsController < ApplicationController

before_action :authenticate_admin!, except: [:index, :show, :search]

  def index
    if session[:count] == nil
      session[:count] = 0
    end
    session[:count] += 1
    @visit_count = session[:count]
    @products = Product.all 
    if params[:sort] && params[:sort_order]
      @products = Product.all.order(params[:sort]=> params[:sort_order])
    end
    if params[:discount]
      @products = Product.where("price <= ?", 30)
    end
    if params[:category]
      selected_category = Category.find_by(title: params[:category])
      @products = selected_category.products 
    end
    render :index
  end
  
  def new
    @product = Product.new 
  end

  def create
    supplier_id = params[:supplier]["supplier_id"]
    @product = Product.new(
      name: params[:name], 
      price: params[:price], 
      description: params[:description],
      supplier_id: supplier_id
      )
    if @product.save
    flash[:success] = "New product has been successfully added."
    redirect_to "/products/#{@product.id}"
  else
    render :new
  end
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
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name]
    @product.description = params[:description]
    @product.price = params[:price]
    if @product.save
    flash[:success] = "Product has been successfully updated."
    redirect_to "/products/#{@product.id}"
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:success] = "Product has been successfully deleted."
    redirect_to "/"
  end

  def search
    search_term = params[:search]
    @products = Product.where("name LIKE ?", "%#{search_term}%")
    render "index.html.erb"
  end
  
end