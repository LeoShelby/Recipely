class User < ApplicationRecord

	before_save { self.email = email.downcase }   #prima di salvare l'utente, converto l'email in lowercase
	
	validates :name, presence: true, length: { maximum: 50 }
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i   #espressione regolare per gestire il giusto formate delle email
	
	validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	# osservazione rails deduce da solo che uniqueness deve essere true, ossia la email deve essere unica
	# NB l'unicità è a livello di model, la implemento anche a livello di database con gli indici con $ rails generate migration add_index_to_users_email
	
	
	has_secure_password  #metodo rails che aggiunge molte funzioni per gestire le psw, vedi pag 311
	validates :password, length: { minimum: 6 }
end
