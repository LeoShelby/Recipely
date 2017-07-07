class SessionsController < ApplicationController

  def new
  end
  
  def create
	user = User.find_by(email: params[:session][:email].downcase)  #trovo l'utente attraverso la email che trasmette nel form della session ossia il form di login
	if user && user.authenticate(params[:session][:password])    #authenticate è un metodo fornito da "has_secure_password"
		if user.activated?  #metodo generato automaticamente da Rails poichè "active" è un attributo boooleano nel db
			log_in user   #metodo di session_helper
			params[:session][:remember_me] == '1' ? remember(user) : forget(user)  #se l'utente ha spuntato "ricordami" chiamo il metodo remember sull'utente
			redirect_back_or user  
			#metodo definito in sessions_helper, reindirizza l'utente o sul default (ossia "user", la sua pagina utente) o sulla pagina 
			#che aveva tentato di accedere prima che fosse loggato e che quindi avesse il permesso per accedervi
		else
			message = "Account not activated. "
			message += "Check your email for the activation link."
			flash[:warning] = message
			redirect_to root_url
		end
	
	else
		flash.now[:danger] = 'Invalid email/password combination' 
		render 'new'
		#utilizziamo flash.now poichè il messaggio con flash scompare solo se si fa un reindirizzamento, mentre qui facciamo solo un render
		#perciò se non usassimo flash.now il messaggio resterebbe a schermo fino al prossimo reindirizzamento!
	end
  end

  def destroy
	log_out if logged_in?    #metodo definito in session_helper, che applico solo se l'utente è effetivamente loggato
	redirect_to root_url
  end
  
  
end
