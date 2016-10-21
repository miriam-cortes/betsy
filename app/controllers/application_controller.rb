class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_merchant, :current_guest

  def current_merchant
    return @current_merchant ||= Merchant.find_by(id: session[:merchant_id].to_i)
  end

  def current_guest
    @current_guest ||= Guest.find_by(id: session[:user_id].to_i)
  end

end
