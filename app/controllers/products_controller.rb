class ProductsController < ApplicationController

  def index
    @products = if params[:search]
      Product.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
    else
      Product.all
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
  	@product = Product.find(params[:id])
    @reviews = @product.reviews
    if current_user
      @review = @product.reviews.build
    end
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save #goes through validation process before saving
  		redirect_to products_url, notice: "Product successfully save!"
  	else
      flash.new[:alert] = "Error saving product"
  		render :new
  	end
  end

  def new
  	@product = Product.new
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def update
  	@product = Product.find(params[:id])
  	if @product.update_attributes(product_params)
  		redirect_to product_path(@product)
  	else
  		render :edit
  	end
  end

  def destroy
  	@product = Product.find(params[:id])
  	@product.destroy
  	redirect_to products_path
  end

  private
  def product_params
  	#From params hash find the product key with a hash value and only retrieve the keys - name, description, price_in_cents
  	params.require(:product).permit(:name, :description, :price_in_cents)
  end

end
