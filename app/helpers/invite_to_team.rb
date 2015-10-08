module InviteToTeam
	def self.call(email, team, inviter)
		if invited_player_is_user?(email) && !team.is_member?(@player)
			membership = @player.memberships.create(team: team)
			# TeamInvitationMailer.send_invitation(membership)
		else
			UserInviter.invite_new_user(team, email, inviter)
			# UserInvite
		end
	end

	private

	def self.invited_player_is_user?(email)
		@player = User.find_by_email(email)
	end
end
