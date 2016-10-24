class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action  do define_category_variables(2) end
  helper_method :current_merchant, :current_guest

  def current_merchant
    @current_merchant ||= Merchant.find_by(id: session[:merchant_id].to_i)
  end

  def current_guest
    @current_guest ||= Guest.find_by(id: session[:user_id].to_i)
  end

  def define_category_variables(limit)
    ordered_categories = Category.order("lower(name) ASC")
    @top_catgories = ordered_categories.limit(limit)
    @all_categories = Category.all
    @lesser_categories = find_lesser_categories(ordered_categories, limit)
  end

  def find_lesser_categories(ordered_categories, limit)
    lesser_categories = ordered_categories[limit..-1]
    return lesser_categories
  end


end
