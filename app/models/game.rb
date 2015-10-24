class Game < ActiveRecord::Base
	has_many :rsvps, dependent: :destroy
	belongs_to :team

	validates_presence_of :time, :team

	scope :upcoming, -> { where('time >= ?', Time.now).order(:time) }
	scope :past, -> { where('time <= ?', Time.now, order(:time)) }
end
