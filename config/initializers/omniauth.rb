Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '108785323100237', 'c3e43e0bfbc83ed0de237e69c3da8d09',
	scope: 'public_profile, email', info_fields: 'id,name,link,email'
	
  provider :google_oauth2, '588534268977-cktoeobj21nrpl3rhunsu7vtre3hcth9.apps.googleusercontent.com', 'x-EFw88ZshP9gkaTMApSEvcR',
	scope: 'profile,email', image_aspect_ratio: 'square', image_size: 48, access_type: 'online'
	
end
