class AddAllergenIdToRecipes < ActiveRecord::Migration[5.0]
  def change
	add_column :allergens, :allergen_id, :integer
  end
end
