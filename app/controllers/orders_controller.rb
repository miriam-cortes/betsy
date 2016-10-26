class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show

    #get list of items for this guest or merchant_id
    @order_items = LineItem.where(order_id: current_cart.id)

  end

  def new
  end

  def create
  end

  def subtotal
    @order_items.each do |line|
    line_cost = line.price * line.qty
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

 def find_product
   #cusomer product page and clicks add product_id
   Product.find_by(id: params[:product_id] || params[:id])
   #need to take the id use it to find product
 end

   def add_to_cart
     product = find_product
     cart = current_cart
     cart.add_product(product, params[:qty])
    #  current_cart.add_product(find_product)
    redirect_to root_path
   end



    # def remove_from_cart
    #   @line = @order.line_items.find(params[:id])
    #     @line.id.destroy(params[:id].to_i)
    # end




end#end of class
