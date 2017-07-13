class Like < ApplicationRecord
  after_create :create_notification
	
  belongs_to :user
  belongs_to :recipe
  
  validates :user_id,presence: true
  validates :recipe_id, presence: true
  
  
  private      
	def create_notification
		return if recipe.user == user
		Notification.create(
		  user:  recipe.user,
		  notified_by:  user,
		  type_not: "like",
		  recipe: recipe,
		  read: false
		)
	end
end
