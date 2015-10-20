class Game < ActiveRecord::Base
	has_many :rsvps, dependent: :destroy
	belongs_to :team

	validates_presence_of :time, :team
end
