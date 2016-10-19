class Review < ActiveRecord::Base
  belongs_to :product




  ###################
  ### Validations ###
  ###################

  validates :stars, presence: true
  validates :description, presence: true

  validate :limits_on_stars

  # A rating must be between 0 and 5
  def limits_on_stars
    unless stars <= 5 && stars >= 0
      errors.add(:stars, "A rating must be between 0 and 5 stars")
    end
  end
end
