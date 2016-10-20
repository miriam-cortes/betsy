class Category < ActiveRecord::Base
  has_many :product_categories
  has_many :products, :through => :product_categories

# def Self.capitalize_category
#   categories = self.all.each do |c|
#     c.name.capitalize!
#   end
# end
end
