class RsvpMailer < ApplicationMailer
	def send_rsvp_request(rsvp, player)
		puts 'it got to the mailer'
		@email = player.email
		@rsvp = rsvp
		@game = rsvp.game

		mail(
			:to => @email,
			:subject => "Don't forget to RSVP to your upcoming game!"
			)
	end
end