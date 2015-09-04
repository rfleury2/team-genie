class Team < ActiveRecord::Base
	# Tasks

	# Associations
	belongs_to :captain, class_name: "User"

	# Validations
	validates_presence_of	:name
end