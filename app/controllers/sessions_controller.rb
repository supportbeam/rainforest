class SessionsController < ApplicationController

  def new
  	# no need to instantiate a new object b/c only logging in, not creating a new user model/table
  end

  def create # Not creaitng a model. Instead, setting a hash in our users' browser to let our server (application) reference as they navigate through the application. Also not writing anything to the database so do not need a private method
  	user = User.find_by(email: params[:email]) # find a user by the email typed in and assign it to user variable
  	if user && user.authenticate(params[:password]) # check if user exists and it can be authenticated with the password typed in
  		session[:user_id] = user.id #Setting a cookie(a hash) by create key-value pair in session hash that lives in the browser, not in the rainforest server app
  		redirect_to products_url, notice: "Logged in!" #after session key is assigned, redirect the the products index page
  	else
  		flash.now[:alert] = "Invalid email or password"
  		render "new"
  	end
  end

  def destroy
  	session[:user_id] = nil #empty the session hash = unset the cookie
  	redirect_to products_url, notice: "Logged out!"
  end


end
