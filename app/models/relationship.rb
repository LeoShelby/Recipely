class Relationship < ApplicationRecord
  after_create :create_notification
  
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  #ogni relazione appartiene a due utenti, uno che segue e uno che è seguito
  
  
  after_create :badge_level_up
  after_destroy :badge_level_down
  
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  
  private      
	def create_notification 
		Notification.create(
		  user:  followed,
		  notified_by:  follower,
		  type_not: "following",
		  recipe: nil,
		  read: false
		)
	end
	
	
	#chiamo il metodo comune a tutti i badges nel model application_record  SUPERDRY
    def badge_level_up
		badge_level_up_aux("Birdman","bird","following","follower")  #devo passare il parametro follower poichè non si chiama "user" come negli altri casi di badges
	end
	
    def badge_level_down
		badge_level_down_aux("Birdman","bird","following","follower")
	end
	
	
	
end
