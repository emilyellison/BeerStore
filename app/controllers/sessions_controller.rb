class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome back, #{@user.name}!"
      redirect_to user_url(@user)
    else
      render :new
    end
  end
  
  def destroy
    reset_session
    flash[:notice] = 'Come back soon!'
    redirect_to root_url
  end
  
end