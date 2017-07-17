class Invitation < ApplicationRecord
  belongs_to :event, class_name: "Event"
  belongs_to :user, class_name: "User"
  
  validates :user,presence: true
end
