class Membership < ActiveRecord::Base
	has_many :games, through: :membership
	belongs_to :player, class_name: "User"
	belongs_to :team


	validates_presence_of :team, :player

	def self.create_captain_membership(team, player_captain)
		Membership.create(team: team, player: player_captain, role: "captain")
	end
end
