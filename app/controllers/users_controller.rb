class UsersController < ApplicationController
	#instantiating a new user object
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to products_url, notice: "Signed up!" 
    else
      render "new", alert: "Please try again." #allows to pass along a msg to the next request
    end
  end

  private # private to not call the method anywhere else
  def user_params
    params.require(:user).permit(:email , :password, :password_confirmation, :name) #from the params hash, require the user key which has a value of a hash and only permit the keys email, password, and password_confirmation
  end
  
end
