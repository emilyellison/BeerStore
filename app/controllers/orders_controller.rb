class OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new
    @order.first_name = params[:order][:first_name]
    @order.last_name = params[:order][:last_name]
    @order.card_type = params[:order][:card_type]
    @order.card_expires_on = params[:order][:card_expires_on]
    @order.cart_id = current_cart.id
    @order.ip_address = request.remote_ip
    if @order.save
      flash[:success] = 'Your order has been placed.'
      redirect_to user_url(@current_user)
    else
      render :new
    end
  end
  
end