class OrdersController < ApplicationController
  
  def express
    response = EXPRESS_GATEWAY.setup_purchase(Order.new(cart_id: current_cart.id).price_in_cents,
      :ip                => request.remote_ip,
      :return_url        => new_order_url,
      :cancel_return_url => beers_url
    )
    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end
  
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