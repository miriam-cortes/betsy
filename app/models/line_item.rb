class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  
  def subtotal
    @order_items.each do |item|
    @item_total = item.price * item.qty
    subtotal << @item_total
    return subtotal
    end
  end

    def total_amount
      subtotal.inject(0) { |total, element| total + element }
      return total
    end

end
