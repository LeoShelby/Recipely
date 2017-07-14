class BadgesController < ApplicationController

	def show_all
		@user=User.find(params[:id])
		@badges=@user.badges
	end
	
end
