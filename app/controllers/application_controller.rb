class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  # Create a current_user helper method to show the log in status of the user
  # protected
  private
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id] #if the session of the user exists, assign the current_user to 

  	# if session[:user_id] This would call the database each time which is redundant
  	# 	User.find(session[:user_id])
  	# end
  end

#helper method works in views files
  helper_method :current_user

  #
  def ensure_logged_in
  	unless current_user
  		redirect_to products_url
  	end
  end
end
