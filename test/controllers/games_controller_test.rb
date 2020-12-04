require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest

  # test "the truth" do
  #   assert true
  # end

  test "should get update" do
    get games_update_url
    assert_response :success
  end

end
