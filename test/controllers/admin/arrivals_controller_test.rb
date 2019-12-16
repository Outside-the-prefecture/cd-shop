require 'test_helper'

class Admin::ArrivalsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_arrivals_create_url
    assert_response :success
  end

end
