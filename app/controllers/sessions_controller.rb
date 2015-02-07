class SessionsController < ApplicationController

  def new
  	# no need to instantiate a new object b/c only logging in, not creating a new user
  end

  def create #setting a hash in our users' browser to let our server (application) reference as they navigate through the application
  	user = User.find_by(email: params[:email]) # find a user by the email typed in and assign it to user variable
  	if user && user.authenticate(params[:password]) # check if user exists and it can be authenticated with the password typed in
  		session[:user_id] = user.id #create key-value pair in session hash
  		redirect_to products_url, notice: "Logged in!" #after session key is assigned, redirect the the products index page
  	else
  		render "new"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to products_url, notice: "Logged out!"
  end

end
