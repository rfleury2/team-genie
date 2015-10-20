require 'rails_helper'

RSpec.describe Rsvp, type: :model do
	it { should validate_presence_of :game }
	it { should validate_presence_of :membership }
	
	it { should belong_to :game }
	it { should belong_to :membership }

	# TODO: Uniqueness scoped test
end
