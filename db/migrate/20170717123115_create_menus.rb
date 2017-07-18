class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.references :event, foreign_key: true
      t.references :primo, foreign_key: true
      t.references :secondo, foreign_key: true
      t.references :contorno, foreign_key: true
      t.references :dessert, foreign_key: true

      t.timestamps
    end
  end
end
