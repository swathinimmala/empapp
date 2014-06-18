require 'test_helper'

class EmployeesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get sort" do
    get :sort
    assert_response :success
  end

end
