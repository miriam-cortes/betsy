require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
  test "Product must have a name, description, price, inventory and image" do
    assert products(:glitter).valid? "Glitter should be valid" ### WHY IS THIS FAILING???

    products(:glitter).name = nil  ## This name removal is local to the test data - it doesn't change the fixture
    assert_not products(:glitter).valid? "Glitter should no longer be valid"

    products(:new_shoe).price = nil
    assert_not products(:new_shoe).valid? "New Shoe should no longer be valid"
  end

  test "Products cannot have a rating less than 0 or greater than 5" do
    assert products(:glitter).rating = 6
    assert_not products(:glitter).valid? "Glitter should no longer be valid"

    assert products(:new_shoe).rating = -1
    assert_not products(:new_shoe).valid? "New Shoe should no longer be valid"
  end


  test "The amount of an product's reviews" do
    assert_equal products(:glitter).reviews.length, 1
    assert_equal products(:new_shoe).reviews.length, 1
    assert_equal products(:no_rating).reviews.length, 2
  end

  test "No Rating has the correct reviews" do
    assert_includes products(:no_rating).reviews, reviews(:rating_review_one)
    assert_includes products(:no_rating).reviews, reviews(:rating_review_two)
  end






  # test "Products total rating must be the average of a products reviews" do
  #   assert_equal products(:no_rating).rating, 0
  #
  #   reviews(:rating_review_one).save
  #   reviews(:rating_review_two).save
  #
  #   assert_equal products(:no_rating).rating, 4
  #
  #   reviews(:rating_review_two).stars = 0
  #   reviews(:rating_review_two).save
  #
  #   assert_equal products(:no_rating).rating, 2
  # end

end
