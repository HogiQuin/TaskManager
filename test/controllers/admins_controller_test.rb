require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  test "should get welcome_admin" do
    get :welcome_admin
    assert_response :success
  end

end
