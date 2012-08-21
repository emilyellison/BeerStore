class CartItemsController < ApplicationController
  
  before_filter only: [ :destroy ] do |action|
    action.redirect_if_not_authorized(CartItem.find(params[:id]).cart.user_id)
  end
  
  def create
    @beer = Beer.find(params[:beer_id])
    @cart_item = CartItem.new(beer_id: @beer.id, quantity: 1)
    @cart_item.cart_id = @current_user.cart.id
    if @cart_item.save
      flash[:success] = "Added #{@beer.name} to your cart."
      redirect_to root_url
    else
      flash[:error] = "There was an error adding #{@beer.name} to your cart. Could you try again?"
      redirect_to :back
    end
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @dup = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:notice] = "#{@dup.beer.name} has been removed from your cart."
    redirect_to user_url(@current_user)
  end
  
end