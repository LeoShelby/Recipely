class FixColumnNameToIngredients < ActiveRecord::Migration[5.0]
  def change
	 rename_column :ingredients, :nbno, :name
  end
end
