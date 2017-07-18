class MenusController < ApplicationController
  
  def new
	  if logged_in?
		@event=Event.find(params[:event_id])
	  
		@menu  = Menu.new
		
		@recipes= current_user.recipes
	  end
  end
  
  def create
	@event=Event.find(params[:event_id])
	@menu=@event.build_menu
	
   
    @menu.primo=Recipe.find(params[:menu][:primo_id])  if params[:menu][:primo_id] != ""
    @menu.secondo=Recipe.find(params[:menu][:secondo_id])  if params[:menu][:secondo_id] != ""
    @menu.contorno=Recipe.find(params[:menu][:contorno_id])  if params[:menu][:contorno_id] != ""
    @menu.dessert=Recipe.find(params[:menu][:dessert_id]) if params[:menu][:dessert_id] != ""
    
    if @menu.save
      flash[:success] = "Menu created!"
      redirect_to controller: 'invitations', action: 'new',event_id: @event.id
    else
      render 'menus/new'
    end
  end
  
    
  private

    def menu_params
      params.require(:menu).permit(:primo_id,:secondo_id,:contorno_id,:dessert_id)
    end
end
