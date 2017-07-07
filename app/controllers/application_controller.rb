class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper    #rendo disponibili i metodi ausiliari che scrivo dentro a session_helper all'interno di tutti i controller, dato che questo è il padre dei controller
end
