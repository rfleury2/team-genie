module UserInviter
	def self.invite_new_user(team, email, inviter)
		invite = Invite.new(team: team, email: email, inviter: inviter)
		if invite.save
			InvitationMailer.invite_new_user(invite).deliver_later
		end
	end
end