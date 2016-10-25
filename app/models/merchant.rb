# Merchant Model
class Merchant < ActiveRecord::Base
  has_many :products
  has_many :placed_orders, :class_name => "Order"
  has_many :orders, :through => :products
  alias_attribute(:customer_orders, :orders)

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  def self.build_from_github(auth_hash)
    merchant       = Merchant.new
    merchant.uid   = auth_hash[:uid]
    merchant.provider = 'github'
    merchant.name  = auth_hash['info']['name']
    merchant.email = auth_hash['info']['email']
    # user.avatar = auth_hash['extra']['raw_info']['avatar_url']
    # user.followercount = auth_hash['extra']['raw_info']['followers'].to_i

    return merchant
  end

  def revenue_paid_orders
    revenue_total = 0.0
    orders.each do |order|
      if order.order_status == "paid"
        revenue_total += order.total_amount
      end
    end
    return revenue_total
  end

  def revenue_pending_orders
    revenue_total = 0.0
    orders.each do |order|
      if order.order_status == "pending"
        revenue_total += order.total_amount
      end
    end
    return revenue_total
  end

  def cart
    #find cart from merchant orders
    self.placed_orders.find_or_create_by(:order_status => "pending")
  end

  # def orders_count
  #   total_orders = 0
  #   orders.
  # end
end
