module ApplicationHelper
	def current_user
	  @current_user ||= cookies[:auth_token] && User.find_by(auth_token: cookies[:auth_token])
	end
end
