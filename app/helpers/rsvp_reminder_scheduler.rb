module RsvpReminderScheduler
	def self.schedule_reminders(rsvp)
		player = rsvp.membership.player
		RsvpMailer.send_rsvp_request(rsvp, player).deliver_later
		# RsvpMailer.delay_until(3.minutes.from_now).send_rsvp_request(rsvp, player)
	end
end
