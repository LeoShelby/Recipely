class FoodsController < ApplicationController
	
	def index
		@result=Food.find1
	end
end
