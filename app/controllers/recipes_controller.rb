class RecipesController < ApplicationController
  before_action :logged_in_user , only: [:create, :destroy]#per creare / ditruggerere/fare la new o la show devo essere loggato
  before_action :correct_user,   only: [:destroy, :edit, :update] #posso distruggere o modificare la receipe solo se sono io il crreatore
	
	def new
		if logged_in?
			@recipe  = current_user.recipes.build
			
		end
	end
	
	def show
		@recipe=Recipe.find(params[:id])
	end
	def edit
		@recipe = Recipe.find(params[:id])
	end

    def update
		@recipe = Recipe.find(params[:id])
		if @recipe.update_attributes(recipe_params)   #se l'aggiornamento del recipe va a buon fine...
			flash[:success] = "Recipe updated"
			redirect_to root_url
		else
			render 'edit'
		end
	end
  

 
    def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      flash[:success] = "Recipe created!"
      redirect_to root_url
    else
	  @feed_items=[] #altrimenti va in errore la view per il feed
      render 'recipes/new'
    end
  end

  def destroy
    @recipe.destroy
    flash[:success] = "Recipe deleted"
    #redirect_to request.referrer || root_url
    redirect_to  root_url
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
  

