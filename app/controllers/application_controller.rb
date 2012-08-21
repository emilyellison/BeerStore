class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :find_logged_in_user
  
  def find_logged_in_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
  
  def redirect_if_not_authorized(user_id)
    if @current_user.nil? || @current_user.id != user_id
      flash[:error] = 'You were not authorized to perform that action.'
      redirect_to :back
    end
  end
end
