class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Create a current_user helper method to show the log in status of the user
  private
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id] #if the session of the user exists, assign the current_user to 
  end

  helper_method :current_user

end
