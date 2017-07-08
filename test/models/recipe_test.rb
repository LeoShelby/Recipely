require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = users(:michael)
    #@recipe = Recipe.new(content: "Lorem ipsum", user_id: @user.id, title: "Pasta", category: "primo", rate:3 )
    
    @recipe = @user.recipes.build(content: "Lorem ipsum", user_id: @user.id, title: "Pasta", category: "primo", rate:3 )
    
    @user2 = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  
  end

  test "should be valid" do
   #puts @recipe.errors.messages
    assert @recipe.valid?
    
  end

  test "user id should be present" do
    @recipe.user_id = nil
    assert_not @recipe.valid?
  end
  test "content/title should be present" do
    @recipe.content = "   "
    assert_not @recipe.valid?
    @recipe.title = "   "
    assert_not @recipe.valid?
  end

  test "title should be at most 100 characters" do
    @recipe.title = "a" * 101
    assert_not @recipe.valid?
  end
 
  
  test "rate should be 1 to 5" do
    @recipe.rate=6
	assert_not @recipe.valid?
  end
  
  test "category should be primo/secondo/controno/dessert" do
    @recipe.category= "quinto"
	assert_not @recipe.valid?
  end

  test "associated recipe should be destroyed" do
    @user2.save
    @user2.recipes.create!(content: "Lorem ipsum", user_id: @user2.id, title: "Pasta", category: "primo", rate:3 )
    assert_difference 'Recipe.count', -1 do
      @user2.destroy
    end
  end
  
  
end
