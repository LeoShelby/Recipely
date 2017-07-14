class Ingredient < ApplicationRecord
	
	before_save :downcase_name
	has_many  :recipes
	validates :name, presence: true 

	
end

private 
def downcase_name
	 self.name = name.downcase
end
