class CommentsController < ApplicationController

	def show  #questa show è magheggio perchè mostra tutti i commenti della ricetta in oggetto
	  @recipe = Recipe.find(params[:id])
	  @comments = @recipe.comments
	end

	def create
	  @recipe = Recipe.find(params[:recipe_id])
	  @comment = @recipe.comments.build(comment_params)
	  @comment.user=current_user
	  if @comment.save
		respond_to do |format|
			format.html {redirect_to recipe_path(@recipe)}
			format.js
		end
	  else
		respond_to do |format|
			format.html {redirect_to recipe_path(@recipe)}
			format.js {render :template => "comments/wrong.js.erb", :layout => false }
			#se il commento che hai inserito supera la lunghezza consentita, faccio partire il file wrong js
		end
	  end
	end


	def destroy
		@comment=Comment.find_by(id: params[:id])
		@recipe = @comment.recipe
		@comment.destroy
		respond_to do |format|
			format.html {redirect_to recipe_path(@recipe)}
			format.js 
        end
    end


    private
		def comment_params
			params.require(:comment).permit(:recipe_id,:user_id,:content)
		end
  
end
