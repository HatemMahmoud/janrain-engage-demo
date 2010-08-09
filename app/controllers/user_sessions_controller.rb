class UserSessionsController < ApplicationController
  skip_before_filter :require_user
  skip_before_filter :verify_authenticity_token, :only => [:create]
  
  # login
  def new
  end
  
  def create
    if params[:token] && user_data = RPXNow.user_data(params[:token], :extended => true)
      user_data = {:identifier => user_data[:identifier], :username => user_data[:username], :email => user_data[:email]}
      # existing user
      if self.current_user = User.find_by_identifier(user_data[:identifier])
        flash[:notice] = 'Welcome back!'
        redirect_back_or_default root_path
      else
        # save new user if valid
        new_user = User.new  user_data
        if new_user.save
          self.current_user = new_user
          flash[:notice] = 'Thanks for signing up!'
          redirect_back_or_default root_path
        else
          # redirect invalid user
          session[:user_data] = user_data
          redirect_to new_user_path, :alert => 'Please complete required data to continue.'
        end
      end
    else
      # login failed or canceled
      redirect_to root_path, :alert => 'Login failed! Please try again.'
    end
  end
  
  # logout
  def destroy
    self.current_user = nil
    redirect_to root_path
  end
  
end