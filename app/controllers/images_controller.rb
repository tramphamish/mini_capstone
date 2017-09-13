class ImagesController < ApplicationController
  def new
    @product = Product.find_by(id: params[:product_id])
    render "new.html.erb"
  end
  def create
    product_id = params[:product_id]
    image = Image.create( 
      image: params[:image], 
      product_id: product_id
      )
    flash[:success] = "New image successfully added."
    redirect_to "/products/#{product_id}"
  end
end
