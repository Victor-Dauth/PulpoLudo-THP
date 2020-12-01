require 'test_helper'

class GameSheetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get game_sheets_index_url
    assert_response :success
  end

  test "should get show" do
    get game_sheets_show_url
    assert_response :success
  end

end
