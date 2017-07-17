require 'httparty'
class IngredientsController < ApplicationController
	


	def show
		@ingr = Ingredient.find(params[:id])	
		@info=search(@ingr.name)
		
		@allergen=['Molluscs','Lupin','Mustard','Crustaceans', 'Eggs ', 'Fish','Peanuts','Soybeans','Milk','Nuts','Celery'].include? @ingr.name.capitalize

		
	end
	
	
	private 
	
	def ingredient_params
		params.require(:ingredient).permit(:recipe_id,:name)
	end
	
	def search(item)
		app_id  = 'app_id=2793d7ce'
		app_key = '&app_key=4cd4a85807c4aeda9ad306f2d7e43472'
		base_url='https://api.edamam.com/api/nutrition-data?'
		#response = HTTParty.get('https://api.edamam.com/api/nutrition-data?app_id=2793d7ce&app_key=4cd4a85807c4aeda9ad306f2d7e43472&ingr=1%20oz%20'+item)
		
		response = HTTParty.get(base_url + app_id + app_key+'&ingr=1%20oz%20'+item)
	
	end
end
