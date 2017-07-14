class LikesController < ApplicationController
  before_action :logged_in_user
	
  def show  #accroccata per mostrare tutti i likes
		@recipe=Recipe.find(params[:id])
	    @likes=@recipe.likes
  end
  
  def create
    @recipe = Recipe.find(params[:recipe_id])
    current_user.like(@recipe)
    respond_to do |format|     
      format.html { redirect_to @recipe }
      format.js
    end
  end

  def destroy
	@recipe = Like.find(params[:id]).recipe
    current_user.unlike(@recipe)
    respond_to do |format|    
      format.html { redirect_to @recipe }
      format.js
    end
  end


end
