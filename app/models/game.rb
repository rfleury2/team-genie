class Game < ActiveRecord::Base
	has_many :rsvps
	belongs_to :team

	validates_presence_of :time, :team
end
