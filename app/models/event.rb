class Event < ApplicationRecord


  require 'date'

  belongs_to :user
  has_one :menu
  
  
  
  
  validate :valid_date?

  
  validates :user,presence: true
  
  validates :title, presence: true , length: { maximum: 20 }
  validates :content, presence: true , length: { maximum: 20 }
  

  validates :data_ev, presence: true , length: { maximum: 20 }
  
  
  

	def valid_date?
		begin
		Date.strptime(self.data_ev,"%d/%m/%Y") 
		rescue
		errors.add(self.data_ev, "Is not a date") 
		else
			@dat=Date.strptime(self.data_ev,"%d/%m/%Y") 
			if(@dat < Date.today) 
				errors.add(self.data_ev, "is in the past!") 
			end
        end
    end
    
end
