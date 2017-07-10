require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @recipe = recipes(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Recipe.count' do
      post recipes_path, params: { recipe: { content: "Lorem ipsum",  title: "Pasta", category: "primo", rate:3 } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Recipe.count' do
      delete recipe_path(@recipe)
    end
    assert_redirected_to login_url
  end
 
  test "should redirect destroy for wrong recipe" do
    log_in_as(users(:michael))
    recipe = recipes(:ants)
    assert_no_difference 'Recipe.count' do
      delete recipe_path(recipe)
    end
    assert_redirected_to root_url
  end
end
