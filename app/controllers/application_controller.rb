class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

  def current_user
  	User.find(session[:user_id]) if session[:user_id]
  end
 
  def user_authorized
  	redirect_to '/' unless session[:user_id]
  end
  def logged_in
  	redirect_to '/dashboard' if session[:user_id]
  end
  helper_method :current_user
  helper_method :user_authorized
end
