class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :title
      t.string :category
      t.integer :rate
      t.integer :time

      t.timestamps
    end
  end
end
