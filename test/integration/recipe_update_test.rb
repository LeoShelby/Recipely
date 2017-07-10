require 'test_helper'

class RecipeUpdateTest < ActionDispatch::IntegrationTest
def setup
    @user = users(:michael)
    @recipe=@user.recipes.first
  end

 
    test "unsuccessful edit" do
    log_in_as(@user)
    
    get edit_recipe_path(@recipe)
    assert_template 'recipes/edit'
    patch recipe_path(@recipe), params: { recipe: { title:  "",
                                              content: "aaa",
                                              category:              "primo",
                                              rate: 2 } }

    assert_template 'recipes/edit'
  end
    test "successful edit" do
    log_in_as(@user)
    get edit_recipe_path(@recipe)
    assert_template 'recipes/edit'
    title  = "pasta"
    content = "faaaaaaa"
    category= "primo"
    rate= 2
    
    patch recipe_path(@recipe), params: { recipe: { title:  title,
                                              content: content,
                                              category:              category,
                                              rate: rate } }
    assert_not flash.empty?
    assert_redirected_to root_url

  end
    test "successful edit with friendly forwarding" do
    
    get edit_recipe_path(@recipe)
    
    log_in_as(@user)
    assert_redirected_to edit_recipe_url(@recipe)
    title = "pasta"
    content = "faaaaaaa"
    category= "primo"
    rate= 2
    patch recipe_path(@recipe), params: { recipe: { title:  title,
                                              content: content,
                                              category:              category,
                                              rate: rate } }
    assert_not flash.empty?
    assert_redirected_to root_url

  end
end
