class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'Thanks for signing up for the BeerOn store!'
      redirect_to user_url(@user)
    else
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id]) 
  end
  
end