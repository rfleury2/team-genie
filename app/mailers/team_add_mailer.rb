class TeamAddMailer < ApplicationMailer
	def send_add_player_to_team(membership)
		@invitee = membership.player
		@captain = membership.team.captain
		@team = membership.team

		mail(
			:to => @invitee.email,
			:subject => "You have been added to #{@team.name} by #{@captain.name}"
			)
	end
end