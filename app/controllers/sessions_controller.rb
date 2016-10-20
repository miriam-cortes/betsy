class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']

    flash[:notice] = "Login Failed!"
    return redirect to root_path unless auth_hash['uid']

    @merchant = Merchant.find_by(id: auth_hash[:uid])
    if @merchant.nil?
      # Merchant doesn't match anything in the DB.
      # Attempt to create a new merchant.
      @merchant = Merchant.build_from_github(auth_hash)

      flash[:notice] = "Unable to save the Merchant"
      return redirect_to root_path unless @merchant.save
    end

    #Save the merchant ID in the session
    session[:merchant_id] = @merchant.id

    flash[:notice] = "Successfully logged in!"
    redirect_to root_path
  end

  def create_merchant

  end
  # def login
  #   session[:merchant_id] = 1
  #   redirect_to '/products/index'
  # end
  #
  # def logout
  #   session[:merchant_id] = nil
  #   redirect_to '/products/index'
  #  end


  def destroy
    session[:user_id] = nil
  end
end
