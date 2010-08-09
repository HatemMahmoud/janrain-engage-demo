# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  before_filter :require_user
  helper_method :current_user
  
  private
  
  def current_user=(user)
    session[:user_id] = user.try(:id)
    @current_user = user
  end
  
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
  
  def require_user
    unless current_user
      store_location
      redirect_to login_path, :alert => "Please login to continue." 
      return false
    end
  end
  
  def store_location
    session[:return_to] = request.request_uri
  end
  
  def redirect_back_or_default(default)
    redirect_to session[:return_to] || default
    session[:return_to] = nil
  end
  
end