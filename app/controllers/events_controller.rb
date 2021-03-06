require 'httparty'

class EventsController < ApplicationController

  before_action :logged_in_user , only: [:new, :create, :destroy,  :edit, :update]
  before_action :correct_user,   only: [:destroy, :edit, :update]

  def new
	@event  = current_user.events.build		
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
	@guests=@event.guests  
	@menu=@event.menu
	
	@meteo=search(@event.location)
  end
  
  def destroy
	@event=Event.find_by(id: params[:id])
	@event.destroy
    flash[:success] = "Event deleted"
    redirect_to  root_url
  end
  
  
  def show_all_ev 
		@user=User.find(params[:id])
	    @events=@user.events
  end
  
  def edit
	@event=Event.find(params[:id])
  end
  
  def update
	@event=Event.find(params[:id])
	if @event.update_attributes(event_params)   
		flash[:success] = "Event updated"
		redirect_to @event
	else
		render 'edit'
	end
  end
  
    private
    
    def correct_user
	  if current_user	
		  return if current_user.admin?
		  @event = current_user.events.find_by(id: params[:id])
		  redirect_to root_url if @event.nil?
	  end
    end

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
