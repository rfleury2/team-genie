class Rsvp < ActiveRecord::Base
	belongs_to :membership
	belongs_to :game

	validates_presence_of :game, :membership
	validates_uniqueness_of :game, scope: :membership
end
