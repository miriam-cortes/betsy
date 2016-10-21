class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def view_cart
  end

  def new
  end

  def create
    if current_merchant.nil?
      guest_create_cart
    # elsif current_merchant.nil? && if @order.guest_id != nil
    #   add_line_to_cart
    # elsif current_merchant != nil
      #other code to create cart or add line to cart.
    # end
    # end
    end
  end

  def subtotal
    @order.line_items do |line|
    line_cost = @line.price * @line.qty
    total_amount << line_cost
    return total_amount
    end
  end

    def total_amount
      subtotal
      total_amount.inject { |result, element| result + element }
      return result
    end




  def edit
  end

  def update
  end

  def destroy
  end



  def guest_create_cart
    @line = LineItem.new
    @line.product_id = params["product_id"]
    @line.merchant_id = params["merchant_id"]
    @line.qty = params["qty"]
    @line.price = params["price"]
    @line.order_id = @order.id
    @line.save
  end
  def add_line_to_cart
    @line = LineItem.new
    @line.order_id = @order.id
    @line.product_id = params[:product]["product_id"]
    @line.merchant_id = params[:product]["merchant_id"]
    @line.qty = params["qty"]
    @line.price = params[:product]["price"]
    @line.save
  end

    def remove_from_cart
      @line = @order.line_items.find(params[:id])
        @line.id.destroy(params[:id].to_i)
    end

  


end#end of class
