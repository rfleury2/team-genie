class RsvpReminderWorker
	include Sidekiq::Worker

	def self.schedule_reminders(rsvp)
		player = rsvp.membership.player
		# tag:CRUCIAL - rework the timing for actual logic
		RsvpMailer.delay_until(2.minutes.from_now).send_rsvp_request(rsvp, player)
	end
end