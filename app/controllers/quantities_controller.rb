class QuantitiesController < ApplicationController
		
		
	def new
		@quantity = Quantity.new
		#@quantity.recipe_id=params[:recipe_id]
		@recipe=Recipe.find(params[:recipe_id])
	end
	def create
		
		@recipe = Recipe.find(params[:recipe_id])

	#	@ingredient = Ingredient.where("name = ?", params[:quantity][:ingredient_id])
		@ingredient = Ingredient.where("name = ?", params[:quantity][:ingredient_id]).take
		
		
		if (@ingredient.nil?)
			
			@ingredient=Ingredient.new(name: params[:quantity][:ingredient_id])
			if @ingredient.save
				flash[:success]="Ingredient added"
				@recipe.nutrients.create(recipe_id: params[:recipe_id],ingredient_id: @ingredient.id,measure: params[:quantity][:measure])
				redirect_to request.referrer
			else
				
				@error=@ingredient.errors
				respond_to do |format|
					format.html {redirect_to root_url}
					format.js 
				end	
			end
		else 
			if  @recipe.ingredients.include?(@ingredient)
				flash[:warning]="This ingredient already exists in this recipe"
				redirect_to request.referrer
				
			else
				flash[:success]="Ingredient added "
				@recipe.nutrients.create(recipe_id: params[:recipe_id],ingredient_id: @ingredient.id, measure: params[:quantity][:measure] )
				redirect_to request.referrer
			end
		end	
	end

	def destroy
		redirect_to root_url
		
	end
	
	
	
	
	def quantity_params
		params.require(:quantity).permit(:ingredient_id)
	end
	
end
