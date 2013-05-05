require 'test_helper'

class ChoiceControllerTest < ActionController::TestCase
  test "should get check" do
    get :check
    assert_response :success
  end

end
