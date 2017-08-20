class Invitation < ApplicationRecord
  belongs_to :event, class_name: "Event"
  belongs_to :user, class_name: "User"
  
  after_create :create_notification
  
  after_initialize :default_values

  private      
	def create_notification
		Notification.create(
		  user:  user,
		  notified_by:  event.user,
		  type_not: "event",
		  event: event,
		  read: false
		)
	end
	
	def default_values
		self.status ||= "I don't know"
	end
end
