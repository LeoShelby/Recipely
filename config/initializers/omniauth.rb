Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
	scope: 'public_profile, email', info_fields: 'id,name,link,email'
	
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_SECRET"],
	scope: 'profile,email', image_aspect_ratio: 'square', image_size: 48, access_type: 'online'
	
end
