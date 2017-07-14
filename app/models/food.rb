class Food < ApplicationRecord
	include HTTParty
	#https://api.nal.usda.gov/ndb/list?format=json&lt=f&sort=n&api_key=DEMO_KEY
	
	
	def self.find1(item)
		#va bene anche senza HTTParty
		HTTParty.get("https://api.nal.usda.gov/ndb/list?format=json&lt=f&sort=n&api_key=rlxbi8ZQBNDsqlLLFR4Q6HBWO5Yplv0mwZ9Xed5h").parsed_response
	end
	
	




end
