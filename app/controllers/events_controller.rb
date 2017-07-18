require 'httparty'

class EventsController < ApplicationController

  def new
	  if logged_in?
		@event  = current_user.events.build		
	  end
  end
  
  def create
	@event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event created!"
      redirect_to controller: 'menus', action: 'new',event_id: @event.id
    else
      render 'events/new'
    end
  end
  
  
  def show
	@event=Event.find(params[:id])
	@guests=@event.users  #lista degli invitati
	@menu=@event.menu
	
	@meteo=search(@event.location)
  end
  
  def destroy
	@event=Event.find_by(id: params[:id])
	@event.destroy
    flash[:success] = "Event deleted"
    redirect_to  root_url
  end
  
  
  def show_all_ev  #accroccata per mostrare tutti i likes
		@user=User.find(params[:id])
	    @events=@user.events
  end
  
    private

    def event_params
      params.require(:event).permit(:content,:title,:data_ev,:location)
    end
    
    
    def search(city)

		app_key = '04dc0e30db0c4ee3b28164434171707'


		api='http://api.apixu.com/v1/current.json?key=' + app_key +'&q='+city

		response = HTTParty.get(api)
		json = JSON.parse(response.body)
	
	end
  
end
