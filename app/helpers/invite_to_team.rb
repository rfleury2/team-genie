module InviteToTeam
	def self.call(email, team, inviter)
		if invited_player_is_user?(email)
			return if team.is_member?(@player)
			membership = @player.memberships.create(team: team)
			RsvpGenerator.create_from_membership(membership)
			TeamAddMailer.send_add_player_to_team(membership).deliver_now
		else
			UserInviter.invite_new_user(team, email, inviter)
		end
	end

	private

	def self.invited_player_is_user?(email)
		@player = User.find_by_email(email)
	end
end
