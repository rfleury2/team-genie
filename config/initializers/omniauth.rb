Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Figaro.env.facebook_app_id, Figaro.env.facebook_secret, 
  	info_fields: 'email, name, location'
end

