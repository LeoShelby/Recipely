require 'test_helper'

class RecipessInterfaceTest < ActionDispatch::IntegrationTest
def setup
    @user = users(:michael)
  end

  test "recipe interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # Invalid submission
    assert_no_difference 'Recipe.count' do
      post recipes_path, params: { recipe: { content: "" } }
    end
    assert_select 'div#error_explanation'
    # Valid submission
    content = "This recipe really ties the room together"
    title="pasta"
    assert_difference 'Recipe.count', 1 do
    #content: "Lorem ipsum",  title: "Pasta", category: "primo", rate:3 )
      post recipes_path, params: { recipe: { content: content,  title: title, category: "primo", rate:3  } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match title, response.body
    # Delete post
   
    first_recipe = @user.recipes.paginate(page: 1).first
   
    assert_difference 'Recipe.count', -1 do
      delete recipe_path(first_recipe)
    end

  end
end
