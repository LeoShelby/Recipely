class MenusController < ApplicationController
  
  def new
		@event=Event.find(params[:event_id])
	  	@menu  = Menu.new
		@recipes= current_user.recipes
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

  def edit
    @event=Event.find(params[:id])
	@menu=@event.menu
  end
  
  def update
	@event=Event.find(params[:id])
	@menu=@event.menu
	if @menu.update_attributes(menu_params)   #se l'aggiornamento dell'evento va a buon fine...
		flash[:success] = "Menu updated"
		redirect_to @event
	else
		render 'edit'
	end
  end
    
  private

    def menu_params
      params.require(:menu).permit(:primo_id,:secondo_id,:contorno_id,:dessert_id)
    end
end
