class NotificationsController < ApplicationController

  #azione del controller che viene chiamata quando l'utente apre una notifica, tale metodo rende le notifica "letta"
  def link_through
	@notification = Notification.find(params[:id])
	@notification.update read: true
	if @notification.type_not=="following"
		redirect_to @notification.notified_by
	elsif @notification.type_not=="badge"
		redirect_to show_all_path(@notification.user) # ti reindirizzo alla tua pagina dei badges!
	elsif @notification.type_not=="event"
		redirect_to event_path(@notification.event) # ti reindirizzo alla pagina dell'evento!
	else #altrimenti è commento o like quindi vai comunque sulla ricetta
		redirect_to recipe_path(@notification.recipe)
	end
  end
  
  
  #azione che viene chiamata quando l'utente clicca su "view all" nel menù a tendina delle notifiche
  def index  
	@notifications = current_user.notifications.paginate(page: params[:page])
  end 
end
