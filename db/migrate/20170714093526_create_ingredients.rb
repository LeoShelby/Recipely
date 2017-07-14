class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.string :nbno
      t.integer :quantity

      t.timestamps
    end
  end
end
