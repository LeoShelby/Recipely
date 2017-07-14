class Rating < ApplicationRecord

  after_save :create_notification


  after_update :badge_level_up  #il rating una volta messo puoi solo modificarlo, non si può distruggere


  belongs_to :user
  belongs_to :recipe
  
  private      
	def create_notification
		return if recipe.user == user
	    if recipe.ratings.where(user_id: user.id).first.score != 0 
	    #quando l'utente vede una ricetta, viene creato un rating pari a 0 a prescindere
	    #quindi non devo creare una notifica se l'utente ha semplimente visto la ricetta ma non ha votato
	    
	    #NB la query torna nella pratica sempre un elemento però se non ci fai il first è un array di un solo elemento e il metodo score da errore!
			Notification.create(
			  user:  recipe.user,
			  notified_by:  user,
			  type_not: "rating",
			  recipe: recipe,
			  read: false
			)
		end
	end
	
	#chiamo il metodo comune a tutti i badges nel model application_record  SUPERDRY
	def badge_level_up
	    return if recipe.ratings.where(user_id: user.id).first.score == 0 
		badge_level_up_aux("Critic","critic","ratings")
	end
    
end
