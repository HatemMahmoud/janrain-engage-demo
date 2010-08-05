class UsersController < ApplicationController
  skip_before_filter :require_user, :only => [:index, :new, :create]
  
  def set_title
    @title = controller_name
  end
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    if session[:user_data].blank?
      redirect_to root_path
    else
      @user = User.new session[:user_data]
      session[:user_data] = nil
    end
  end
  
  def edit
    if current_user.id == params[:id].to_i
      @user = current_user
    else
      redirect_to root_path, :alert => 'Access denied!'
    end
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      self.current_user = @user
      flash[:notice] = 'Thanks for signing up!'
      redirect_back_or_default root_path
    else
      render :new
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, :notice => 'User was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
end