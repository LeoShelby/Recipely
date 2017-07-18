require 'test_helper'

class InvitationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get invitations_new_url
    assert_response :success
  end

end
