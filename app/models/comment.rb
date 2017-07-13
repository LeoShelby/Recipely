class Comment < ApplicationRecord
  
  after_create :create_notification
  
  belongs_to :user
  belongs_to :recipe
  
  validates :user_id,presence: true
  validates :recipe_id, presence: true
  validates :content, presence: true , length: { maximum: 20 }
  
  
  private      
	def create_notification  # per il momento ho fatto questo metodo private, quando avremo altri tipi di notifiche si vedrà, forse ne faccio un altro privato dove serve
		Notification.create(
		  user:  recipe.user,
		  notified_by:  user,
		  type_not: "comment",
		  recipe: recipe,
		  read: false
		)
	end
end
