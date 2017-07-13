class Comment < ApplicationRecord
  
  after_create :create_notification
  
  belongs_to :user
  belongs_to :recipe
  
  validates :user_id,presence: true
  validates :recipe_id, presence: true
  validates :content, presence: true , length: { maximum: 20 }
  
  
  private      
	def create_notification
		Notification.create(
		  user:  recipe.user,
		  notified_by:  user,
		  type_not: "comment",
		  recipe: recipe,
		  read: false
		)
	end
end
