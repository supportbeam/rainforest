class ReviewsController < ApplicationController

  # before_action :ensure_logged_in  
  before_filter :ensure_logged_in, only: [:create, :destroy]
	before_filter :load_product
	# to run before every action, let's call a load_product method that retrieves the appropriate product so a new review can be associated to it

  def show
  	@review = Review.find(params[:id])
  end

  def create
  	# @review = @product.reviews.build(review_params.merge(user: current_user))
    # @product = Product.find(params[:product_id])
  	@review = @product.reviews.build(review_params)
    @review.user = current_user
  	# What is actually happening in build:
  	# 	@review = Review.new(
    #   comment: params[:review][:comment],
    #   product_id: @product.id,
    #   user_id: current_user.id
    # )
    respond_to do |format|
  		if @review.save
        format.html { 
  			redirect_to products_path(@product), notice: "Review created successfully"
        }
        format.js {}
  		else
        format.html {
    			render "products/show",
          flash.new[:alert] = "Error creating product. Please try again."
        }
        format.js {}
    	end      
    end
  end

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy
  end

  private
  def review_params
  	params.require(:review).permit(:comment, :product_id)
  end

  def load_product
  	@product = Product.find(params[:product_id])
  end

end
