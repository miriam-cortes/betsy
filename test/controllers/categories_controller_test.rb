require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get show" do
    get :show, {id: categories(:two).id}
    assert_response :success
    assert_template :show
  end

  test "should get new" do
    skip
    get :new
    assert_response :success
  end

  test "should get create" do
    skip
    post :create
    assert_response :success

    assert_difference('Category.count', 1) do
      post_params = {category: {name: "A Category"}}
      post :create, post_params
    end
    assert_response :redirect
  end


  test "should get destroy" do
    skip
    get :destroy
    assert_response :success
  end

end
