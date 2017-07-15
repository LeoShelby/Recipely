class RecipesController < ApplicationController
  before_action :logged_in_user , only: [:create, :destroy,  :edit, :update]#per creare / ditruggerere/fare la new o la show devo essere loggato
  before_action :correct_user,   only: [:destroy, :edit, :update] #posso distruggere o modificare la receipe solo se sono io il crreatore
	
	def new
		if logged_in?
			@recipe  = current_user.recipes.build
			
		end
	end
	
	def show
		@recipe=Recipe.find(params[:id])
		@ingredients=@recipe.ingredients
		
		if logged_in?   
		#quando mostro un ricetta creo in automatico il rating dell'utente che la sta vedendo, poichè
		#il controller Rating non ha la create ma solo l'update, quindi se l'utente non ha già valutato la ricetta
		#creo un rating di score=0 che ovviamente non considero quando calcolo la media nel model della ricetta
		#quindi tutto ciò implica che non puoi valutare una ricetta con zero stelle
			@rating = Rating.where(recipe_id: @recipe.id, user_id: current_user.id).first
			unless @rating
			  @rating = Rating.create(recipe_id: @recipe.id, user_id: current_user.id, score: 0)
			end
		end
	end
	
	def edit
		@recipe = Recipe.find(params[:id])
	end
	
	def index
		@recipes=Recipe.paginate(page: params[:page])
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
      params.require(:recipe).permit(:content,:title,:rate,:category,:picture,:time)
    end
    
    def correct_user
      @recipe = current_user.recipes.find_by(id: params[:id])
      redirect_to root_url if @recipe.nil?
    end
end
  

