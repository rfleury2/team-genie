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

	# Image upload
	has_attached_file :avatar, styles: { medium: "300x300>" }, default_url: "/images/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def is_member?(player)
  	self.memberships.pluck(:player_id).include?(player.id) if player
  end
end