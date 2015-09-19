class InvitationMailer < ApplicationMailer
	def send_invitation(invite)
		@user = invite.inviter
		@team = invite.team
		@email = invite.email

		mail(
			:to => @email,
			:subject => "You have been invited to join #{@team.name}"
			)
	end
end
