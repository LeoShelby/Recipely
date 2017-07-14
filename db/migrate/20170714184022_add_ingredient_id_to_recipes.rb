class AddIngredientIdToRecipes < ActiveRecord::Migration[5.0]
  def change
		add_column :recipes, :ingredient_id, :integer
  end
end
