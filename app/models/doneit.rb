class Doneit < ApplicationRecord
  after_create :create_notification
	
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
end
