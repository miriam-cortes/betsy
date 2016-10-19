class Product < ActiveRecord::Base
  has_many :product_orders
  has_many :orders, :through => :product_orders

  has_many :product_categories
  has_many :categories, :through => :product_categories

  belongs_to :merchant
  has_many :reviews

  ###############
  ### Methods ###
  ###############

  def rating
    total_rating = 0
    if reviews.length != 0
      reviews.each do |review|
        total_rating += review.stars
      end
      return total_rating/reviews.length
      # Do we want the average to round up or down? Should I add one??
    else
      return total_rating
    end
  end


  ###################
  ### Validations ###
  ###################

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :inventory, presence: true
  validates :image, presence: true

  validate :limits_on_stars

  # A rating must be between 0 and 5
  def limits_on_stars
    if rating <= 5 && rating >= 0
      errors.add(:rating, "A rating must be between 0 and 5")
    end
  end
end
