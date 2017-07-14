class AddNbnoToIngredients < ActiveRecord::Migration[5.0]
  def change
	add_column :ingredients, :nbno, :string
  end
end
