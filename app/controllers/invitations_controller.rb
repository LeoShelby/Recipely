class InvitationsController < ApplicationController

  def new
  	  if logged_in?
		@event=Event.find(params[:event_id])
	    
		@invitation = Invitation.new
		
	  end
  end
  
  def create
	@event=Event.find(params[:event_id])
	#@invitation=@event.guests.build(params[:invitation])
	if params[:invitation][:user_id]==""
		flash[:danger]="Select an user"
		redirect_to request.referrer
	else
		@event.guests.create(event_id: params[:event_id],user_id: params[:invitation][:user_id])
		flash[:success]="User invited"
		redirect_to request.referrer
	end

  end

end
