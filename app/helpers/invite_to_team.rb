module InviteToTeam
	def self.call(email, team, inviter)
		if invited_player_is_user?(email) && !team.is_member?(@player)
			@player.memberships.create(team: team)
			# TeamInvitationMailer
		else
			Invite.create_from_team(team, email, inviter)
			# UserInvite
		end
	end

	def self.generate_memberships(player)
		invites = Invite.where({email: player.email})
		return if invites.empty?
		invites.each do |invite|
			Membership.create(team: invite.team, player: player)
		end
	end

	private

	def self.invited_player_is_user?(email)
		@player = User.find_by_email(email)
	end
end
