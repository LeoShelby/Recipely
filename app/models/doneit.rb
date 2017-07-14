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
		badge_level_up_aux("Chef","chef","doneits")
	end
	
    def badge_level_down
		badge_level_down_aux("Chef","chef","doneits")
	end
    
end
