class Event < ApplicationRecord


  require 'date'

  belongs_to :user
  has_one :menu ,dependent: :destroy
  
  has_many  :invitations
  has_many  :guests , through: :invitations ,source: :user
  
  
  
  validate :valid_date?

  
  validates :user,presence: true
  
  validates :title, presence: true , length: { maximum: 20 }
  validates :content, presence: true , length: { maximum: 200 }
  validates :location, presence: true , length: { maximum: 20 }
  

  validates :data_ev, presence: true 
  
  has_many :notifications, dependent: :destroy
  
  

	def valid_date?
		begin
		Date.strptime(self.data_ev,"%d/%m/%Y") 
		rescue
		errors.add(:data_ev, "is not a date") 
		else
			@dat=Date.strptime(self.data_ev,"%d/%m/%Y") 
			if(@dat < Date.today) 
				errors.add(:data_ev, "is in the past!") 
			end
        end
    end
    
end
