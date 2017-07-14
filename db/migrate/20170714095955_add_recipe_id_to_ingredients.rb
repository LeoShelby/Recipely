class AddRecipeIdToIngredients < ActiveRecord::Migration[5.0]
  def change
    
    add_column :ingredients, :recipe_id, :integer
 
  end
end
