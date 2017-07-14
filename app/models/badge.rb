class Badge < ApplicationRecord
  belongs_to :user
  after_create :create_notification

  private
	  def create_notification
		Notification.create(
		  user: user,
		  badge: self,
		  type_not: "badge",
		  read: false
		)
		end

end
