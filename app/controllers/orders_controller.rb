class OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(params[:order])
    @order.cart_id = current_cart.id
    @order.ip_address = request.remote_ip
    if @order.save
      if @order.purchase
        render :success
      else
        render :failure
      end
    else
      render :new
    end
  end
  
end