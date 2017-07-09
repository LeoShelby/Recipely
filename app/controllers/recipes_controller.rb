class RecipesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]#per creare o ditruggerere devo essere loggato
  before_action :correct_user,   only: :destroy #posso distruggere il micropost solo se sono io il crreatore
  
    def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      flash[:success] = "Recipe created!"
      redirect_to root_url
    else
	  @feed_items=[] #altrimenti va in errore la view per il feed
      render 'static_pages/home'
    end
  end

  def destroy
    @recipe.destroy
    flash[:success] = "Recipe deleted"
    redirect_to request.referrer || root_url
  end

  private

    def recipe_params
      params.require(:recipe).permit(:content,:title,:rate,:category,:picture)
    end
    
    def correct_user
      @recipe = current_user.recipes.find_by(id: params[:id])
      redirect_to root_url if @recipe.nil?
    end
end
  

