class Quantity < ApplicationRecord
	before_save :default_values
	belongs_to :recipe , class_name: "Recipe"
	belongs_to :ingredient , class_name: "Ingredient"
	validates :recipe_id , presence: true
	validates :ingredient_id , presence: true
	
	
	  
  def default_values
    self.measure ||=0 # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
  end
	
end
