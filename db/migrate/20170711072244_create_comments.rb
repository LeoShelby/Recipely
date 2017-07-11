class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
