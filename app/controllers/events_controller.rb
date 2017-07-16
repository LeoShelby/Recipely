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
      redirect_to root_url
    else
      render 'events/new'
    end
  end
  
  
    private

    def event_params
      params.require(:event).permit(:content,:title,:data_ev)
    end
  
end
