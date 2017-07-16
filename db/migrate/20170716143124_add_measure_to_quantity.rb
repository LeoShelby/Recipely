class AddMeasureToQuantity < ActiveRecord::Migration[5.0]
  def change
	 
    add_column :quantities, :measure, :integer
  
  end
end
