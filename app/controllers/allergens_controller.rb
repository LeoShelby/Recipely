class AllergensController < ApplicationController
  def new
  
	@allergen = Allergen.new
	@id=params[:format]
	@recipe=Recipe.find(@id)
	end

	def create
		
	end


end
