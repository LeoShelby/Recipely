class Allergen < ApplicationRecord
	validates :type_allergen, presence: true
end
