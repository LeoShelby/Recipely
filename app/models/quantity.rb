class Quantity < ApplicationRecord
	belongs_to :recipe , class_name: "Recipe"
	belongs_to :ingredient , class_name: "Ingredient"
	validates :recipe_id , presence: true
	validates :ingredient_id , presence: true
end
