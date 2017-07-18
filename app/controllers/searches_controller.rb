class SearchesController < ApplicationController


	def new
		@search=Search.new
	end
	
	def create 
		@search=Search.create(search_params)
		redirect_to @search #ti reindirizzo subito alla show dato che vuoi vedere i risulati della ricerca
	end
	
	def show
		@search=Search.find(params[:id])
	end
	
	
	private
		def search_params
			params.require(:search).permit(:title, :category,:rate,:time)
		end



end
