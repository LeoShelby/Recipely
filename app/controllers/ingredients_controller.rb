require 'httparty'
class IngredientsController < ApplicationController
	
	
	def create
		
		@recipe = Recipe.find(params[:recipe_id])
		
		
		
		@ingredient = @recipe.ingredients.build(ingredient_params)
		
		
		
		if @ingredient.save
			@ingredient.recipes.create!(content: @recipe.content, title: @recipe.title, category: @recipe.category, rate: @recipe.rate,time: @recipe.time,user_id: @recipe.user_id )
			respond_to do |format|
				format.html {redirect_to recipe_path(@recipe)}
				#format.js
			end
		else
			
			@error=@ingredient.errors
			respond_to do |format|
				format.html {redirect_to recipe_path(@recipe)}
				format.js 
			end	
		end
	end
	
	def show
		@ingr = Ingredient.find(params[:id])
		
		@info=search(@ingr.name)
		
		
		
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
