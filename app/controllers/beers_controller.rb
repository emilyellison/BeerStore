class BeersController < ApplicationController
  
  before_filter only: [ :edit, :update, :destroy ] do |action|
    action.redirect_if_not_authorized(Beer.find(params[:id]).user_id)
  end

  def index
    @beers = Beer.all
  end
  
  def new
    @beer = Beer.new
  end
  
  def create
    @beer = Beer.new(params[:beer])
    @beer.user_id = session[:user_id]
    if @beer.save
      flash[:success] = 'Congrats! Your beer has been added.'
      redirect_to beer_url(@beer)
    else
      render :new
    end
  end
  
  def show
    @beer = Beer.find(params[:id])
  end
  
  def edit
    @beer = Beer.find(params[:id])
  end
  
  def update
    @beer = Beer.find(params[:id])
    if @beer.update_attributes(params[:beer])
      flash[:success] = 'Congrats! Your beer has been updated successfully.'
      redirect_to beer_url(@beer)
    else
      render :edit
    end
  end
  
  def destroy
    @beer = Beer.find(params[:id])
    @beer.destroy
    flash[:notice] = 'Your beer has been destroyed successfully.'
    redirect_to beers_url
  end
  
end