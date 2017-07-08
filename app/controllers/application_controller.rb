class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper    #rendo disponibili i metodi ausiliari che scrivo dentro a session_helper all'interno di tutti i controller, dato che questo è il padre dei controller



  private
		# Confirms a logged-in user.
		def logged_in_user
			unless logged_in?
				store_location
				flash[:danger] = "Please log in."
				redirect_to login_url
			end
		end
end
