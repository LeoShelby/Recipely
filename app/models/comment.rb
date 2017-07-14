class Comment < ApplicationRecord
  
  after_create :create_notification
  
  
  after_create :badge_level_up
  after_destroy :badge_level_down
  
  
  belongs_to :user
  belongs_to :recipe
  
  validates :user_id,presence: true
  validates :recipe_id, presence: true
  validates :content, presence: true , length: { maximum: 20 }
  
  
  private      
	def create_notification
		return if recipe.user == user
		Notification.create(
		  user:  recipe.user,
		  notified_by:  user,
		  type_not: "comment",
		  recipe: recipe,
		  read: false
		)
	end
	
	#chiamo il metodo comune a tutti i badges nel model application_record  SUPERDRY
	def badge_level_up 
		badge_level_up_aux("Commenter","commenter","comments")
	end
	
    def badge_level_down
		badge_level_down_aux("Commenter","commenter","comments")
	end
end
