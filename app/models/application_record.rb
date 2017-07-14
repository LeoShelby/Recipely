class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  
  
  def badge_level_up_aux(type_badge,type_pic,type_model)
  
			if !(user.badges.find_by(type_bad: type_badge).nil?)    #se ho già il badge devo solo vedere se va aggiornato al livello superiore
				badge=user.badges.find_by(type_bad: type_badge)
				if user.send(type_model).count >=3
					badge.update_attribute(:level , "3")
				elsif user.send(type_model).count >=2
					badge.update_attribute(:level , "2")
				elsif user.send(type_model).count >=1
					badge.update_attribute(:level , "1")
				end
			else 
				if user.recipes.count >= 1       #se non ho già un badge e ho messo più di 10 like ottengo il badge di livello 1
					Badge.create(
					  user:  user,
					  type_bad: type_badge,
					  level: 1,
					  picture: type_pic+".png"
					)
				end
			end
	
	end 
	
	def badge_level_down_aux(type_badge,type_pic,type_model)
		if !(user.badges.find_by(type_bad: type_badge).nil?)    #se ho già il badge devo solo vedere se va aggiornato al livello inferiore
			badge=user.badges.find_by(type_bad: type_badge)
			if user.send(type_model).count==0
				badge.update_attribute(:level , "0")         #se togli tutti i like arrivi al livello zero
			elsif user.send(type_model).count < 2
				badge.update_attribute(:level , "1")
			elsif user.send(type_model).count < 3
				badge.update_attribute(:level , "2")
	        end
	    end
	end
end
