require 'test_helper'

class OpusesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get opuses_index_url
    assert_response :success
  end

end
