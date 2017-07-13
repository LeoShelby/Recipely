class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :notified_by, class_name: 'User' 
  belongs_to :recipe, optional: true   #optional è necessario, altrimenti il belongd_to di default obbliga ad avere una ricetta non nil nella notifica
                                       #ma una notifica di follow non ha nessuna ricetta associata ovviamente
  
  validates :user, :notified_by, :type_not, presence: true
end
