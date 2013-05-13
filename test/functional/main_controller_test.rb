require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get girl" do
    get :girl
    assert_response :success
  end

end
