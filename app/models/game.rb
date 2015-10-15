class Game < ActiveRecord::Base
	belongs_to :team

	validates_presence_of :time, :team
end
