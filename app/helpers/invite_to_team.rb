module InviteToTeam
	def self.call(email, team, inviter)
		if invited_player_is_user?(email)
			return if team.is_member?(@player)
			@player.memberships.create(team: team)
			# TODO: Team invitation mailer
		else
			UserInviter.invite_new_user(team, email, inviter)
		end
	end

	private

	def self.invited_player_is_user?(email)
		@player = User.find_by_email(email)
	end
end
