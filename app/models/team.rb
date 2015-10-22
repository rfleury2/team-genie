class Team < ActiveRecord::Base
	# Tasks

	# Associations
	belongs_to :captain, class_name: "User"
	has_many :memberships
	has_many :players, through: :memberships
	has_many :invites
	has_many :games

	# Validations
	validates_presence_of	:name

  def is_member?(player)
  	self.memberships.pluck(:player_id).include?(player.id) if player
  end
end