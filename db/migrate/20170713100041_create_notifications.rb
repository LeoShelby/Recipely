class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.references :notified_by, foreign_key: true
      t.references :recipe, foreign_key: true
      t.string :type_not
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
