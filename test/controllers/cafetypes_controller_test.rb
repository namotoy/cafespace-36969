require 'test_helper'

class CafetypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cafetypes_index_url
    assert_response :success
  end

end
