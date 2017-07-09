class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.text :title
      t.text :content
      t.integer :rate
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
