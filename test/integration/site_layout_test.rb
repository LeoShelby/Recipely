require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  test "layout links" do
	get root_url
	assert_template 'static_pages/home'
	get signup_url
	assert_template 'users/new'
  end

end
