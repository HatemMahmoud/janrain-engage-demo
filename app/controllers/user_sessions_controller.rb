class UserSessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]
  
  def new
  end
  
  def create
    if params[:token] && user_data = RPXNow.user_data(params[:token])
      user_data = {:identifier => user_data[:identifier], :username => user_data[:username], :email => user_data[:email]}
      if self.current_user = User.find_by_identifier(user_data[:identifier])
        redirect_back_or_default root_path
      else
        self.current_user = User.create!(user_data)
        redirect_to edit_user_path(current_user), :notice => 'Welcome! Please complete required data to continue.'
      end
    else
      redirect_to root_path, :alert => 'Login failed! Please try again.'
    end
  end
  
  def destroy
    self.current_user = nil
    redirect_to root_path
  end
  
end
