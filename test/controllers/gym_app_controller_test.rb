require 'test_helper'

class GymAppControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gym_app_index_url
    assert_response :success
  end

  test "should get show" do
    get gym_app_show_url
    assert_response :success
  end

end
