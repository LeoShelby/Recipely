class DoneitsController < ApplicationController
  before_action :logged_in_user

  def create
    @recipe = Recipe.find(params[:recipe_id])
    current_user.doneit(@recipe)
     respond_to do |format|     
      format.html { redirect_to @recipe }
      format.js
    end
  end

  def destroy
	@recipe = Like.find(params[:id]).recipe
    current_user.undoneit(@recipe)
    respond_to do |format|    
      format.html { redirect_to @recipe }
      format.js
    end
  end


end
