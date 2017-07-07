require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
	@u=User.new(name:"aaaaa",email:"bb@a.it",password:"aaaaaaa",password_confirmation:"aaaaaaa")
  end
  
  test "shoul be valid" do
	assert @u.valid?
  end	
  
 
  test "shoul not  be blank" do
	@u.name="  "
	assert_not @u.valid?
  end
  
  test "shoul not be  too long name" do
	@u.name="a"*51
	assert_not @u.valid?
  end
 

  test "should  not be well written email" do
 	@u.email="aaaaaaaaaaaaaaaaaaaaaaaaaaaa@.it"
	assert_not @u.valid?
	@u.email="a"*51
	assert_not @u.valid?
  end
  
  test "no_dublicate" do
	du=@u.dup
	@u.save
	assert_not du.valid?
	
  end
  

 
  test "pssword-len" do
	@u.password="a"
	assert_not @u.valid?
	
  end
 
  
  test "authenticated? should return false for a user with nil digest" do
	assert_not @u.authenticated?(:remember, '')
  end
end
