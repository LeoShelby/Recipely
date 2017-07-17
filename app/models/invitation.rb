class Invitation < ApplicationRecord
  belongs_to :event, class_name: "Event"
  belongs_to :user, class_name: "User"
  
  after_create :create_notification

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
end
