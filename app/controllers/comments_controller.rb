class CommentsController < ApplicationController

	def index
	  @comments = Comment.all.where(recipe_id: params[:recipe_id])
	end

	def create
	  @recipe = Recipe.find(params[:recipe_id])
	  @comment = @recipe.comments.build(comment_params)
	  @comment.user=current_user
	  if @comment.save
		flash[:success] = "Comment successfully added"
		redirect_to recipe_path(@recipe)
	  else
	    flash[:danger]="caoa"
		redirect_to recipe_path(@recipe)
	  end
       
	end

	def show
	  @comment = Comment.find(params[:id])
	end

    private
		def comment_params
			params.require(:comment).permit(:recipe_id,:user_id,:content)
		end
  
end
