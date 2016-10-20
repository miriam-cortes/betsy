require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, {product_id: products(:glitter).id}
    assert_response :success
    assert_template :index
  end

  test "should get show" do
    get :show, {id: reviews(:glitter_review), product_id: products(:glitter).id}
    assert_response :success
  end

  test "should get new" do
    get :new, {product_id: products(:glitter).id}
    assert_response :success
    assert_template :new
  end

  test "should be able to create a new product" do
    post :create, {product_id: products(:glitter).id, review: {description: "njefknlsnf", stars: 2, author: "nfs"}}
    assert_response :redirect
    # This action will need to change to merchant's create_new_product path
  end

  test "creating a product changes the number of products" do
    assert_difference("Review.count",1) do
      post :create, {product_id: products(:glitter).id, review: {description: "njefknlsnf", stars: 2, author: "nfs"}}
    end
  end


  test "deleting a product changes the number of products" do
    assert_difference("Review.count", -1) do
      delete :destroy, {product_id: products(:glitter).id, id: reviews(:glitter_review).id }
    end
  end

  test "responds with error if file isn't found" do
    delete :destroy, {product_id: products(:glitter).id, id: 943}
    assert_response :missing
  end
end
