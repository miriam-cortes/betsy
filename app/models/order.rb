class Order < ActiveRecord::Base
  has_many :line_items
  # has_many :product_orders
  has_many :products, :through => :line_items
  belongs_to :merchant
  belongs_to :guest
end
