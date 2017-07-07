class User < ApplicationRecord
	attr_accessor :remember_token , :activation_token #serve di creare un attributo virtuale, ossia che non stia sul database, per salvare il remember token non criptato
	#OSS è come prima con la passwords, solo che has_secure_password creava già da solo l'attributo virtuale "password", qui devo crearlo io per il token!

	before_save :downcase_email   #prima di salvare l'utente, converto l'email in lowercase
	
	before_create :create_activation_digest  #prima che l'utente venga creato, devo assegnargli il token di attivazione e il relativo token criptato
	#dato che il secondo è associato ad una colonna sul database, verrà scritto automaticamente non appena l’utente verrà salvato.
	
	validates :name, presence: true, length: { maximum: 50 }
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i   #espressione regolare per gestire il giusto formate delle email
	
	validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	# osservazione rails deduce da solo che uniqueness deve essere true, ossia la email deve essere unica
	# NB l'unicità è a livello di model, la implemento anche a livello di database con gli indici con $ rails generate migration add_index_to_users_email
	
	
	has_secure_password  #metodo rails che aggiunge molte funzioni per gestire le psw, vedi pag 311
	validates :password, length: { minimum: 6 }, allow_blank: true 
	#OSS allow_blank permette agli utenti di non dover per forza riscrivere la password nella form della modifica delle proprie informazioni di profilo
	#nota inoltre che ciò non permette agli utenti di registarsi senza una password, poichè has_secure_password fa comunque quel controllo a prescindere!
	
	# Returns the hash digest of the given string.   
	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
		BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end
	
	# Returns a random token.
	def User.new_token
		SecureRandom.urlsafe_base64
	end
	
	# Remembers a user in the database for use in persistent sessions.
	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token)) #salvo il remember_token criptato nel database!
	end
	
	# Returns true if the given token matches the digest.
	#def authenticated?(remember_token) 
		#soluzione al bug comune che accade se si accede con lo stesso profilo su browser diversi insieme e poi si fa il logout solo da uno dei due browser tipo...
		#return false if remember_digest.nil?  
		#BCrypt::Password.new(remember_digest).is_password?(remember_token)  #con BRcrypt posso verificare che il remember_digest (criptato) corrisponda al remember_token
	#end
	
	
	# Versione generalizzata per gestire sia i remember_token che gli activation_token
	def authenticated?(attribute, token)
		digest = send("#{attribute}_digest")   #il metodo send permette di chiamare il metodo tra parentesi sull'oggeto digest
		return false if digest.nil?
		BCrypt::Password.new(digest).is_password?(token)
	end
		
	
	# Forgets a user.
	def forget
		update_attribute(:remember_digest, nil)
	end
	
	
	# Activates an account.
	def activate
		update_attribute(:activated,true)
		update_attribute(:activated_at, Time.zone.now)
	end
	# Sends activation email.
	def send_activation_email
		UserMailer.account_activation(self).deliver_now
	end
	
	
	private
		# Converts email to all lower-case.
		def downcase_email
			self.email = email.downcase
		end
		# Creates and assigns the activation token and digest.
		def create_activation_digest
			self.activation_token = User.new_token
			self.activation_digest = User.digest(activation_token) 
			#dato che il secondo è associato ad una colonna sul database, verrà scritto automaticamente non appena l’utente verrà salvato.
		end
			
end
