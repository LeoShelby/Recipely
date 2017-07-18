class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :content
      t.string :data_ev

      t.timestamps
    end
  end
end
