class Relationship < ApplicationRecord
  after_create :create_notification
  
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  #ogni relazione appartiene a due utenti, uno che segue e uno che è seguito
  
  
  
  
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  
  private      
	def create_notification  # per il momento ho fatto questo metodo private, quando avremo altri tipi di notifiche si vedrà, forse ne faccio un altro privato dove serve
		Notification.create(
		  user:  followed,
		  notified_by:  follower,
		  type_not: "following",
		  recipe: nil,
		  read: false
		)
	end
end
