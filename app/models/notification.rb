class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :notified_by, class_name: 'User' 
  
  
  validates :user, :notified_by, :type_not, presence: true
end
