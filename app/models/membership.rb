class Membership < ActiveRecord::Base
	belongs_to :player, class_name: "User"
	belongs_to :team

	validates_presence_of :team, :player
end
