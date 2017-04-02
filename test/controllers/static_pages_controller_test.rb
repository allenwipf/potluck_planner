require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get potluck_view" do
    get :potluck_view
    assert_response :success
  end

  test "should get potlucks" do
    get :potlucks
    assert_response :success
  end

  test "should get users" do
    get :users
    assert_response :success
  end

end
