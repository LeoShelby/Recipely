class CreateBadges < ActiveRecord::Migration[5.0]
  def change
    create_table :badges do |t|
      t.references :user, foreign_key: true
      t.string :type_bad
      t.integer :level
      t.string :picture

      t.timestamps
    end
  end
end
