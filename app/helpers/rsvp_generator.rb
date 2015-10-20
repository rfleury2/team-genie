module RsvpGenerator
	# Creates RSVPS for all players for a given game
	def self.create_from_game(game)
		game.team.memberships.each do |membership|
			game.rsvps.create(membership: membership)
		end
	end

	# Creates RSVPS for all games for a given player (membership)
	def self.create_from_membership(membership)
		membership.games.each do |game|
			game.rsvps.create(membership: membership)
		end
	end
end