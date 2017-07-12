class CommentsController < ApplicationController
	before_action :logged_in_user , only: [:create,:destroy]
	before_action :correct_user,   only: [:destroy]
	
	
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
			format.js 
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
		
		def correct_user
			@comment=current_user.comments.find_by(id: params[:id])
			if @comment.nil?
				redirect_to root_url 
				flash[:danger]= "Can't delete the comment"
			end
		end
  
end
