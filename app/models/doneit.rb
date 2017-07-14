class Doneit < ApplicationRecord
  after_create :create_notification
  
  after_create :badge_level_up
  after_destroy :badge_level_down
  
  belongs_to :user
  belongs_to :recipe
  
  validates :user_id,presence: true
  validates :recipe_id, presence: true
  
  
  private      
	def create_notification
		Notification.create(
		  user:  recipe.user,
		  notified_by:  user,
		  type_not: "doneit",
		  recipe: recipe,
		  read: false
		)
	end
	
	def badge_level_up
		if !(user.badges.find_by(type_bad: "Chef").nil?)    #se ho già il badge devo solo vedere se va aggiornato al livello superiore
			badge=user.badges.find_by(type_bad: "Chef")
			if user.doneits.count >=3
				badge.update_attribute(:level , "3")
			elsif user.doneits.count >=2
				badge.update_attribute(:level , "2")
			elsif user.doneits.count >=1
				badge.update_attribute(:level , "1")
			end
		else 
			if user.doneits.count >= 1       #se non ho già un badge e ho messo più di 10 like ottengo il badge di livello 1
				Badge.create(
				  user:  user,
				  type_bad: "Chef",
				  level: 1,
				  picture: "chef.png"
				)
			end
		end
	end
	
	def badge_level_down
		if !(user.badges.find_by(type_bad: "Chef").nil?)    #se ho già il badge devo solo vedere se va aggiornato al livello inferiore
			badge=user.badges.find_by(type_bad: "Chef")
			if user.doneits.count==0
				badge.update_attribute(:level , "0")         #se togli tutti i like arrivi al livello zero
			elsif user.doneits.count < 2
				badge.update_attribute(:level , "1")
			elsif user.doneits.count < 3
				badge.update_attribute(:level , "2")
	        end
	    end
	end
end
