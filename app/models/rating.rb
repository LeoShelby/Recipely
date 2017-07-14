class Rating < ApplicationRecord

  after_save :create_notification

  belongs_to :user
  belongs_to :recipe
  
  private      
	def create_notification
		return if recipe.user == user
	    if recipe.ratings.where(user_id: user.id).first.score != 0   
	    #quando l'utente vede una ricetta, viene creato un rating pari a 0 a prescindere
	    #quindi non devo creare una notifica se l'utente ha semplimente visto la ricetta ma non ha votato
			Notification.create(
			  user:  recipe.user,
			  notified_by:  user,
			  type_not: "rating",
			  recipe: recipe,
			  read: false
			)
		end
	end
end
