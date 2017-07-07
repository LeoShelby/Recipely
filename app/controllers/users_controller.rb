class UsersController < ApplicationController
  def new
	@user = User.new
  end
  
  def show
	@user = User.find(params[:id])
  end
  
  def create
	@user = User.new(user_params)   #invece di usare (params[:user]) che passava tutti i parametri, non sicuro!
	if @user.save
		log_in @user  #al momento della registrazione l'utente viene direttamente loggato
		remember user #metodo definito in session_helper
		flash[:success] = "Welcome to Recipely!"  #success è una convezione di Rails per indicare esito positivo
		redirect_to @user  #non faccio (non c'è proprio(?)) una views per la create, reindirizzo alla pagina utente!
	else
		render 'new'
	end
  end
  
  
  private
  
	def user_params                  #metodo convenzionale, restituisce una versione dell’hash params con i soli attributi consentiti
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
