class Search < ApplicationRecord

	#metodo per filtrare le ricette da mostrare a seconda dei campi inseriti nella ricerca avanzata
	
	def search_recipes
		
		recipes=Recipe.all
		recipes=recipes.where('recipes.title LIKE ?',"%#{title}%") if title.present?
		recipes=recipes.where('recipes.category LIKE ?',category) if category.present?
		recipes=recipes.where('recipes.rate <= ?',rate) if rate.present?
		recipes=recipes.where('recipes.time <= ?',time) if time.present?

		return recipes
	end
	
	
end
