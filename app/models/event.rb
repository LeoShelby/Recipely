class Event < ApplicationRecord


  require 'date'

  belongs_to :user
  has_one :menu ,dependent: :destroy
  
  has_many  :guests , class_name: "Invitation" , foreign_key: "event_id",dependent: :destroy
  has_many  :users , through: :guests ,source: :user
  
  validate :valid_date?

  
  validates :user,presence: true
  
  validates :title, presence: true , length: { maximum: 20 }
  validates :content, presence: true , length: { maximum: 20 }
  validates :location, presence: true , length: { maximum: 20 }
  

  validates :data_ev, presence: true , length: { maximum: 20 }
  
  has_many :notifications, dependent: :destroy
  
  

	def valid_date?
		begin
		Date.strptime(self.data_ev,"%d/%m/%Y") 
		rescue
		errors.add(:data_ev, "Is not a date") 
		else
			@dat=Date.strptime(self.data_ev,"%d/%m/%Y") 
			if(@dat < Date.today) 
				errors.add(:data_ev, "is in the past!") 
			end
        end
    end
    
end
