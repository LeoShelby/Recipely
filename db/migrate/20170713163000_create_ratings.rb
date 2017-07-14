class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.references :user, foreign_key: true
      t.references :recipe, foreign_key: true
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
