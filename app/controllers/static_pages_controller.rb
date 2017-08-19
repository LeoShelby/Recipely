require 'httparty'

class StaticPagesController < ApplicationController
  def home
	  if logged_in?
		@recipe  = current_user.recipes.build
		@feed_items = current_user.feed.paginate(page: params[:page])#per il feed
    end

  end

  def help
  end
  
  def about
  end
  
  def contact
  end
  
  def weather
	@event=Event.find(params[:id])
	@meteo=search(@event.location)
  end
  
  
  private 
	 def search(city)

		app_key = '04dc0e30db0c4ee3b28164434171707'

		# 7 days 
		
		api='http://api.apixu.com/v1/forecast.json?key=' + app_key +'&q='+city+"&days=7"

		response = HTTParty.get(api)
		json = JSON.parse(response.body)
	
	end
end
