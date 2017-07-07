module SessionsHelper


	
	def log_in(user)
		session[:user_id] = user.id  #session è un metodo Rails che fa loggare l'utente in sostanza
	end
	
	
	#il metodo current_user scritto più capibile
	#if @current_user.nil?
	#	@current_user = User.find_by(id: session[:user_id])
	#else
	#	@current_user
	#end
	
	def current_user
		if (user_id = session[:user_id])   #se mi trovo nel caso di temporary session
			@current_user ||= User.find_by(id: user_id)
			#significa: O l'utente corrente già c'è Oppure è uguale a quello che trovo tramite il session_id
			
		elsif (user_id = cookies.signed[:user_id])  #se mi trovo nel caso di permanent session
			user = User.find_by(id: user_id)		#recupero l'id dell'utente 	
			if user && user.authenticated?(:remember, cookies[:remember_token])  #se l'utente ha il giusto token nei cookies (più o meno)
			#gli passso come primo argomento il tipo di token come richiesto dal metodo authenticated? definito nel model user
				log_in user
				@current_user = user
			end
		end
	end
	
	
	# Returns true if the user is logged in, false otherwise.
	def logged_in?
		!current_user.nil?
	end
	
	
	# Logs out the current user.
	def log_out  
		forget(current_user)      #dimentico l'utente che avevo ricordato tramite i cookies
		session.delete(:user_id)   #metodo di session che permette di fare il logout per la temporary session
		@current_user = nil       #setto l'utente corrente a nil ovviamente
	end
	
	# Remembers a user in a persistent session.
	def remember(user)
		user.remember   #metodo definito nel model user che crea il token e lo salva nel database criptato
		cookies.permanent.signed[:user_id] = user.id    #utilizzo dei cookies, già settato per durare tipo 20 anni
		cookies.permanent[:remember_token] = user.remember_token
	end
	
	# Forgets a persistent session.
	def forget(user)
		user.forget  #chiama il metodo di model user che aggiorna l'attributo remember_digest dell'utente a NIL
		cookies.delete(:user_id)  # poi tramite cookies levo tutto
		cookies.delete(:remember_token)
	end
	
	
	# Returns true if the given user is the current user.
	def current_user?(user)
		user == current_user
	end
	
	
	# Salvo l'URL a cui l'utente non autorizzato stava cercando di accedere salvandolo nella chiave :forwarding_url di session
	def store_location
		session[:forwarding_url] = request.url if request.get?  #if request.get? serve a evitare che si generino errori, poichè questo metodo può gestire solo richieste GET
	end
	
	# Redirect verso l'URL che avevo salvato oppure verso il default
	def redirect_back_or(default)
		redirect_to(session[:forwarding_url] || default)
		session.delete(:forwarding_url)   #rimuovo l'URL che mi ero salvato
	end
	

end
