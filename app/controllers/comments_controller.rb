class CommentsController < ApplicationController

	def index
	  @comments = Comment.all.where(recipe_id: params[:recipe_id])
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
		redirect_to recipe_path(@recipe)
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
