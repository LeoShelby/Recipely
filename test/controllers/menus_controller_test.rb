require 'test_helper'

class MenusControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get menus_new_url
    assert_response :success
  end

end
