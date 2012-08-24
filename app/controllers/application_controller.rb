class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :find_logged_in_user
  
  helper_method :authorized_to_change
  
  def find_logged_in_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
  
  def authorized_to_change(user_id)
    @current_user.present? && @current_user.id == user_id
  end
  
  def redirect_if_not_authorized(user_id)
    if !authorized_to_change(user_id)
      flash[:error] = 'You were not authorized to perform that action.'
      redirect_to :back
    end
  end
  
  def current_cart
    @current_cart ||= Cart.find_by_user_id(session[:user_id])
  end
end
