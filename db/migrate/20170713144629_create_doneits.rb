class CreateDoneits < ActiveRecord::Migration[5.0]
  def change
    create_table :doneits do |t|
      t.references :user, foreign_key: true
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
