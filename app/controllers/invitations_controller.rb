class InvitationsController < ApplicationController
  
  
  before_action :organiser?, only: [:destroy, :new]
  
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
		@event.invitations.create(event_id: params[:event_id],user_id: params[:invitation][:user_id])
		flash[:success]="User invited"
		redirect_to request.referrer
	end

  end
  
  
  def destroy
	@guest=Invitation.find_by(id: params[:id])
	#@event=@guest.event
	@guest.destroy
    respond_to do |format|
		format.js 
    end
  end
  
  def update
	@guest=Invitation.find(params[:id])
	@event=Event.find(params[:event_id])
	
	if @guest.update_attribute(:status,params[:invitation][:status])   
		respond_to do |format|
			format.js 
		end
	else
		render 'edit'
	end
  end
  
  
  private
      def organiser?
		 if Invitation.find_by(id: params[:id])
			 @event=Invitation.find_by(id: params[:id]).event
	     else
	         @event=Event.find(params[:event_id])
	     end
			 return if current_user?(@event.user)
			 flash[:danger] = "You are not the organiser"
			 redirect_to @event
	  end

end
