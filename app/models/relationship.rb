class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  #ogni relazione appartiene a due utenti, uno che segue e uno che è seguito
  
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
