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
  end
  
  
  
    private

    def event_params
      params.require(:event).permit(:content,:title,:data_ev)
    end
  
end
