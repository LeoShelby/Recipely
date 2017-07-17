class AddUserIdToAllergens < ActiveRecord::Migration[5.0]
  def change
	add_column :allergens, :user_id, :integer
  end
end
