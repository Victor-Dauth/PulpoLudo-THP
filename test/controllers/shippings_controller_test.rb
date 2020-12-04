require 'test_helper'

class ShippingsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get shippings_show_url
    assert_response :success
  end

  test "should get create" do
    get shippings_create_url
    assert_response :success
  end

end
