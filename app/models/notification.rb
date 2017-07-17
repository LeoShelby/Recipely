class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :notified_by, class_name: 'User' , optional: true
  belongs_to :recipe, optional: true   #optional è necessario, altrimenti il belongd_to di default obbliga ad avere una ricetta non nil nella notifica
                                       #ma una notifica di follow non ha nessuna ricetta associata ovviamente
  belongs_to :badge, optional: true
  
  belongs_to :event, optional: true
  
  validates :user,:type_not, presence: true
end
