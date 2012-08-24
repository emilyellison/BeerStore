class OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(params[:order])
    if @order.save
      flash[:success] = 'Your order has been placed.'
      redirect_to user_url(@current_user)
    else
      render :new
    end
  end
  
end