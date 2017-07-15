class Ingredient < ApplicationRecord
	
	before_save :downcase_name
	
	has_many  :presences , class_name: "Quantity" , foreign_key: "ingredient_id",dependent: :destroy
	has_many  :recipes , through: :presences ,source: :recipe  
	
	validates :name, presence: true ,uniqueness: { case_sensitive: false }

	
end

private 
def downcase_name
	 self.name = name.downcase
end
